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
            if (new SolicitacaoAmizadeDAO().Existe(ViewBag.usuario.Codigo, ViewBag.visualizado.Codigo))
                ViewBag.situacao = "Solicitação enviada";
            else if (new AmizadeDAO().EhAmigo(ViewBag.usuario.Codigo, ViewBag.visualizado.Codigo))
                ViewBag.situacao = "Cancelar amizade";
            else
                ViewBag.situacao = "Adicionar amigo";
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

        [Route("publicacoes/{codP}")]
        public ActionResult VerPublicacao(int codP)
        {
            Session["publicacao"] = new PublicacaoDAO().Buscar(codP);
            ViewBag.publicacao = (Publicacao)Session["publicacao"];
            ViewBag.respostas = new RespostaPublicacaoDAO().RespostasDe(codP);
            ViewBag.usuarioPublicacao = new UsuariosDAO().Buscar(u => u.Codigo == ViewBag.publicacao.CodUsuario);
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        public ActionResult Responder(string resp)
        {
            Publicacao pub = (Publicacao)Session["publicacao"];
            Usuario usu = (Usuario)Session["usuarioLogado"];
            var resposta = new RespostaPublicacao();
            resposta.CodPublicacao = pub.Codigo;
            resposta.CodUsuario = usu.Codigo;
            resposta.Conteudo = resp;
            resposta.Data = DateTime.Now;
            new RespostaPublicacaoDAO().Adicionar(resposta);
            var notificacao = new Notificacao();
            notificacao.CodUsuario = pub.CodUsuario;
            notificacao.Texto = $"O usuário {usu.Nome} respondeu sua publicação.";
            notificacao.Url = $"publicacoes/{pub.Codigo}";
            new NotificacaoDAO().Adicionar(notificacao);
            return RedirectToAction("VerPublicacao", new { codP = pub.Codigo });
        }

        //Para lição selecionada
        public ActionResult Licao(Licao l)
        {
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        public ActionResult Alterar(string fotoPerfil, string senhaAnt, string senhaNov)
        {
            Usuario usu = (Usuario)Session["usuarioLogado"];
            if ((senhaAnt == "") != (senhaNov == ""))
                Session["Message"] = "Senhas inválidas!";
            else if(senhaAnt != "")
            {
                if (senhaAnt != usu.Senha)
                    Session["Message"] = "Senha anterior incorreta!";
                else if(senhaAnt == senhaNov)
                    Session["Message"] = "As senhas são iguais!";
                else
                {
                    usu.Senha = senhaNov;
                    usu.FotoPerfil = fotoPerfil;
                    new UsuariosDAO().Atualiza(usu);
                }
            }
            else
            {
                usu.FotoPerfil = fotoPerfil;
                new UsuariosDAO().Atualiza(usu);
            }

            return RedirectToAction("Perfil");
        }

        public ActionResult SolicitarAmizade(Usuario dest)
        {
            var u = (Usuario)Session["usuarioLogado"];
            var u2 = ViewBag.visualizado;
            if (ViewBag.situacao=="Adicionar amigo")
                new SolicitacaoAmizadeDAO().Adicionar(u.Codigo, u2.Codigo);
            if (ViewBag.situacao == "Cancelar amizade")
                new AmizadeDAO().Remover(u.Codigo, u2.Codigo);
            return RedirectToAction("Visualiza", u2);
        }
    }
}