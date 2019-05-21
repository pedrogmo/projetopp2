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

        [Required(ErrorMessage = "O conteúdo é obrigatório", AllowEmptyStrings = false)]
        public string Conteudo { get; set; }

        [Required]
        public int CodUsuario { get; set; }

        [Required]
        public DateTime Data { get; set; }
    }
}