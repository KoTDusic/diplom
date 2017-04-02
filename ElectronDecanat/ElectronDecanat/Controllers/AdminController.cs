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
        #region FACULTY
        public ActionResult Facultes()
        {
            List<Faculty> facultys = AdminRequestHelper.getFaculties();
            return View(facultys);
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
            Faculty faculty = new Faculty { Name = faculty_name, NewName="_" };
            return View(faculty);
        }
        [HttpPost]
        public ActionResult DeleteFaculty(Faculty faculty)
        {
            try
            {
                AdminRequestHelper.DeleteFaculty(faculty);
            }
            catch(Exception)
            {
                ModelState.AddModelError("Name", "Невозможно удалить этот факультет, так как он не пустой");
            }
            if (ModelState.IsValid)
            {
                List<Faculty> facultys = AdminRequestHelper.getFaculties();
                return View("Facultes", facultys);
            }
            else
            {
                return View();
            }
        }
        #endregion
        #region SPECIALITIS
        public ActionResult Specialitis(string faculty_name)
        {
            ViewBag.faculty_name = faculty_name;
            List<Speciality> specialitys = AdminRequestHelper.getSpecialitys(faculty_name);
            return View(specialitys);
        }
        public ActionResult AddSpeciality(string faculty_name)
        {
            ViewBag.faculty_name = faculty_name;
            return View();
        }
        [HttpPost]
        public ActionResult AddSpeciality(Speciality speciality)
        {
            try 
            {
                AdminRequestHelper.AddSpeciality(speciality);
                List<Speciality> specialitys = AdminRequestHelper.getSpecialitys(speciality.faculty_name);
                return View("Specialitis", specialitys);
            }
            catch { return View(); }
            
        }
        public ActionResult EditSpeciality(string faculty_name, string speciality_name, string speciality_code)
        {
            Speciality speciality = new Speciality { faculty_name=faculty_name, speciality_code=speciality_code, speciality_name=speciality_name };
            ViewBag.faculty_name = speciality.faculty_name;
            return View(speciality);
        }
        [HttpPost]
        public ActionResult EditSpeciality(Speciality speciality)
        {
            try
            {
                AdminRequestHelper.EditSpeciality(speciality);
                List<Speciality> specialitys = AdminRequestHelper.getSpecialitys(speciality.faculty_name);
                ViewBag.faculty_name = speciality.faculty_name;
                return View("Specialitis", specialitys);
            }
            catch { return View(); }
        }
        public ActionResult DeleteSpeciality(string faculty_name, string speciality_name, string speciality_code)
        {
            Speciality speciality = new Speciality { faculty_name = faculty_name, speciality_code = speciality_code, speciality_name = speciality_name, new_speciality_name="_" };
            ViewBag.faculty_name = speciality.faculty_name;
            return View(speciality);
        }
        [HttpPost]
        public ActionResult DeleteSpeciality(Speciality speciality)
        {
            try
            {
                ViewBag.faculty_name = speciality.faculty_name;
                AdminRequestHelper.DeleteSpeciality(speciality);
                List<Speciality> specialitys = AdminRequestHelper.getSpecialitys(speciality.faculty_name);
                ViewBag.faculty_name = speciality.faculty_name;
                return View("Specialitis", specialitys);
            }
            catch (Exception)
            {
                ModelState.AddModelError("speciality_name", "Невозможно удалить эту специальность, так как она не пустая");
                return View();
            }
        }
        #endregion
        public ActionResult Disciplines(string faculty_name, string speciality_name, string speciality_code)
        {
            ViewBag.faculty_name = faculty_name;
            ViewBag.speciality_name = speciality_name;
            ViewBag.speciality_code = speciality_code;
            List<Disciplines> disciplines = AdminRequestHelper.getDiscyplines(faculty_name, speciality_name);
            return View(disciplines);
        }
    }
}