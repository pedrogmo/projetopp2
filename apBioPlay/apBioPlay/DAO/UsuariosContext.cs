﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using apBioPlay.Models;

namespace apBioPlay.DAO
{
    public class UsuariosContext : DbContext
    {
        public DbSet<Usuario> Usuario { get; set; }

        public DbSet<Notificacao> Notificacao { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=regulus.cotuca.unicamp.br;Initial Catalog=PR118174;User ID=PR118174;Password=PR118174");
        }
    }
}