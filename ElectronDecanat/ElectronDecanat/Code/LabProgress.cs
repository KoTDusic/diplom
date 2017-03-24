using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Code
{
    public enum LabStatus{Complete,NotComlete,Wait,Error}
    public class LabProgress
    {
        public int studentCode;
        public string specialityCode; 
        public string disciplineName;
        public string teacherName;
        public string studentName;
        public int coors;
        public int subgroopCode;
        public int subgroopNumber;
        public int groupNumber;
        public string labName;
        public LabStatus labStatus;
        public static string GetStatusText(LabStatus status)
        {
            switch (status)
            {
                case LabStatus.Complete: return "Сдано";
                case LabStatus.NotComlete: return "Не сдано";
                case LabStatus.Wait: return "Проверяется";
                default: return "Ошибка";
            }
        }
        public static LabStatus GetStatusFromText(string status)
        {
            switch (status)
            {
                case "Сдано": return LabStatus.Complete;
                case "Не сдано": return LabStatus.NotComlete;
                case "Проверяется": return LabStatus.Wait;
                default: return LabStatus.Error;
            }
        }
    }
}