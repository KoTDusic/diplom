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
        public ActionResult EditSpeciality(int faculty_id, int id)
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
        public ActionResult DeleteSpeciality(int faculty_id, int id)
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
        public ActionResult Disciplines(string faculty_name, string speciality_name, string speciality_code)
        {
            ViewBag.faculty_name = faculty_name;
            ViewBag.speciality_name = speciality_name;
            ViewBag.speciality_code = speciality_code;
            List<Disciplines> disciplines = AdminRequestHelper.getDiscyplines(faculty_name, speciality_name);
            return View(disciplines);
        }
        public ActionResult AddDiscipline(string faculty_name, string speciality_name, string speciality_code)
        {
            Code.Disciplines discipline = new Disciplines { facultyName = faculty_name, specialityName = speciality_name, specialityCode=speciality_code };
            return View(discipline);
        }
        [HttpPost]
        public ActionResult AddDiscipline(Disciplines discipline)
        {
            try
            {
                AdminRequestHelper.AddDiscipline(discipline);
                List<Disciplines> disciplines = AdminRequestHelper.getDiscyplines(discipline.facultyName,discipline.specialityName);
                ViewBag.faculty_name = discipline.facultyName;
                ViewBag.speciality_name = discipline.specialityName;
                ViewBag.speciality_code = discipline.specialityCode;
                return View("Disciplines", disciplines);
            }
            catch 
            {
                ModelState.AddModelError("disciplineName", "ошибка добавления, возможно такая дисциплина уже есть?");
                return View(discipline); 
            }

        }
        public ActionResult EditDiscipline(string faculty_name, string speciality_name, string speciality_code, string discipline_name)
        {
            Code.Disciplines discipline = new Disciplines { facultyName = faculty_name, specialityName = speciality_name, specialityCode = speciality_code, disciplineName=discipline_name };
            return View(discipline);
        }
        [HttpPost]
        public ActionResult EditDiscipline(Disciplines discipline)
        {
            try
            {
                AdminRequestHelper.EditDiscipline(discipline);
                List<Disciplines> disciplines = AdminRequestHelper.getDiscyplines(discipline.facultyName, discipline.specialityName);
                ViewBag.faculty_name = discipline.facultyName;
                ViewBag.speciality_name = discipline.specialityName;
                ViewBag.speciality_code = discipline.specialityCode;
                return View("Disciplines", disciplines);
            }
            catch 
            {
                ModelState.AddModelError("newDisciplineName", "ошибка переименования, возможно такая дисциплина уже есть?");
                return View(discipline);
            }
        }
        public ActionResult DeleteDiscipline(string faculty_name, string speciality_name, string speciality_code, string discipline_name)
        {
            Code.Disciplines discipline = new Disciplines { 
                facultyName = faculty_name,
                specialityName = speciality_name, 
                specialityCode = speciality_code,
                disciplineName=discipline_name,
                newDisciplineName="_" };
            return View(discipline);
        }
        [HttpPost]
        public ActionResult DeleteDiscipline(Disciplines discipline)
        {
            try
            {
                AdminRequestHelper.DeleteDiscipline(discipline);
                List<Disciplines> disciplines = AdminRequestHelper.getDiscyplines(discipline.facultyName, discipline.specialityName);
                ViewBag.faculty_name = discipline.facultyName;
                ViewBag.speciality_name = discipline.specialityName;
                ViewBag.speciality_code = discipline.specialityCode;
                return View("Disciplines", disciplines);
            }
            catch (Exception)
            {
                ModelState.AddModelError("disciplineName", "Невозможно удалить эту дисциплину, так как она не пустая");
                return View(discipline);
            }
        }
        #endregion
        #region GROUPS
        public ActionResult Groups(string faculty_name, string speciality_code,string speciality_name)
        {
            ViewBag.faculty_name = faculty_name;
            ViewBag.speciality_code = speciality_code;
            ViewBag.speciality_name = speciality_name;
            List<Group> groups = AdminRequestHelper.getGroops(faculty_name, speciality_code);
            return View(groups);
        }
        public ActionResult AddGroup(string speciality_code, string faculty_name, string speciality_name)
        {
            Group group = new Group { speciality_code = speciality_code, faculty_name = faculty_name, speciality_name = speciality_name };
            return View(group);
        }
        [HttpPost]
        public ActionResult AddGroup(Group group)
        {
            try
            {
                AdminRequestHelper.AddGroup(group);
                List<Group> groups = AdminRequestHelper.getGroops(group.faculty_name, group.speciality_code);
                ViewBag.faculty_name = group.faculty_name;
                ViewBag.speciality_code = group.speciality_code;
                ViewBag.speciality_name = group.speciality_name;
                return View("Groups", groups);
            }
            catch
            {
                ModelState.AddModelError("group_number", "ошибка добавления, возможно такая группа уже есть?");
                return View(group);
            }

        }
        public ActionResult DeleteGroup(string speciality_code, string faculty_name, string speciality_name, int group_number, int year)
        {
            Group group = new Group { speciality_code = speciality_code, faculty_name = faculty_name, speciality_name = speciality_name, group_number=group_number, year=year };
            return View(group);
        }
        [HttpPost]
        public ActionResult DeleteGroup(Group group)
        {
            try
            {
                AdminRequestHelper.DeleteGroup(group);
                List<Group> groups = AdminRequestHelper.getGroops(group.faculty_name, group.speciality_code);
                ViewBag.faculty_name = group.faculty_name;
                ViewBag.speciality_code = group.speciality_code;
                ViewBag.speciality_name = group.speciality_name;
                return View("Groups", groups);
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
        public ActionResult AddSubgroup(string speciality_code, string faculty_name, string speciality_name, int group_code, int group_number)
        {
            Subgroup subgroup = new Subgroup { speciality_code = speciality_code, faculty_name = faculty_name, speciality_name = speciality_name, group_code = group_code, group_number=group_number };
            return View(subgroup);
        }
        [HttpPost]
        public ActionResult AddSubgroup(Subgroup subgroup)
        {
            try
            {
                AdminRequestHelper.AddSubgroup(subgroup);
                List<Subgroup> subgroups = AdminRequestHelper.getSubgroups(subgroup.group_code);
                ViewBag.faculty_name = subgroup.faculty_name;
                ViewBag.speciality_code = subgroup.speciality_code;
                ViewBag.group_number = subgroup.group_number;
                ViewBag.year = subgroup.year;
                ViewBag.group_code = subgroup.group_code;
                return View("Subgroups", subgroups);
            }
            catch
            {
                ModelState.AddModelError("subgroup_number", "ошибка добавления, возможно такая группа уже есть?");
                return View(subgroup);
            }

        }
        public ActionResult DeleteSubgroup(string speciality_code, string faculty_name, string speciality_name, int group_number, int year, int group_code, int subgroup_number)
        {
            Subgroup subgroup = new Subgroup 
            { 
                speciality_code = speciality_code,
                faculty_name = faculty_name,
                speciality_name = speciality_name,
                group_number = group_number,
                year = year,
                group_code = group_code,
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
                List<Subgroup> subgroups = AdminRequestHelper.getSubgroups(subgroup.group_code);
                ViewBag.faculty_name = subgroup.faculty_name;
                ViewBag.speciality_code = subgroup.speciality_code;
                ViewBag.group_number = subgroup.group_number;
                ViewBag.year = subgroup.year;
                ViewBag.group_code = subgroup.group_code;
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