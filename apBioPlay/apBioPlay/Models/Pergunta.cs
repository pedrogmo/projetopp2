using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Pergunta
    {
        [Key]
        public int Codigo { get; set; }

        [Required]
        public string Texto { get; set; }

        [Required]
        public int CodLicao { get; set; }

        [Required]
        public string UrlImagem { get; set; }

        [Required]
        public int QtdRespostas { get; set; }
    }
}