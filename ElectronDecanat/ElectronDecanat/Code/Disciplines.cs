using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Disciplines
    {
        [Required]
        [Display(Name = "Факультет")]
        public string facultyName { get; set; }
        [Required]
        [Display(Name = "Код специальности")]
        public string specialityCode { get; set; }
        [Required]
        [Display(Name = "Специальность")]
        public string specialityName { get; set; }
        public int disciplineCode { get; set; }
        [Required]
        [Display(Name = "Дисциплина")]
        public string disciplineName { get; set; }
    }
}