using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;
using System.Data.SqlClient;

namespace apBioPlay.DAO
{
    public class ParagrafoDAO : IDisposable
    {
        private SqlConnection conexao;

        public ParagrafoDAO()
        {
            conexao = new SqlConnection("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174; Min Pool Size=5;Max Pool Size=250; Connect Timeout=5");
            conexao.Open();
        }

        public void Dispose()
        {
            conexao.Close();
        }

        public List<Paragrafo> Lista(int codL)
        {
            using (var contexto = new SiteContext())
            {
                var ret = new List<Paragrafo>();
                var lista = contexto.Paragrafo.ToList();
                foreach (Paragrafo p in lista)
                    if (p.CodLicao == codL)
                        ret.Add(p);
                return ret;
            }
        }
    }
}