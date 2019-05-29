using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace apBioPlay.Models
{
    public class Paragrafo
    {
        [Key]
        public int Codigo { get; set; }
        public string Texto { get; set; }
        public int CodLicao { get; set; }
    }
}