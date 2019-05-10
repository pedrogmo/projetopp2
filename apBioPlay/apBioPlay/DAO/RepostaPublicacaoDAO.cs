using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class RepostaPublicacaoDAO
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