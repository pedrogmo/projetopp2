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
            using (var context = new SiteContext())
            {
                context.Publicacao.Add(e);
                context.SaveChanges();
            }
        }

        public IList<Publicacao> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Publicacao.ToList();
            }
        }

        public void Atualiza(Publicacao u)
        {
            using (var contexto = new SiteContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }

        public Publicacao Buscar(int cod)
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Publicacao
                .Where(p => p.Codigo == cod)
                .FirstOrDefault();
            }
        }
    }
}