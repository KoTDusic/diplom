using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Faculty
    {
        [Required]
        [Display(Name = "Факультет")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Новое название")]
        public string NewName { get; set; }
    }
}