using ElectronDecanat.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronDecanat.Repozitory;

namespace ElectronDecanat.Controllers
{
    [Authorize(Roles = "admin")]
    public class AdminController : Controller
    {
        #region FACULTY
        public ActionResult Facultes()
        {
            return View(UnitOfWork.Faculties.GetAll());
        }
        public ActionResult AddFaculty()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddFaculty(NewFaculty faculty)
        {
            try
            {
                UnitOfWork.Faculties.Create(faculty);
                return RedirectToAction("Facultes");
            }
            catch
            {
                ModelState.AddModelError("Name", "ошибка добавления, возможно такой факультет уже есть?");
                return View(faculty);
            }
        }
        public ActionResult EditFaculty(int id)
        {
            Faculty oldFaculty = UnitOfWork.Faculties.Get(id);
            NewFaculty faculty = new NewFaculty { Name = oldFaculty.Name };
            return View(faculty);
        }
        [HttpPost]
        public ActionResult EditFaculty(NewFaculty faculty)
        {
            try
            {
                UnitOfWork.Faculties.Update(faculty);
            }
            catch
            {
                ModelState.AddModelError("NewName", "Не удалось переименовать факультет, возможно, факультет с таким именем уже есть?");
                return View(faculty);
            }
            return RedirectToAction("Facultes");
        }
        public ActionResult DeleteFaculty(int id)
        {
            Faculty oldFaculty = UnitOfWork.Faculties.Get(id);
            Faculty faculty = new Faculty { Name = oldFaculty.Name };
            return View(faculty);
        }
        [HttpPost]
        public ActionResult DeleteFaculty(Faculty faculty)
        {
            try
            {
                UnitOfWork.Faculties.Delete(faculty.id);
            }
            catch(Exception)
            {
                ModelState.AddModelError("Name", "Невозможно удалить этот факультет, так как он не пустой");
            }
            if (ModelState.IsValid)
            {
                return RedirectToAction("Facultes");
            }
            else
            {
                return View();
            }
        }
        #endregion
        #region SPECIALITIS
        public ActionResult Specialitis(int faculty_id)
        {
            ViewBag.faculty_id = faculty_id;
            return View(UnitOfWork.Specialitys.GetAll("where \"Код_факультета\"="+faculty_id));
        }
        public ActionResult AddSpeciality(int faculty_id)
        {
            Faculty faculty = UnitOfWork.Faculties.Get(faculty_id);
            Speciality speciality = new Speciality { faculty_code = faculty_id, faculty_name = faculty.Name };
            return View(speciality);
        }
        [HttpPost]
        public ActionResult AddSpeciality(Speciality speciality)
        {
            try 
            {
                UnitOfWork.Specialitys.Create(speciality);
                return RedirectToAction("Specialitis", new { faculty_id=speciality.faculty_code });
            }
            catch
            {
                ModelState.AddModelError("speciality_name", "ошибка добавления, возможно такая специальность уже есть?");
                return View(speciality);
            }
            
        }
        public ActionResult EditSpeciality(int id)
        {
            NewSpeciality speciality = new NewSpeciality(UnitOfWork.Specialitys.Get(id));
            speciality.new_speciality_number = speciality.speciality_number;
            speciality.new_speciality_name = speciality.speciality_name;
            return View(speciality);
        }
        [HttpPost]
        public ActionResult EditSpeciality(NewSpeciality speciality)
        {
            try
            {
                UnitOfWork.Specialitys.Update(speciality);
                return RedirectToAction("Specialitis", new { faculty_id = speciality.faculty_code });
            }
            catch { return View(speciality); }
        }
        public ActionResult DeleteSpeciality(int id)
        {
            Speciality speciality = UnitOfWork.Specialitys.Get(id);
            return View(speciality);
        }
        [HttpPost]
        public ActionResult DeleteSpeciality(Speciality speciality)
        {
            try
            {
                UnitOfWork.Specialitys.Delete(speciality.id);
                return RedirectToAction("Specialitis", new { faculty_id = speciality.faculty_code });
            }
            catch (Exception)
            {
                ModelState.AddModelError("speciality_name", "Невозможно удалить эту специальность, так как она не пустая");
                return View(speciality);
            }
        }
        #endregion
        #region DISCIPLINES
        public ActionResult Disciplines(int speciality_id)
        {
            Speciality speciality = UnitOfWork.Specialitys.Get(speciality_id);
            ViewBag.faculty_id = speciality.faculty_code;
            ViewBag.speciality_id = speciality_id;
            return View(UnitOfWork.Disciplines.GetAll("where \"Код_специальности\"=" + speciality_id));
        }
        public ActionResult AddDiscipline(int speciality_id)
        {
            Speciality speciality = UnitOfWork.Specialitys.Get(speciality_id);
            Discipline discipline = new Discipline 
            {
                faculty_name = speciality.faculty_name,
                faculty_code = speciality.faculty_code,
                speciality_code = speciality.id,
                speciality_name = speciality.speciality_name,
                speciality_number = speciality.speciality_number
            };
            return View(discipline);
        }
        [HttpPost]
        public ActionResult AddDiscipline(Discipline discipline)
        {
            try
            {
                UnitOfWork.Disciplines.Create(discipline);
                return RedirectToAction("Disciplines", new { speciality_id=discipline.speciality_code });
            }
            catch 
            {
                ModelState.AddModelError("discipline_name", "ошибка добавления, возможно такая дисциплина уже есть?");
                return View(discipline); 
            }

        }
        public ActionResult EditDiscipline(int id)
        {
            NewDiscipline discipline = UnitOfWork.Disciplines.Get(id);
            return View(discipline);
        }
        [HttpPost]
        public ActionResult EditDiscipline(NewDiscipline discipline)
        {
            try
            {
                UnitOfWork.Disciplines.Update(discipline);
                return RedirectToAction("Disciplines", new { speciality_id = discipline.speciality_code });
            }
            catch 
            {
                ModelState.AddModelError("newDisciplineName", "ошибка переименования, возможно такая дисциплина уже есть?");
                return View(discipline);
            }
        }
        public ActionResult DeleteDiscipline(int id)
        {
            Discipline discipline = UnitOfWork.Disciplines.Get(id);
            return View(discipline);
        }
        [HttpPost]
        public ActionResult DeleteDiscipline(Discipline discipline)
        {
            try
            {
                UnitOfWork.Disciplines.Delete(discipline.id);
                return RedirectToAction("Disciplines", new { speciality_id = discipline.speciality_code });
            }
            catch (Exception)
            {
                ModelState.AddModelError("discipline_name", "Невозможно удалить эту дисциплину, так как она не пустая");
                return View(discipline);
            }
        }
        #endregion
        #region GROUPS
        public ActionResult Groups(int speciality_id)
        {
            ViewBag.faculty_id = UnitOfWork.Specialitys.Get(speciality_id).faculty_code;
            ViewBag.speciality_id = speciality_id;
            return View(UnitOfWork.Groups.GetAll("where \"Код_специальности\"=" + speciality_id));
        }
        public ActionResult AddGroup(int speciality_id)
        {
            Speciality speciality = UnitOfWork.Specialitys.Get(speciality_id);
            Group group = new Group 
            {
                faculty_name = speciality.faculty_name,
                speciality_number = speciality.speciality_number,
                speciality_name = speciality.speciality_name,
                speciality_id = speciality.id
            };
            return View(group);
        }
        [HttpPost]
        public ActionResult AddGroup(Group group)
        {
            try
            {
                UnitOfWork.Groups.Create(group);
                return RedirectToAction("Groups", new { speciality_id = group.speciality_id });
            }
            catch
            {
                ModelState.AddModelError("group_number", "ошибка добавления, возможно такая группа уже есть?");
                return View(group);
            }

        }
        public ActionResult DeleteGroup(int id)
        {
            return View(UnitOfWork.Groups.Get(id));
        }
        [HttpPost]
        public ActionResult DeleteGroup(Group group)
        {
            try
            {
                UnitOfWork.Groups.Delete(group.id);
                return RedirectToAction("Groups", new { speciality_id = group.speciality_id });
            }
            catch (Exception)
            {
                ModelState.AddModelError("group_number", "ошибка удаления, данная группа не пуста");
                return View(group);
            }
        }
        #endregion
        #region SUBGROUPS
        public ActionResult Subgroups(string faculty_name, string speciality_code, int group_number, int year,int group_code)
        {
            ViewBag.faculty_name = faculty_name;
            ViewBag.speciality_code = speciality_code;
            ViewBag.group_number = group_number;
            ViewBag.year = year;
            ViewBag.group_code = group_code;
            List<Subgroup> subgroups = AdminRequestHelper.getSubgroups(group_code);
            return View(subgroups);
        }
        public ActionResult AddSubgroup(int speciality_code, string faculty_name, string speciality_name, int group_code, int group_number)
        {
            //Subgroup subgroup = new Subgroup { speciality_number = speciality_code, faculty_name = faculty_name, speciality_name = speciality_name, id = group_code, group_number=group_number };
            return View();
        }
        [HttpPost]
        public ActionResult AddSubgroup(Subgroup subgroup)
        {
            try
            {
                AdminRequestHelper.AddSubgroup(subgroup);
                List<Subgroup> subgroups = AdminRequestHelper.getSubgroups(subgroup.id);
                return View("Subgroups", subgroups);
            }
            catch
            {
                ModelState.AddModelError("subgroup_number", "ошибка добавления, возможно такая группа уже есть?");
                return View(subgroup);
            }

        }
        public ActionResult DeleteSubgroup(int speciality_code, string faculty_name, string speciality_name, int group_number, int year, int group_code, int subgroup_number)
        {
            Subgroup subgroup = new Subgroup 
            { 
                id = speciality_code,
                faculty_name = faculty_name,
                speciality_name = speciality_name,
                group_number = group_number,
                year = year,
                speciality_number = group_code,
                subgroup_number = subgroup_number, 
            };
            return View(subgroup);
        }
        [HttpPost]
        public ActionResult DeleteSubgroup(Subgroup subgroup)
        {
            try
            {
                AdminRequestHelper.DeleteSubgroup(subgroup);
                List<Subgroup> subgroups = AdminRequestHelper.getSubgroups(subgroup.id);
                ViewBag.faculty_name = subgroup.faculty_name;
                ViewBag.speciality_code = subgroup.subgroup_number;
                ViewBag.group_number = subgroup.group_number;
                ViewBag.year = subgroup.year;
                ViewBag.group_code = subgroup.id;
                return View("Subgroups", subgroups);
            }
            catch (Exception)
            {
                ModelState.AddModelError("subgroup_number", "ошибка удаления, данная подгруппа не пуста");
                return View(subgroup);
            }
        }
        #endregion
    }
}