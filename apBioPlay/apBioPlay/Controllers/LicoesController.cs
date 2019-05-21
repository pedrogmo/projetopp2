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
            ViewBag.notificacoes = new NotificacaoDAO().Lista(u.Codigo);
            return View();
        }

        public ActionResult Perfil()
        {
            return RedirectToAction("Visualiza", "Licoes", new { codU = ((Usuario)Session["usuarioLogado"]).Codigo } );
        }

        [Route("Licoes/usuarios/{codU}")]
        public ActionResult Visualiza(int codU)
        {
            ViewBag.mensagem = "";
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            ViewBag.visualizado = new UsuariosDAO().Buscar(u=>u.Codigo==codU);
            if (new SolicitacaoAmizadeDAO().Existe(ViewBag.usuario.Codigo, codU))
                ViewBag.situacao = "Solicitação enviada";
            else if (new SolicitacaoAmizadeDAO().Existe(codU, ViewBag.usuario.Codigo))
                ViewBag.situacao = "Aceitar solicitação";
            else if (new AmizadeDAO().EhAmigo(ViewBag.usuario.Codigo, codU))
                ViewBag.situacao = "Cancelar amizade";
            else
                ViewBag.situacao = "Adicionar amigo";
            /*if(usu.Codigo == ((Usuario)Session["usuarioLogado"]).Codigo)*/
            ViewBag.amigos = new AmizadeDAO().Amigos(codU);
            ViewBag.dados = new LicoesFeitasDAO().Dados(codU);
            return View();
        }

        public ActionResult Forum()
        {
            ViewBag.Publicacoes = new PublicacaoDAO().Lista();
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        [HttpPost]
        public ActionResult Publicar(Publicacao pub)
        {
            if (pub.Conteudo.Trim() != "")
            {
                pub.Data = DateTime.Now;
                pub.CodUsuario = ((Usuario)Session["usuarioLogado"]).Codigo;
                new PublicacaoDAO().Adicionar(pub);
            }
            return RedirectToAction("Forum");
        }

        [Route("Licoes/publicacoes/{codP}")]
        public ActionResult VerPublicacao(int codP)
        {
            Session["publicacao"] = new PublicacaoDAO().Buscar(codP);
            ViewBag.publicacao = (Publicacao)Session["publicacao"];
            ViewBag.respostas = new RespostaPublicacaoDAO().RespostasDe(codP);
            ViewBag.usuarioPublicacao = new UsuariosDAO().Buscar(u => u.Codigo == ViewBag.publicacao.CodUsuario);
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        public ActionResult Responder(RespostaPublicacao resp)
        {
            Publicacao pub = (Publicacao)Session["publicacao"];
            if (resp.Conteudo.Trim() != "")
            {                
                Usuario usu = (Usuario)Session["usuarioLogado"];
                resp.CodPublicacao = pub.Codigo;
                resp.CodUsuario = usu.Codigo;
                resp.Data = DateTime.Now;
                new RespostaPublicacaoDAO().Adicionar(resp);
                var notificacao = new Notificacao();
                notificacao.CodUsuario = pub.CodUsuario;
                notificacao.Texto = $"O usuário {usu.Nome} respondeu sua publicação.";
                notificacao.Url = $"publicacoes/{pub.Codigo}";
                new NotificacaoDAO().Adicionar(notificacao);
            }
            return RedirectToAction("VerPublicacao", new { codP = pub.Codigo });
        }

        public ActionResult Alterar(string fotoPerfil, string senhaAnt, string senhaNov)
        {
            Usuario usu = (Usuario)Session["usuarioLogado"];
            Session["Message"] = "";
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
                    if (senhaNov.Trim().Length < 4)
                        Session["Message"] = "Senha inválida";
                    else
                    {
                        usu.Senha = senhaNov;
                        usu.FotoPerfil = fotoPerfil;
                        new UsuariosDAO().Atualiza(usu);
                    }
                }
            }
            else
            {
                usu.FotoPerfil = fotoPerfil;
                new UsuariosDAO().Atualiza(usu);
            }

            return RedirectToAction("Perfil");
        }

        public ActionResult Notificacao(int codN)
        {
            var nots = new NotificacaoDAO();
            string url = nots.Buscar(codN).Url;
            nots.Remover(codN);
            return Redirect(url);
        }

        [Route("Licoes/tratarAmizade/{c2}/{sit}")]
        public ActionResult TratarAmizade(int c2, string sit)
        {
            var u = (Usuario)Session["usuarioLogado"];
            var u2 = new UsuariosDAO().Buscar(s=>s.Codigo==c2);
            var nots = new NotificacaoDAO();
            var sol = new SolicitacaoAmizadeDAO();
            var amz = new AmizadeDAO();
            if (sit == "Adicionar amigo")
            {
                sol.Adicionar(u.Codigo, u2.Codigo);
                var n = new Notificacao();
                n.CodUsuario = u2.Codigo;
                n.Texto = $"O usuário {u.Nome} te enviou uma solicitação de amizade";
                n.Url = $"usuarios/{u.Codigo}";
                nots.Adicionar(n);
            }
            else if (sit == "Aceitar solicitação")
            {
                //nots.Remover($"O usuário {u2.Nome} te enviou uma solicitação de amizade");
                sol.Remover(u2.Codigo, u.Codigo);
                amz.Adicionar(u.Codigo, u2.Codigo);
                amz.Adicionar(u2.Codigo, u.Codigo);
            }
            else if (sit == "Cancelar amizade")
            {
                amz.Remover(u.Codigo, u2.Codigo);
                amz.Remover(u2.Codigo, u.Codigo);
            }
            return RedirectToAction("Visualiza", new { codU = u2.Codigo });
        }
        

        [Route("Licoes/licao/{codL}")]
        public ActionResult Licao(int codL)
        {
            if (new LicoesDAO().Buscar(codL).Nivel > ((Usuario)Session["usuarioLogado"]).Nivel)
                return RedirectToAction("Index");
            Session["perguntas"] = new PerguntaDAO().Lista(codL);
            Session["indice"] = 0;
            Session["codLicao"] = codL;
            Session["acertos"] = 0;
            return RedirectToAction("Pergunta", ((List<Pergunta>)Session["perguntas"])[0]);
        }
        
        public ActionResult Pergunta(Pergunta per)
        {
            ViewBag.pergunta = per;
            ViewBag.respostas = new RespostaDAO().Lista(per.Codigo);
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        public ActionResult ProximaPergunta(string indResp)
        {
            var resp = new RespostaDAO().Lista(((List<Pergunta>)Session["perguntas"])[(int)Session["indice"]].Codigo)[int.Parse(indResp)];
            Session["indice"] = ((int)Session["indice"]) + 1;
            if (resp.Certa)
                Session["acertos"] = ((int)Session["acertos"]) + 1;
            if (((int)Session["indice"]) >= ((List<Pergunta>)Session["perguntas"]).Count)
                return RedirectToAction("FimLicao");
            return RedirectToAction("Pergunta", ((List<Pergunta>)Session["perguntas"])[((int)Session["indice"])]);
        }

        public ActionResult FimLicao()
        {
            ViewBag.licao = new LicoesDAO().Buscar((int)Session["codLicao"]);
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            ViewBag.acertos = (int)Session["acertos"];
            ViewBag.total = (int)Session["indice"];
            if (ViewBag.licao.Nivel == ViewBag.usuario.Nivel)
            {
                ++ViewBag.usuario.Nivel;
                new UsuariosDAO().Atualiza(ViewBag.usuario);
            }
            new LicoesFeitasDAO().Adicionar(ViewBag.usuario.Codigo, ViewBag.licao.Codigo, ViewBag.acertos);                        
            Session["perguntas"] = Session["indice"] = Session["codLicao"] = Session["acertos"] = null;
            return View();
        }
    }
}