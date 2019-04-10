using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using BioPlay18171_18174.DAO;
using BioPlay18171_18174.Models;

namespace BioPlay18171_18174.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            /*UsuariosDAO dao = new UsuariosDAO();            
            ViewBag.Aluno = dao.Buscar(u => u.Codigo==1);*/
            return View();
        }
    }
}