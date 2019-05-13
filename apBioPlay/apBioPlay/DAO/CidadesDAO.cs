using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class CidadesDAO
    {
        public void Adicionar(Cidade e)
        {
            using (var context = new SiteContext())
            {
                context.Cidade.Add(e);
                context.SaveChanges();
            }
        }

        public IList<Cidade> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Cidade.ToList();
            }
        }
        
        public void Atualiza(Cidade u)
        {
            using (var contexto = new SiteContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}