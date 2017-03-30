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
        public static List<string> getTeacherDisciplines(string name)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select \"Наименование_дисциплины\" from \"TEACHER_DISCIPLINE\" where \"Преподаватель\" = :name";
                OracleParameter name_param = new OracleParameter()
                {
                    ParameterName = "name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = name
                };
                command.Parameters.Add(name_param);
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<string> disciplines = new List<string>();
                    while (reader.Read())
                    {
                        disciplines.Add(reader["Наименование_дисциплины"].ToString());
                    }
                    return disciplines;
                }
            }
        }
        public static bool AddLab(Lab lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_LAB";
                OracleParameter discipline_name = new OracleParameter()
                {
                    ParameterName = "discipline_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.discipline
                };
                OracleParameter lab_name = new OracleParameter()
                {
                    ParameterName = "lab_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.newLabName
                };
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                try
                {
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
        }
        public static bool EditLab(Lab lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "EDIT_LAB";
                OracleParameter discipline_name = new OracleParameter()
                {
                    ParameterName = "discipline_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.discipline
                };
                OracleParameter lab_name = new OracleParameter()
                {
                    ParameterName = "lab_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.oldLabName
                };
                OracleParameter new_lab_name = new OracleParameter()
                {
                    ParameterName = "new_lab_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.newLabName
                };
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                command.Parameters.Add(new_lab_name);
                try
                {
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
        public static bool RemoveLab(Lab lab)
        {
             OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_LAB";
                OracleParameter discipline_name = new OracleParameter()
                {
                    ParameterName = "discipline_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.discipline
                };
                OracleParameter lab_name = new OracleParameter()
                {
                    ParameterName = "lab_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.oldLabName
                };
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                try
                {
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
        }
        public static List<Lab> getLabInDiscipline(string discipline)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from \"LABS_DISCIPLINE\" where \"Наименование_дисциплины\" = :discipline";
                OracleParameter discipline_param = new OracleParameter()
                {
                    ParameterName = "discipline",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = discipline
                };
                command.Parameters.Add(discipline_param);
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Lab> labs = new List<Lab>();
                    while (reader.Read())
                    {
                        labs.Add(new Lab 
                        { 
                            oldLabName = reader["Название_лабораторной"].ToString(),
                            discipline = discipline
                        });
                    }
                    return labs;
                }
            }
        }
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
                catch(Exception)
                {
                    return false;
                }
            }
        }

        public static bool UpdateLab(LabProgress lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SET_PROGRESS";// WHERE AGES < :max_ages;";
                //discipline_code teacher_name student_code lab_name status
                OracleParameter discipline_code = new OracleParameter()
                {
                    ParameterName = "discipline_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = lab.disciplineCode
                };
                OracleParameter teacher_name = new OracleParameter()
                {
                    ParameterName = "teacher_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.teacherName
                };
                OracleParameter student_code = new OracleParameter()
                {
                    ParameterName = "student_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = lab.studentCode
                };
                OracleParameter lab_name = new OracleParameter()
                {
                    ParameterName = "lab_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.labName
                };
                OracleParameter status = new OracleParameter()
                {
                    ParameterName = "status",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.labStatus
                };
                command.Parameters.Add(discipline_code);
                command.Parameters.Add(teacher_name);
                command.Parameters.Add(student_code);
                command.Parameters.Add(lab_name);
                command.Parameters.Add(status);
                try
                {
                    command.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }
}