using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public class Lab
    {
        [Display(Name = "Дисциплина")]
        public string discipline { get; set; }
        [Display(Name = "Лабораторная")]
        public string oldLabName { get; set; }
        [Display(Name = "Новое название лабораторной")]
        public string newLabName { get; set; }
    }
}