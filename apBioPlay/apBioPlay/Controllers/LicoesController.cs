using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using apBioPlay.DAO;
using apBioPlay.Models;
using apBioPlay.Filtros;

namespace apBioPlay.Controllers
{
    [AutorizacaoFilterAttribute]
    public class LicoesController : Controller
    {
        Usuario usuario;

        public ActionResult Index()
        {
            usuario = (Usuario) Session["usuarioLogado"];
            ViewBag.amigos = new AmizadeDAO().Amigos(usuario.Codigo);
            ViewBag.dados = new LicoesFeitasDAO().Dados(usuario.Codigo);
            ViewBag.licoes = new LicoesDAO().Lista().OrderBy(l => l.Nivel);
            ViewBag.usuario = usuario;
            return View();
        }

        public ActionResult Perfil()
        {
            return RedirectToAction("Visualiza", "Licoes", usuario);
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