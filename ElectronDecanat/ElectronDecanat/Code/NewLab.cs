using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class NewLab :Lab
    {
        [Required]
        [Display(Name = "Новое название лабораторной")]
        public string new_lab_name { get; set; }
    }
}