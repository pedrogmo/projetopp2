using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;
using BioPlay18171_18174.Models;

namespace BioPlay18171_18174.DAO
{
    public class UsuariosContext : DbContext
    {
        public DbSet<Usuario> Usuario { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=regulus.cotuca.unicamp.br;Initial Catalog= PR118174;User ID=PR118174;Password=PR118174");
        }
    }
}