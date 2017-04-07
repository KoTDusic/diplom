using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Work
    {
        public int id{get;set;}
        public int discipline_id { get; set; }
        public int subgroup_id{get;set;}
	    public string teacher_id{get;set;}
        public string teacher_name{get;set;}
        public string discipline_name{get;set;}
        public string speciality_name{get;set;}
        public int speciality_number { get; set; }
        public string faculty_name { get; set; }
        public int coors{get;set;}
        public int group_number{get;set;}
        public int subgroup_number{get;set;}
    }
}