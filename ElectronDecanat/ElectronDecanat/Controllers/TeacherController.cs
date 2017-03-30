using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronDecanat.Code;
using Microsoft.AspNet.Identity;
 
 
//https://metanit.com/sharp/mvc5/12.4.php роли


namespace ElectronDecanat.Controllers
{
    [Authorize(Roles = "teacher")]
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
        
        public ActionResult LabsList()
        {
            string name = User.Identity.GetUserName();
            List<string> disciplines = RequestHelper.getTeacherDisciplines(name);
            return View(disciplines);
        }
        public ActionResult LabsOnDisciplineList(string discipline, string error)
        {
            string name = User.Identity.GetUserName();
            List<Lab> labs = RequestHelper.getLabInDiscipline(discipline);
            return View(labs);
        }
        public ActionResult AddLab(string discipline)
        {
            Lab lab = new Lab();
            lab.discipline = discipline;
            return View(lab);
        }
        [HttpPost]
        public ActionResult AddLab(Lab item)
        {
            RequestHelper.AddLab(item);
            List<Lab> labs = RequestHelper.getLabInDiscipline(item.discipline);
            return View("LabsOnDisciplineList", labs);
        }
        public ActionResult DeleteLab(string discipline,string lab_name)
        {
            Lab lab = new Lab() { discipline = discipline, oldLabName = lab_name };
            return View(lab);
        }
        [HttpPost]
        public ActionResult DeleteLab(Lab item)
        {
            RequestHelper.RemoveLab(item);
            List<Lab> labs = RequestHelper.getLabInDiscipline(item.discipline);
            return View("LabsOnDisciplineList", labs);
        }
        public ActionResult EditLab(string discipline, string lab_name)
        {
            Lab lab = new Lab { discipline = discipline, oldLabName = lab_name };
            return View(lab);
        }
        [HttpPost]
        public ActionResult EditLab(Lab item)
        {
            if (item.newLabName != null)
            {
                RequestHelper.EditLab(item);
            }
            List<Lab> labs = RequestHelper.getLabInDiscipline(item.discipline);
            return View("LabsOnDisciplineList", labs);
        }
        public ActionResult ChangeLabStatus(int student_code, string discipline, string student, string labName, int discipline_code, string labStatus)
        {
            var selectList = new List<SelectListItem>();
            foreach (var element in LabProgress.GetAllStatus())
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
        [HttpPost]
        public ActionResult ChangeLabStatus(LabProgress item)
        {
            string name = User.Identity.GetUserName();
            bool complete = RequestHelper.UpdateLab(item);
            List<LabProgress> array = RequestHelper.getPeopleLabList(new TeacherWork { teacherName = name, disciplineName = item.disciplineName });
            return View("Labs", array);
        }
    }
}