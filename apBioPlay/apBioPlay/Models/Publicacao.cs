using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Publicacao
    {
        [Key]
        public int Codigo { get; set; }

        [Required]
        public string Conteudo { get; set; }

        [Required]
        public int CodUsuario { get; set; }

        [Required]
        public DateTime data { get; set; }
    }
}