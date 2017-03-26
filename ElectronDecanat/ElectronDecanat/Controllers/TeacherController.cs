using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronDecanat.Code;
using Microsoft.AspNet.Identity;
 
 



namespace ElectronDecanat.Controllers
{
    [Authorize]
    public class TeacherController : Controller
    {
        // GET: Teacher
        public ActionResult Index()
        {
            List<TeacherWork> array = RequestHelper.getTeacherWork(User.Identity.GetUserId());
            return View(array);
        }
        public ActionResult Labs(string discipline )
        {
            string name=User.Identity.GetUserName();
            List<LabProgress> array = RequestHelper.getPeopleLabList(new TeacherWork { teacherName = name, disciplineName = discipline });
            return View(array);
        }
        private IEnumerable<string> GetAllStatus()
        {
            return new List<string>
            {
                "Сдано",
                "Не сдано",
                "Проверяется"
            };
        }
        public ActionResult ChangeLabStatus(int student_code, string discipline, string student, string labName, int discipline_code, string labStatus)
        {
            var selectList = new List<SelectListItem>();
            foreach (var element in GetAllStatus())
            {
                selectList.Add(new SelectListItem
                {
                    Value = element,
                    Text = element
                });
            }
            string name = User.Identity.GetUserName();
            LabProgress lab = new LabProgress
            {
                studentCode = student_code,
                labName = labName,
                disciplineCode = discipline_code,
                disciplineName=discipline,
                studentName=student,
                teacherName = name,
                Statuses = selectList,
                labStatus = labStatus
            };
            return View(lab);
        }
    }
}