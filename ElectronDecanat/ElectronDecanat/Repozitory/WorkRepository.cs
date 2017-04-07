using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ElectronDecanat.Code;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Web.Mvc;

namespace ElectronDecanat.Repozitory
{
    public class WorkRepository : IRepository<Work, Work>
    {
        public IEnumerable<Work> GetAll(string querry = null)
        {
            throw new NotImplementedException();
        }
        public Work Get(int id)
        {
            throw new NotImplementedException();
        }

        public void Create(Work item)
        {
            throw new NotImplementedException();
        }

        public void Update(Work item)
        {
            throw new NotImplementedException();
        }
        public void Delete(int id)
        {
            
        }
        public List<SelectListItem> GetTeachers()
        { 
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from \"Дисциплина\"";
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<SelectListItem> result = new List<SelectListItem>();
                    while (reader.Read())
                    {
                        result.Add(new SelectListItem
                        {
                            Value = reader["Код_дисциплины"].ToString(),
                            Text = reader["Наименование_дисциплины"].ToString()
                        });
                    }
                    return result;
                }
            }
        }
        public List<SelectListItem> GetDisciplinesFromSpecialityId(int id)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from \"Преподаватель\"";
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<SelectListItem> result = new List<SelectListItem>();
                    while (reader.Read())
                    {
                        result.Add(new SelectListItem
                        {
                            Value = reader["Код_преподавателя"].ToString(),
                            Text = reader["ФИО"].ToString()
                        });
                    }
                    return result;
                }
            }
        }
    }
}