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
            using (var contexto = new LicoesContext())
            {
                return contexto.Licao.ToList();
            }
        }
    }
}