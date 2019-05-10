using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class RespostaDAO
    {
        public IList<Resposta> Lista(int codP)
        {
            List<Resposta> ret = new List<Resposta>();
            using (var contexto = new LicoesContext())
            {
                foreach (Resposta r in contexto.Resposta.ToList())
                    if (r.CodPergunta == codP)
                        ret.Add(r);
            }
            return ret;
        }
    }
}