using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Notificacao
    {
        [Key]
        public int Codigo { get; set; }

        [Required]
        public string Texto { get; set; }

        [Required]
        public int CodUsuario { get; set; }
    }
}