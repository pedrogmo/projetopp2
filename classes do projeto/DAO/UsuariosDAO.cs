using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using BioPlay18171_18174.Models;

namespace BioPlay18171_18174.DAO
{
    public class UsuariosDAO
    {
        public delegate bool Buscado(Usuario algo);
        public delegate bool Nome(string nome);
        public void Adicionar(Usuario u)
        {
            using (var context = new UsuariosContext())
            {
                context.Usuario.Add(u);
                context.SaveChanges();
            }
        }

        public IList<Usuario> Lista()
        {
            using (var contexto = new UsuariosContext())
            {
                return contexto.Usuario.ToList();
            }
        }

        public Usuario Buscar(Buscado cod) //sdfs.Buscar(p => p.RA == var )
        {
            using (var contexto = new UsuariosContext())
            {
                List<Usuario> lista = contexto.Usuario.ToList();
                foreach (Usuario u in lista)
                    if (cod(u))
                        return u;
                return null;
                /*return contexto.Usuario
                .Where(p => p.Ra == ra)
                .FirstOrDefault();*/
            }
        }
        public void Atualiza(Usuario u)
        {
            using (var contexto = new UsuariosContext())
            {
                contexto.Entry(u).State = EntityState.Modified;
                contexto.SaveChanges();
            }
        }
    }
}