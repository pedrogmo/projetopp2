using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class ErrosDAO
    {
        public void Adicionar(Erro e)
        {
            using (var context = new ErrosContext())
            {
                context.Erro.Add(e);
                context.SaveChanges();
            }
        }

        public IList<Erro> Lista()
        {
            using (var contexto = new ErrosContext())
            {
                return contexto.Erro.ToList();
            }
        }
        
        public void Atualiza(Erro u)
        {
            using (var contexto = new ErrosContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}