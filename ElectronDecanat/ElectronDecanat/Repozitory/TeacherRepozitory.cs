﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using ElectronDecanat.Models;
using System.Web.Mvc;
using ElectronDecanat.Code;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace ElectronDecanat.Repozitory
{
    public class TeacherRepozitory
    {
        public List<Teacher> GetAll(ApplicationUserManager UserManager)
        {
            
            return UserManager.Users.ToList().Where(
                (user) => { if (UserManager.IsInRole(user.Id, "teacher")) return true; else return false; }
                    ).Select(e => new Teacher { id=e.Id,email=e.Email, username=e.UserName }).ToList();
        }
        public NewTeacher Get(ApplicationUserManager UserManager,string id)
        {
            ApplicationUser user = UserManager.FindById(id);
            return new NewTeacher { id = user.Id, username = user.UserName, email = user.Email }; 
        }
        public void Delete(ApplicationUserManager UserManager, Teacher teacher)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "REMOVE_TEACHER";
                OracleParameter identifer_parameter = new OracleParameter()
                {
                    ParameterName = "identificator",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = teacher.id
                };
                command.Parameters.Add(identifer_parameter);
                command.ExecuteNonQuery();
                UserManager.Delete(UserManager.FindById(teacher.id));
            }
        }
        public void Update(ApplicationUserManager UserManager, NewTeacher teacher)
        {
            OracleConnection connection = SingltoneConnection.GetInstance();
            using (OracleCommand command = connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "EDIT_TEACHER";
                OracleParameter identifer_parameter = new OracleParameter()
                {
                    ParameterName = "identificator",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = teacher.id
                };
                OracleParameter new_fio_parameter = new OracleParameter()
                {
                    ParameterName = "new_fio",
                    Direction = ParameterDirection.Input,
                    OracleDbType = OracleDbType.Varchar2,
                    Value = teacher.new_username
                };
                command.Parameters.Add(new_fio_parameter);
                command.Parameters.Add(identifer_parameter);
                command.ExecuteNonQuery();
                ApplicationUser user = UserManager.FindById(teacher.id);
                user.UserName = teacher.new_username;
                UserManager.Update(user);
            }
        }
    }
}