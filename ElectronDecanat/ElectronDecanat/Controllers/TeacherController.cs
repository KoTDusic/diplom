﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronDecanat.Code;
using Microsoft.AspNet.Identity;
using ElectronDecanat.Repozitory;
 
 
//https://metanit.com/sharp/mvc5/12.4.php роли


namespace ElectronDecanat.Controllers
{
    [Authorize(Roles = "teacher")]
    public class TeacherController : Controller
    {
        // GET: Teacher
        public ActionResult Index()
        {
            return View(UnitOfWork.Works.GetAll("where \"Код_преподавателя\"='"+User.Identity.GetUserId()+"'"));
        }
        public ActionResult Labs(int discipline_id )
        {
            return View(UnitOfWork.LabProgress.GetAll("WHERE \"Код_преподавателя\" = '" + User.Identity.GetUserId() + "' AND \"Код_дисциплины\"=" + discipline_id));
        }
        public ActionResult LabsList()
        {
            List<Discipline> disciplines = UnitOfWork.Disciplines.getTeacherDisciplines(User.Identity.GetUserId());
            return View(disciplines);
        }
        public ActionResult LabsOnDisciplineList(int discipline_id)
        {
            string name = User.Identity.GetUserId();
            ViewBag.discipline_id = discipline_id;
            return View(UnitOfWork.Labs.GetAll("where \"Код_дисциплины\" =" + discipline_id));
        }
        public ActionResult AddLab(int discipline_id)
        {
            Discipline discipline = UnitOfWork.Disciplines.Get(discipline_id);
            Lab lab = new Lab()
            {
                discipline = discipline.discipline_name,
                discipline_id = discipline.id,
                speciality = discipline.speciality_name
            };
            return View(lab);
        }
        [HttpPost]
        public ActionResult AddLab(Lab item)
        {
            try
            {
                UnitOfWork.Labs.Create(item);
                return RedirectToAction("LabsOnDisciplineList", new { discipline_id = item.discipline_id });
            }
            catch
            {
                ModelState.AddModelError("lab_name", "ошибка добавления, возможно такая лабораторная уже есть?");
                return View(item);
            }
        }
        public ActionResult DeleteLab(int id)
        {
            Lab lab = UnitOfWork.Labs.Get(id);
            return View(lab);
        }
        [HttpPost]
        public ActionResult DeleteLab(Lab item)
        {
            try
            {
                UnitOfWork.Labs.Delete(item.id);
                return RedirectToAction("LabsOnDisciplineList", new { discipline_id = item.discipline_id });
            }
            catch
            {
                ModelState.AddModelError("lab_name", "ошибка удаления");
                return View(item);
            }
        }
        public ActionResult EditLab(int id)
        {
            NewLab lab = UnitOfWork.Labs.Get(id);
            return View(lab);
        }
        [HttpPost]
        public ActionResult EditLab(NewLab item)
        {
            try
            {
                UnitOfWork.Labs.Update(item);
                return RedirectToAction("LabsOnDisciplineList", new { discipline_id = item.discipline_id });
            }
            catch
            {
                ModelState.AddModelError("lab_name", "ошибка редактирования");
                return View(item);
            }
        }
        public ActionResult ChangeLabStatus(int id)
        {
            LabProgress lab_progress  = UnitOfWork.LabProgress.Get(id);
            lab_progress.Statuses = LabProgress.GetAllStatus();
            return View(lab_progress);
        }
        [HttpPost]
        public ActionResult ChangeLabStatus(LabProgress item)
        {
            string id = User.Identity.GetUserId();
            UnitOfWork.LabProgress.Update(item);
            return RedirectToAction("Labs", new { discipline_id = item.discipline_id });
        }
    }
}