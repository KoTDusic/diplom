using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class NewSpeciality :Speciality
    {
        public NewSpeciality() { }
        public NewSpeciality(Speciality item)
        {
            faculty_code = item.faculty_code;
            id = item.id;
            speciality_number = item.speciality_number;
            speciality_name = item.speciality_name;
            faculty_name = item.faculty_name;
            group_count = item.group_count;
        }
        [Required]
        [Display(Name = "Новый номер специальности")]
        public int new_speciality_number { get; set; }
        [Required]
        [Display(Name = "Новое название специальности")]
        public string new_speciality_name { get; set; }
    }
}