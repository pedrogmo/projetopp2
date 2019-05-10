using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Resposta
    {
        [Key]
        public int Codigo { get; set; }

        [Required]
        public string Texto { get; set; }

        [Required]
        public string UrlImagem { get; set; }

        [Required]
        public int CodPergunta { get; set; }

        public bool Certa { get; set; }
    }
}