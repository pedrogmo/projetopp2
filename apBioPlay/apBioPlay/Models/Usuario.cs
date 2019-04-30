using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace apBioPlay.Models
{
    public class Usuario
    {
        [Key]
        public int Codigo { get; set; }
        [Required, StringLength(30)]
        public string Nome { get; set; }
        [Required, StringLength(30)]
        public string Email { get; set; }
        [Required, StringLength(30)]
        public string Senha { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "mm/dd/yyyy")]
        public Date DataNascimento { get; set; }
        public int Nivel { get; set; }
        public string FotoPerfil { get; set; }
    }
}