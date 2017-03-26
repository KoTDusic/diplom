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
                        element.teacherName = reader["Преподаватель"].ToString();
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
        public static List<LabProgress> getPeopleLabList(TeacherWork user, bool for_subgroup = false)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from LAB_LIST WHERE \"Преподаватель\" = :teacher AND \"Наименование_дисциплины\"=:discipline";
                List<OracleParameter> parametrs = new List<OracleParameter>();
                parametrs.Add(new OracleParameter()
                {
                    ParameterName = "teacher",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = user.teacherName
                });
                parametrs.Add(new OracleParameter()
                {
                    ParameterName = "discipline",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = user.disciplineName
                });
                if(for_subgroup)
                {
                    command.CommandText += " AND \"Код_подгруппы\"=:group_code";
                    parametrs.Add(new OracleParameter()
                    {
                        ParameterName = "group_code",
                        Direction = ParameterDirection.Input,
                        OracleDbType = OracleDbType.Varchar2,
                        Value = user.subgroopCode
                    });
                }
                command.Parameters.AddRange(parametrs.ToArray());
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<LabProgress> result = new List<LabProgress>();
                    LabProgress element;
                    while (reader.Read())
                    {
                        element = new LabProgress();
                        element.studentCode = Convert.ToInt32(reader["Код_студента"].ToString());
                        element.specialityCode = reader["Код_специальности"].ToString();
                        element.disciplineName = reader["Наименование_дисциплины"].ToString();
                        element.disciplineCode = Convert.ToInt32(reader["Код_дисциплины"]);
                        element.teacherName = reader["Преподаватель"].ToString();
                        element.studentName = reader["Студент"].ToString();
                        element.coors = Convert.ToInt32(reader["Курс"]);
                        element.subgroopCode = Convert.ToInt32(reader["Код_подгруппы"]);
                        element.subgroopNumber = Convert.ToInt32(reader["Номер_подгруппы"]);
                        element.groupNumber = Convert.ToInt32(reader["Номер_группы"]);
                        element.labName = reader["Название_лабораторной"].ToString();
                        element.labStatus = reader["Статус_сдачи"].ToString();
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