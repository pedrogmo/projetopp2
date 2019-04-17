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
            return View();
        }

        [HttpPost]
        public ActionResult Logar(string stringLogin, string stringSenha)
        {
            UsuariosDAO dao = new UsuariosDAO();
            Usuario usuario = dao.Buscar(u => u.Nome == stringLogin && u.Senha == stringSenha);
            if (usuario == null)
                return RedirectToAction("Index", "Home");
            return RedirectToAction("Index", "Licoes", usuario);
        }
    }
}