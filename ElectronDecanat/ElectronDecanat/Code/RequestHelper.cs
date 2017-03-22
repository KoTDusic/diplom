using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ElectronDecanat.Code;
using Oracle.ManagedDataAccess.Client;
using System.Data;


namespace ElectronDecanat.Code
{
    public class RequestHelper
    {
        public List<TeacherWork> getTeacherWork()
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = @"select * from TEACHER_DISCIPLINE_LIST";// WHERE AGES < :max_ages;";
                /* OracleParameter maxAges = new OracleParameter()
                {
                  ParameterName = "max_ages",
                  Direction = ParameterDirection.Input,
                  OracleDbType = OracleDbType.Decimal,
                  Value = 27
                };

                command.Parameters.Add(maxAges);
                */
                using(OracleDataReader reader = command.ExecuteReader())
                {
                    List<TeacherWork> result=new List<TeacherWork>();
                    TeacherWork element;
                    while (reader.Read())
                    {
                        element=new TeacherWork();
                        //, , , , 
                        element.teacherNamel = reader["Преподаватель"].ToString();
                        element.specialityCode = reader["Код_специальности"].ToString();
                        element.specialityName = reader["Имя_специальности"].ToString();
                        element.disciplineName = reader["Наименование_дисциплины"].ToString();
                        element.coors = Convert.ToInt32(reader["Курс"]);
                        element.year = Convert.ToInt32(reader["Год_поступления"]);
                        element.groupNumber = Convert.ToInt32(reader["Номер_группы"]);
                        element.subgroopNumber = Convert.ToInt32(reader["Номер_подгруппы"]);
                        element.subgroopCode = Convert.ToInt32(reader["Код_подгруппы"]);
                        element.coors = Convert.ToInt32(reader["Номер_подгруппы"]);
                        result.Add(element);
                    }
                    return result;
                }
            }

        }
    }
}