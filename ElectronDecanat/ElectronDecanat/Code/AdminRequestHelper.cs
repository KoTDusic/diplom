using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public static class AdminRequestHelper
    {
        public static List<Faculty> getFaculties()
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from FACULTY_LIST";
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Faculty> facultys = new List<Faculty>();
                    while (reader.Read())
                    {
                        facultys.Add(new Faculty
                        {
                            Name = reader["Название_факультета"].ToString(),
                        });
                    }
                    return facultys;
                }
            }
        }
        public static List<Speciality> getSpecialitys(string faculty)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from SPECIALITY_LIST where \"Название_факультета\"=:name";
                OracleParameter name_param = new OracleParameter()
                {
                    ParameterName = "name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty
                };
                command.Parameters.Add(name_param);
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Speciality> specyalitys = new List<Speciality>();
                    while (reader.Read())
                    {
                        specyalitys.Add(new Speciality
                        {
                            faculty_name = reader["Название_факультета"].ToString(),
                            faculty_code = Convert.ToInt32(reader["Код_факультета"].ToString()),
                            speciality_code = reader["Код_специальности"].ToString(),
                            speciality_name = reader["Имя_специальности"].ToString()
                        });
                    }
                    return specyalitys;
                }
            }
        }
        public static void AddFaculty(Faculty faculty)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_FACULTY";
                OracleParameter new_faculty = new OracleParameter()
                {
                    ParameterName = "new_faculty",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty.Name
                };
                command.Parameters.Add(new_faculty);
                command.ExecuteNonQuery();
            }
        }
        public static void EditFaculty(Faculty faculty)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "EDIT_FACULTY";
                OracleParameter old_name = new OracleParameter()
                {
                    ParameterName = "old_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty.Name
                };
                OracleParameter new_name = new OracleParameter()
                {
                    ParameterName = "new_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty.NewName
                };
                command.Parameters.Add(old_name);
                command.Parameters.Add(new_name);
                command.ExecuteNonQuery();
            }
        }
        public static void DeleteFaculty(Faculty faculty)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_FACULTY";
                OracleParameter removing_faculty = new OracleParameter()
                {
                    ParameterName = "new_faculty",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty.Name
                };
                command.Parameters.Add(removing_faculty);
                command.ExecuteNonQuery();
            }
        }
    }
}