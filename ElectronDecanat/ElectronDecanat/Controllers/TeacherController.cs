using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronDecanat.Code;

namespace ElectronDecanat.Controllers
{
    [Authorize]
    public class TeacherController : Controller
    {
        // GET: Teacher
        public ActionResult Index()
        {
            RequestHelper requestHelper = new RequestHelper();
            List<TeacherWork> array = requestHelper.getTeacherWork();
            return View(array);
        }
    }
}