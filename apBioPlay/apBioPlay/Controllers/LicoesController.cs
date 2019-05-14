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
        public ActionResult Index()
        {
            var u = (Usuario) Session["usuarioLogado"];
            ViewBag.licoes = new LicoesDAO().Lista().OrderBy(l => l.Nivel);
            ViewBag.usuario = u;
            return View();
        }

        public ActionResult Perfil()
        {
            return RedirectToAction("Visualiza", "Licoes", (Usuario)Session["usuarioLogado"]);
        }

        public ActionResult Visualiza(Usuario usu)
        {
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            ViewBag.visualizado = usu;

            /*if(usu.Codigo == ((Usuario)Session["usuarioLogado"]).Codigo)*/
            ViewBag.amigos = new AmizadeDAO().Amigos(usu.Codigo);
            ViewBag.dados = new LicoesFeitasDAO().Dados(usu.Codigo);
            return View();
        }

        public ActionResult Forum()
        {
            ViewBag.Publicacoes = new PublicacaoDAO().Lista();
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        //Para lição selecionada
        public ActionResult Licao(Licao l)
        {
            return View();
        }
    }
}