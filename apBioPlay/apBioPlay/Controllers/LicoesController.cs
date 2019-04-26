using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using apBioPlay.Models;

namespace apBioPlay.Controllers
{
    public class LicoesController : Controller
    {
        // GET: Licoes
        public ActionResult Index(Usuario usuario)
        {
            ViewBag.usuario = usuario;
            return View();
        }

        public ActionResult Perfil()
        {
            return View();
        }

        public ActionResult Forum()
        {
            return View();
        }
    }
}