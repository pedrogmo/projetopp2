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
        Usuario usuario;
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.usuario = usuario;
            return View();
        }

        [HttpPost]
        public ActionResult Logar(string stringLogin, string stringSenha)
        {
            UsuariosDAO dao = new UsuariosDAO();
            usuario = dao.Buscar(usuario => usuario.Nome == stringLogin && usuario.Senha == stringSenha);
            if (usuario != null)
                ViewBag.usuario = usuario;
            return RedirectToAction("Index", "Home");
        }
    }
}