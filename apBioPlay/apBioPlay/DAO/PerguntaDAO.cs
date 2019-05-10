using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class PerguntaDAO
    {
        public IList<Pergunta> Lista(int codL)
        {
            List<Pergunta> ret = new List<Pergunta>();
            using (var contexto = new LicoesContext())
            {
                foreach (Pergunta p in contexto.Pergunta.ToList())
                    if (p.CodLicao == codL)
                        ret.Add(p);
            }
            return ret;
        }
    }
}