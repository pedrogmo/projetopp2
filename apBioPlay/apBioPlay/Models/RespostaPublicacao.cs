using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class RespostaPublicacao
    {
        [Key]
        public int Codigo { get; set; }

        [Required(ErrorMessage = "A resposta é obrigatória", AllowEmptyStrings = false)]
        public string Conteudo { get; set; }

        [Required]
        public int CodUsuario { get; set; }

        [Required]
        public int CodPublicacao { get; set; }

        [Required]
        public DateTime Data { get; set; }
    }
}