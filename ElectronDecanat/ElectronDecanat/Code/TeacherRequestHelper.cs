using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ElectronDecanat.Code;
using Oracle.ManagedDataAccess.Client;
using System.Data;


namespace ElectronDecanat.Code
{
    public static class TeacherRequestHelper
    {
        public static List<Discipline> getTeacherDisciplines(string name)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select \"Наименование_дисциплины\",\"Имя_специальности\",\"Код_дисциплины\" from \"TEACHER_DISCIPLINE\" where \"ФИО\" = :name";
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
                    List<Discipline> disciplines = new List<Discipline>();
                    while (reader.Read())
                    {
                        disciplines.Add(new Discipline
                        {
                            discipline_name = reader["Наименование_дисциплины"].ToString(),
                            id = Convert.ToInt32(reader["Код_дисциплины"].ToString()),
                            speciality_name = reader["Имя_специальности"].ToString()
                        } );
                    }
                    return disciplines;
                }
            }
        }
        public static void AddLab(Lab lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_LAB";
                OracleParameter speciality_name = new OracleParameter()
                {
                    ParameterName = "speciality_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.speciality
                };
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
                command.Parameters.Add(speciality_name);
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                command.ExecuteNonQuery();
            }
        }
        public static void EditLab(Lab lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "EDIT_LAB";
                OracleParameter speciality_name = new OracleParameter()
                {
                    ParameterName = "speciality_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.speciality
                };
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
                command.Parameters.Add(speciality_name);
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                command.Parameters.Add(new_lab_name);
                command.ExecuteNonQuery();
            }
        }
        public static void RemoveLab(Lab lab)
        {
             OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_LAB";
                OracleParameter speciality_name = new OracleParameter()
                {
                    ParameterName = "speciality_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = lab.speciality
                };
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
                command.Parameters.Add(speciality_name);
                command.Parameters.Add(discipline_name);
                command.Parameters.Add(lab_name);
                command.ExecuteNonQuery();
            }
        }
        public static List<Lab> getLabInDiscipline(string discipline, string speciality)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from LABS_DISCIPLINE where \"Наименование_дисциплины\" = '" + discipline + "' AND \"Имя_специальности\"= '" + speciality + "'";
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Lab> labs = new List<Lab>();
                    while (reader.Read())
                    {
                        labs.Add(new Lab 
                        { 
                            oldLabName = reader["Название_лабораторной"].ToString(),
                            discipline = discipline,
                            speciality = speciality
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
                    while (reader.Read())
                    {
                        result.Add(new TeacherWork
                        {
                            teacher_name = reader["Преподаватель"].ToString(),
                            speciality_id = Convert.ToInt32(reader["Код_специальности"].ToString()),
                            speciality_code = reader["Номер_специальности"].ToString(),
                            speciality_name = reader["Имя_специальности"].ToString(),
                            discipline_name = reader["Наименование_дисциплины"].ToString(),
                            coors = Convert.ToInt32(reader["Курс"]),
                            year = Convert.ToInt32(reader["Год_поступления"]),
                            group_number = Convert.ToInt32(reader["Номер_группы"]),
                            subgroop_number = Convert.ToInt32(reader["Номер_подгруппы"]),
                            subgroop_code = Convert.ToInt32(reader["Код_подгруппы"])
                        });
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
                    Value = user.teacher_name
                });
                parametrs.Add(new OracleParameter()
                {
                    ParameterName = "discipline",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = user.discipline_name
                });
                if(for_subgroup)
                {
                    command.CommandText += " AND \"Код_подгруппы\"=:group_code";
                    parametrs.Add(new OracleParameter()
                    {
                        ParameterName = "group_code",
                        Direction = ParameterDirection.Input,
                        OracleDbType = OracleDbType.Varchar2,
                        Value = user.subgroop_code
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
                command.CommandText = "ADD_TEACHER";
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
                catch
                {
                    return false;
                }
                
            }
        }
        public static void UpdateLab(LabProgress lab)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "SET_PROGRESS";
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
                command.ExecuteNonQuery();
            }
        }
    }
}