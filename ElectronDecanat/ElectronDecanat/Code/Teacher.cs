using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Teacher
    {
        public string id { get; set; }
        [Display(Name = "Преподаватель")]
        public string username { get; set; }
        [Display(Name = "Email")]
        public string email { get; set; }
    }
}