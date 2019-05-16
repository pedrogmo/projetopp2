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

        public ActionResult Sobre()
        {
            ViewBag.cidades = new CidadesDAO().Lista().OrderByDescending(c => c.Poluicao).ToList();
            return View();
        }

        public ActionResult Bastidores()
        {            
            return View();
        }

        public ActionResult Logar(string stringLogin, string stringSenha)
        {
            UsuariosDAO dao = new UsuariosDAO();
            Usuario usuario = dao.Buscar(u => u.Nome == stringLogin && u.Senha == stringSenha);
            Session["usuarioLogado"] = usuario;
            if (usuario == null)
            {
                Session["Message"] = "Login e/ou senha incorreto(s)";
                return RedirectToAction("Index", "Home");                
            }
            else
                return RedirectToAction("Index", "Licoes");
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CadastroDeUsuario(Usuario u)
        {
            if (ModelState.IsValid)
            {
                UsuariosDAO dao = new UsuariosDAO();
                if (dao.Buscar(us => us.Nome == u.Nome) != null)
                {
                    Session["Message"] = "Esse nome já existe no site";
                    return View("Cadastrar");
                }
                dao.Adicionar(u);
                return RedirectToAction("Index", "Licoes", u);
            }
            else
            {
                ViewBag.usuarioAnterior = u;
                return View("Cadastrar");
            }
        }
    }
}