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

        [Required(ErrorMessage = "O nickname é obrigatório", AllowEmptyStrings = false)]
        [StringLength(20)]
        [RegularExpression(@"^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\s]*$", ErrorMessage = "Nome inválido")]
        public string Nickname { get; set; }

        [Required(ErrorMessage = "O email é obrigatório", AllowEmptyStrings = false)]
        [StringLength(30)]
        public string Email { get; set; }

        [Required(ErrorMessage = "A senha é obrigatória", AllowEmptyStrings = false)]
        [StringLength(50, MinimumLength = 4)]
        [DataType(DataType.Password)]
        public string Senha { get; set; }

        [Required(ErrorMessage = "A data de nascimento é obrigatória")]
        [DisplayFormat(DataFormatString = "dd/mm/yyyy")]
        public DateTime DataNascimento { get; set; }

        public int Nivel { get; set; }

        public string FotoPerfil { get; set; }
    }
}