using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class PublicacaoDAO
    {
        public void Adicionar(Publicacao e)
        {
            using (var context = new ForumContext())
            {
                context.Publicacao.Add(e);
                context.SaveChanges();
            }
        }

        public IList<Publicacao> Lista()
        {
            using (var contexto = new ForumContext())
            {
                return contexto.Publicacao.ToList();
            }
        }

        public void Atualiza(Publicacao u)
        {
            using (var contexto = new ForumContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}