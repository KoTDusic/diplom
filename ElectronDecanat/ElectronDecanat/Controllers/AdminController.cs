using ElectronDecanat.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronDecanat.Controllers
{
    [Authorize(Roles = "admin")]
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Facultes()
        {
            List<Faculty> facultys = AdminRequestHelper.getFaculties();
            return View(facultys);
        }
        public ActionResult Specialitis(string faculty_name)
        {
            List<Speciality> specialitys = AdminRequestHelper.getSpecialitys(faculty_name);
            return View(specialitys);
        }
        public ActionResult AddFaculty()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddFaculty(Faculty faculty)
        {
            AdminRequestHelper.AddFaculty(faculty);
            List<Faculty> facultys = AdminRequestHelper.getFaculties();
            return View("Facultes", facultys);
        }
        public ActionResult EditFaculty(string faculty_name)
        {
            Faculty faculty = new Faculty { Name = faculty_name };
            return View(faculty);
        }
        [HttpPost]
        public ActionResult EditFaculty(Faculty faculty)
        {
            AdminRequestHelper.EditFaculty(faculty);
            List<Faculty> facultys = AdminRequestHelper.getFaculties();
            return View("Facultes",facultys);
        }
        public ActionResult DeleteFaculty(string faculty_name)
        {
            Faculty faculty = new Faculty { Name = faculty_name };
            return View(faculty);
        }
        [HttpPost]
        public ActionResult DeleteFaculty(Faculty faculty)
        {
            AdminRequestHelper.DeleteFaculty(faculty);
            List<Faculty> facultys = AdminRequestHelper.getFaculties();
            return View("Facultes", facultys);
        }
    }
}