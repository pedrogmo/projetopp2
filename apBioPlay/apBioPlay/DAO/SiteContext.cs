using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class SiteContext : DbContext
    {
        public DbSet<Publicacao> Publicacao { get; set; }
        public DbSet<RespostaPublicacao> RespostaPublicacao { get; set; }
        public DbSet<Licao> Licao { get; set; }
        public DbSet<Pergunta> Pergunta { get; set; }
        public DbSet<Resposta> Resposta { get; set; }
        public DbSet<Cidade> Cidade { get; set; }
        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Notificacao> Notificacao { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174; Min Pool Size=5;Max Pool Size=250; Connect Timeout=3");
        }
    }
}