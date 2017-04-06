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
        /*#region GROOPS
        public static List<Group> getGroops(string faculty_name, string speciality_code)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from KOORS_LIST where \"Факультет\"=:faculty_name AND \"Код_специальности\"=:speciality_code";
                OracleParameter faculty_name_param = new OracleParameter()
                {
                    ParameterName = "faculty_name",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = faculty_name
                };
                OracleParameter speciality_code_param = new OracleParameter()
                {
                    ParameterName = "speciality_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = speciality_code
                };
                command.Parameters.Add(faculty_name_param);
                command.Parameters.Add(speciality_code_param);
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Group> groups = new List<Group>();
                    while (reader.Read())
                    {
                        groups.Add(new Group
                        {
                            group_code = Convert.ToInt32(reader["Код_группы"].ToString()),
                            faculty_name = reader["Факультет"].ToString(),
                            speciality_name = reader["Специальность"].ToString(),
                            speciality_code = reader["Код_специальности"].ToString(),
                            coors = Convert.ToInt32(reader["Курс"].ToString()),
                            year = Convert.ToInt32(reader["Год_поступления"].ToString()),
                            group_number = Convert.ToInt32(reader["Номер_группы"].ToString()),
                            subgroups_count = Convert.ToInt32(reader["Подгрупп"].ToString())
                        });
                    }
                    return groups;
                }
            }
        }
        public static void AddGroup(Group group)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_GROUP";
                OracleParameter speciality_code_param = new OracleParameter()
                {
                    ParameterName = "speciality_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.speciality_code
                };
                OracleParameter age_param = new OracleParameter()
                {
                    ParameterName = "age",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.year
                };
                OracleParameter group_number_param = new OracleParameter()
                {
                    ParameterName = "group_number",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.group_number
                };
                command.Parameters.Add(speciality_code_param);
                command.Parameters.Add(age_param);
                command.Parameters.Add(group_number_param);
                command.ExecuteNonQuery();
            }
        }
        public static void DeleteGroup(Group group)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_GROUP";
                OracleParameter speciality_code_param = new OracleParameter()
                {
                    ParameterName = "speciality_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.speciality_code
                };
                OracleParameter age_param = new OracleParameter()
                {
                    ParameterName = "age",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.year
                };
                OracleParameter group_number_param = new OracleParameter()
                {
                    ParameterName = "group_number",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group.group_number
                };
                command.Parameters.Add(speciality_code_param);
                command.Parameters.Add(age_param);
                command.Parameters.Add(group_number_param);
                command.ExecuteNonQuery();
            }
        }
        #endregion*/
        /*#region SUBGROUPS
        public static List<Subgroup> getSubgroups(int group_code)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.Text;
                command.CommandText = "select * from SUBGROUP_LIST where \"Код_группы\"=:code";
                OracleParameter group_code_param = new OracleParameter()
                {
                    ParameterName = "code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = group_code
                };
                command.Parameters.Add(group_code_param);
                using (OracleDataReader reader = command.ExecuteReader())
                {
                    List<Subgroup> subgroups = new List<Subgroup>();
                    while (reader.Read())
                    {
                        subgroups.Add(new Subgroup
                        {
                            id=Convert.ToInt32(reader["Код_группы"].ToString()),
                            faculty_name = reader["Факультет"].ToString(),
                            speciality_name = reader["Специальность"].ToString(),
                            speciality_number = Convert.ToInt32(reader["Код_специальности"].ToString()),
                            coors = Convert.ToInt32(reader["Курс"].ToString()),
                            year = Convert.ToInt32(reader["Год_поступления"].ToString()),
                            group_number = Convert.ToInt32(reader["Номер_группы"].ToString()),
                            subgroup_number = Convert.ToInt32(reader["Номер_подгруппы"].ToString()),
                            peoples_count = Convert.ToInt32(reader["Студентов"].ToString())
                        });
                    }
                    return subgroups;
                }
            }
        }
        public static void AddSubgroup(Subgroup subgroup)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "ADD_SUBGROUP";
                OracleParameter group_code_param = new OracleParameter()
                {
                    ParameterName = "group_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = subgroup.id
                };
                OracleParameter subgroup_number_param = new OracleParameter()
                {
                    ParameterName = "subgroup_number",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = subgroup.subgroup_number
                };
                command.Parameters.Add(group_code_param);
                command.Parameters.Add(subgroup_number_param);
                command.ExecuteNonQuery();
            }
        }
        public static void DeleteSubgroup(Subgroup subgroup)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_SUBGROUP";
                OracleParameter group_code_param = new OracleParameter()
                {
                    ParameterName = "group_code",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = subgroup.id
                };
                OracleParameter subgroup_number_param = new OracleParameter()
                {
                    ParameterName = "subgroup_number",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Int32,
                    Value = subgroup.subgroup_number
                };
                command.Parameters.Add(group_code_param);
                command.Parameters.Add(subgroup_number_param);
                command.ExecuteNonQuery();
            }
        }
        #endregion*/
    }
}