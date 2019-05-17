using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class NotificacaoDAO
    {
        public void Adicionar(Notificacao n)
        {
            using (var context = new SiteContext())
            {
                context.Notificacao.Add(n);
                context.SaveChanges();
            }
        }

        public void Remover(string msg)
        {
            using (var context = new SiteContext())
            {
                var n = Buscar(msg);
                if (n != null)
                {
                    context.Notificacao.Remove(n);
                    context.SaveChanges();
                }
            }
        }

        public IList<Notificacao> Lista()
        {
            using (var contexto = new SiteContext())
            {
                return contexto.Notificacao.ToList();
            }
        }

        public Notificacao Buscar(string m)
        {
            using (var contexto = new SiteContext())
            {
                List<Notificacao> lista = contexto.Notificacao.ToList();
                return contexto.Notificacao
                    .Where(n => n.Texto == m)
                    .FirstOrDefault();
            }
        }
    }
}