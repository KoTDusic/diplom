using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class NewDiscipline :Discipline
    {
        [Required]
        [Display(Name = "Новое название дисциплины")]
        public string new_discipline_name { get; set; }
    }
}