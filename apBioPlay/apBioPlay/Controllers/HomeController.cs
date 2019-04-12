using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using apBioPlay.DAO;
using apBioPlay.Models;

namespace apBioPlay.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            /*var dao = new UsuariosDAO();
            ViewBag.alu = dao.Buscar(usuario => usuario.Nome == "p");*/
            return View();
        }
    }
}