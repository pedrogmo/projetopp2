using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class LicoesDAO
    {
        public IList<Licao> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Licao.ToList();
            }
        }

        public Licao Buscar(int codL)
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Licao
                .Where(l=>l.Codigo==codL)
                .FirstOrDefault();
            }
        }
    }
}