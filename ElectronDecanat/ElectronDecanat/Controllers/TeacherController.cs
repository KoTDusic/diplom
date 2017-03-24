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
    }
}