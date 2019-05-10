using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class ProblemasDAO
    {
        public void Adicionar(ProblemaAmbiental e)
        {
            using (var context = new SiteContext())
            {
                context.ProblemaAmbiental.Add(e);
                context.SaveChanges();
            }
        }

        public IList<ProblemaAmbiental> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.ProblemaAmbiental.ToList();
            }
        }
        
        public void Atualiza(ProblemaAmbiental u)
        {
            using (var contexto = new SiteContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}