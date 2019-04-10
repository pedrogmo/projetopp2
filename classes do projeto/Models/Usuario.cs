using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BioPlay18171_18174.Models
{
    public class Usuario
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public DateTime DataNascimento { get; set; }
        public int Nivel { get; set; }
        public string FotoPerfil { get; set; }
    }
}