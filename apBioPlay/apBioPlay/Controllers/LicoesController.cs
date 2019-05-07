using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using apBioPlay.DAO;
using apBioPlay.Models;

namespace apBioPlay.Controllers
{
    public class LicoesController : Controller
    {
        Usuario usuario;

        public ActionResult Index(Usuario u)
        {
            usuario = u;
            ViewBag.amigos = new AmizadeDAO().Amigos(usuario.Codigo);
            ViewBag.dados = new LicoesFeitasDAO().Dados(usuario.Codigo);
            ViewBag.licoes = new LicoesDAO().Lista().OrderBy(l => l.Nivel);
            ViewBag.usuario = u;
            return View();
        }

        public ActionResult Perfil()
        {
            ViewBag.usuario = usuario;
            return View();
        }

        public ActionResult Visualiza(Usuario usu)
        {
            ViewBag.usuario = usuario;
            ViewBag.visualizado = usu;
            return View();
        }

        public ActionResult Forum()
        {
            ViewBag.usuario = usuario;
            return View();
        }

        //Para lição selecionada
        public ActionResult Licao(Licao l)
        {
            return View();
        }
    }
}