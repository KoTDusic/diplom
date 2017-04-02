using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Speciality
    {
        public int faculty_code{get;set;}
        [Required]
        [Display(Name = "Код специальности")]
        public string speciality_code{get;set;}
        [Required]
        [Display(Name = "Специальность")]
        public string speciality_name{get;set;}
        [Required]
        [Display(Name = "Факультет")]
        public string faculty_name { get; set; }
        [Required]
        [Display(Name = "Новое название специальности")]
        public string new_speciality_name { get; set; }
    }
}