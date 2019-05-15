using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class RespostaPublicacaoDAO
    {
        public void Adicionar(RespostaPublicacao e)
        {
            using (var context = new SiteContext())
            {
                context.RespostaPublicacao.Add(e);
                context.SaveChanges();
            }
        }

        public IList<RespostaPublicacao> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.RespostaPublicacao.ToList();
            }
        }

        public IList<RespostaPublicacao> RespostasDe(int codPublicacao)
        {
            using (var contexto = new SiteContext())
            {
                var ret = new List<RespostaPublicacao>();
                var lista = contexto.RespostaPublicacao.ToList();
                foreach (RespostaPublicacao r in lista)
                    if (r.CodPublicacao == codPublicacao)
                        ret.Add(r);
                return ret;
            }
        }

        public void Atualiza(RespostaPublicacao u)
        {
            using (var contexto = new SiteContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}