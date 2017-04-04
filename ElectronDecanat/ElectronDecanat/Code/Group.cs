using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Group
    {
        [Required]
        
        public int group_code { get; set; }
        [Required]
        [Display(Name = "Факультет")]
        public string faculty_name { get; set; }
        [Required]
        [Display(Name = "Специальность")]
        public string speciality_name { get; set; }
        [Required]
        [Display(Name = "Код специальности")]
        public string speciality_code { get; set; }
        [Display(Name = "Курс")]
        public int coors { get; set; }
        [Required]
        [Display(Name = "Год поступления")]
        public int year { get; set; }
        [Required]
        [Display(Name = "Номер группы")]
        public int group_number { get; set; }
        public int subgroups_count { get; set; }
    }
}