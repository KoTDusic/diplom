using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectronDecanat.Code
{
    public enum LabStatus{Complete,NotComlete,Wait,Error}
    public class LabProgress
    {
        public int studentCode { get; set; }
        public string specialityCode { get; set; }
        [Display(Name = "Дисциплина")]
        public string disciplineName { get; set; }
        public int disciplineCode { get; set; }
        [Display(Name = "Преподаватель")]
        public string teacherName {get;set;}
        [Display(Name = "Студент")]
        public string studentName { get; set; }
        public int coors { get; set; }
        public int subgroopCode { get; set; }
        public int subgroopNumber { get; set; }
        public int groupNumber { get; set; }
        [Display(Name = "Лабораторная")]
        public string labName { get; set; }
        private LabStatus status;
        [Required]
        [Display(Name = "Статус лабораторной")]
        public string labStatus
        {
            get 
            {
                switch (status)
                {
                    case LabStatus.Complete: return "Сдано";
                    case LabStatus.NotComlete: return "Не сдано";
                    case LabStatus.Wait: return "Проверяется";
                    default: return "Ошибка";
                }
            }
            set
            {
                switch(value)
                {
                    case "Сдано": status = LabStatus.Complete;
                        break;
                    case "Не сдано": status = LabStatus.NotComlete;
                        break;
                    case "Проверяется": status = LabStatus.Wait;
                        break;
                    default: status = LabStatus.Error;
                        break;
                }
            }
        }
        public IEnumerable<SelectListItem> Statuses { get; set; }
        public static IEnumerable<string> GetAllStatus()
        {
            return new List<string>
            {
                "Сдано",
                "Не сдано",
                "Проверяется"
            };
        }
    }
}