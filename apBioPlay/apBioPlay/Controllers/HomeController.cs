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
            ViewBag.valido = "SI";
            if (ModelState.IsValid)
            {
                UsuariosDAO dao = new UsuariosDAO();
                if (u.DataNascimento.Year < 1900 || u.DataNascimento.Year > 2019)
                {
                    Session["Message"] = "Data de nascimento inválida";
                    ViewBag.usuarioAnterior = u;
                    return View("Cadastrar");
                }
                if (dao.Buscar(us => us.Nome == u.Nome) != null)
                {
                    Session["Message"] = "Esse nome já existe no site";
                    ViewBag.usuarioAnterior = u;
                    return View("Cadastrar");
                }
                u.FotoPerfil = "/Images/FotosPerfil/pic1.png";
                dao.Adicionar(u);
                Session["usuarioLogado"] = u;
                return RedirectToAction("Index", "Licoes", u);
            }
            else
            {
                ViewBag.valido = "NAO";
                ViewBag.usuarioAnterior = u;
                return View("Cadastrar");
            }
        }
    }
}