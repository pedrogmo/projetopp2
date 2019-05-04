using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Erro
    {
        [Key]
        public int Codigo { get; set; }
        [Required, StringLength(30)]
        public string Nome { get; set; }
        [Required, StringLength(30)]
        public int Ocasioes { get; set; }
    }
}