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

        [Route("usuarios/{codU}")]
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
            Session["valido"] = "SIM";
            if (ModelState.IsValid)
            {
                pub.Data = DateTime.Now;
                new PublicacaoDAO().Adicionar(pub);
            }   
            else
                Session["valido"] = "NAO";
            return RedirectToAction("Forum");
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

        public ActionResult Notificacao(int codN)
        {
            var nots = new NotificacaoDAO();
            nots.Remover(codN);
            return RedirectToAction(nots.Buscar(codN).Url);
        }

        [Route("tratarAmizade/{c2}/{sit}")]
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

        [Route("licao/{codL}")]
        public ActionResult Licao(int codL)
        {
            Session["perguntas"] = new PerguntaDAO().Lista(codL);
            Session["indice"] = 0;
            Session["codLicao"] = codL;
            Session["acertos"] = 0;
            return RedirectToAction("Pergunta", ((List<Pergunta>)Session["perguntas"])[0]);
        }
        
        public ActionResult Pergunta(Pergunta per)
        {
            //ViewBag.indResp = 0;
            ViewBag.pergunta = per;
            ViewBag.respostas = new RespostaDAO().Lista(per.Codigo);
            //Session["respostas"] = ViewBag.respostas;
            ViewBag.usuario = (Usuario)Session["usuarioLogado"];
            return View();
        }

        public ActionResult ProximaPergunta(Resposta resp)
        {
            Session["indice"] = ((int)Session["indice"]) + 1;
            if (resp.Certa)
                Session["acertos"] = ((int)Session["acertos"]) + 1;
            if (((int)Session["indice"]) >= ((List<Pergunta>)Session["perguntas"]).Count)
                return RedirectToAction("FimLicao");
            return RedirectToAction("Pergunta", ((List<Pergunta>)Session["perguntas"])[((int)Session["indice"])]);
        }

        public ActionResult FimLicao()
        {
            ++((Usuario)Session["usuarioLogado"]).Nivel;
            new LicoesFeitasDAO().Adicionar(((Usuario)Session["usuarioLogado"]).Codigo, (int)Session["codLicao"], (int)Session["acertos"]);
            return View();
        }
    }
}