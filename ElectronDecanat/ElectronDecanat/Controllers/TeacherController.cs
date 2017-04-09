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
            List<TeacherWork> array = TeacherRequestHelper.getTeacherWork(User.Identity.GetUserId());
            return View(array);
        }
        public ActionResult Labs(string discipline )
        {
            string name=User.Identity.GetUserName();
            List<LabProgress> array = TeacherRequestHelper.getPeopleLabList(new TeacherWork { teacher_name = name, discipline_name = discipline });
            return View(array);
        }
        
        public ActionResult LabsList()
        {
            string name = User.Identity.GetUserName();
            List<Discipline> disciplines = TeacherRequestHelper.getTeacherDisciplines(name);
            return View(disciplines);
        }
        public ActionResult LabsOnDisciplineList(string discipline, string speciality)
        {
            string name = User.Identity.GetUserName();
            List<Lab> labs = TeacherRequestHelper.getLabInDiscipline(discipline, speciality);
            ViewBag.discipline = discipline;
            ViewBag.speciality = speciality;
            return View(labs);
        }
        public ActionResult AddLab(string discipline, string speciality)
        {
            Lab lab = new Lab();
            lab.discipline = discipline;
            lab.speciality = speciality;
            return View(lab);
        }
        [HttpPost]
        public ActionResult AddLab(Lab item)
        {
            TeacherRequestHelper.AddLab(item);
            List<Lab> labs = TeacherRequestHelper.getLabInDiscipline(item.discipline,item.speciality);
            ViewBag.discipline = item.discipline;
            ViewBag.speciality = item.speciality;
            return View("LabsOnDisciplineList", labs);
        }
        public ActionResult DeleteLab(string discipline, string speciality, string lab_name)
        {
            Lab lab = new Lab() { discipline = discipline, oldLabName = lab_name, speciality = speciality };
            return View(lab);
        }
        [HttpPost]
        public ActionResult DeleteLab(Lab item)
        {
            TeacherRequestHelper.RemoveLab(item);
            List<Lab> labs = TeacherRequestHelper.getLabInDiscipline(item.discipline,item.speciality);
            ViewBag.discipline = item.discipline;
            ViewBag.speciality = item.speciality;
            return View("LabsOnDisciplineList", labs);
        }
        public ActionResult EditLab(string discipline, string speciality, string lab_name)
        {
            Lab lab = new Lab { discipline = discipline, oldLabName = lab_name, speciality = speciality };
            return View(lab);
        }
        [HttpPost]
        public ActionResult EditLab(Lab item)
        {
            if (item.newLabName != null)
            {
                TeacherRequestHelper.EditLab(item);
            }
            ViewBag.discipline = item.discipline;
            ViewBag.speciality = item.speciality;
            List<Lab> labs = TeacherRequestHelper.getLabInDiscipline(item.discipline, item.speciality);
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
            TeacherRequestHelper.UpdateLab(item);
            List<LabProgress> array = TeacherRequestHelper.getPeopleLabList(new TeacherWork { teacher_name = name, discipline_name = item.disciplineName });
            return View("Labs", array);
        }
    }
}