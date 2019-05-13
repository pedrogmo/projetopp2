using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Cidade
    {
        [Key]
        public int Codigo { get; set; }
        [Required, StringLength(50)]
        public string Nome { get; set; }
        [Required, StringLength(50)]
        public string Pais { get; set; }
        [Required]
        public int Poluicao { get; set; }
    }
}