using ElectronDecanat.Repozitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronDecanat.Controllers
{
    public class DekanController : Controller
    {
        public ActionResult Facultes()
        {
            return View(UnitOfWork.Faculties.GetAll());
        }
	}
}