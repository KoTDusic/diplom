using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ElectronDecanat.Code;
using Oracle.ManagedDataAccess.Client;
using System.Data;


namespace ElectronDecanat.Code
{
    public static class RequestHelper
    {
        private static string LastError;
        public static string GetLastError() { return LastError; }
        public static List<TeacherWork> getTeacherWork(string id)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from TEACHER_DISCIPLINE_LIST WHERE \"Код_преподавателя\" = :id";
                 OracleParameter idenitificator = new OracleParameter()
                {
                  ParameterName = "id",
                  Direction = ParameterDirection.Input,
                  OracleDbType = OracleDbType.Varchar2,
                  Value = id
                };
                command.Parameters.Add(idenitificator);
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
        public static bool RegistrationTeacher(string FIO, string id)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_TEACHER";// WHERE AGES < :max_ages;";
                OracleParameter fio_oracle = new OracleParameter()
                {
                  ParameterName = "fio",
                  Direction = ParameterDirection.Input,
                  OracleDbType = OracleDbType.Varchar2,
                  Value = FIO
                };
                 OracleParameter id_oracle = new OracleParameter()
                {
                  ParameterName = "identificator",
                  Direction = ParameterDirection.Input,
                  OracleDbType = OracleDbType.Varchar2,
                  Value = id
                };
                command.Parameters.Add(fio_oracle);
                command.Parameters.Add(id_oracle);
                try
                {
                    command.ExecuteNonQuery();
                    return true;
                }
                catch(Exception e)
                {
                    LastError = e.Message;
                    return false;
                }
                
            }
        }
    }
}