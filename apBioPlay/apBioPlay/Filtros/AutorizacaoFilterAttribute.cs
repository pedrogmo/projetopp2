using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace apBioPlay.Filtros
{
    public class AutorizacaoFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //base.OnActionExecuting(filterContext);
            object usuario = filterContext.HttpContext.Session["usuarioLogado"];
            // se o usuario não estiver logado
            if (usuario == null)
            {
                // redirecionar usuário para pagina de login
                filterContext.Result = new RedirectToRouteResult(
                new System.Web.Routing.RouteValueDictionary(
                new { controller = "Home", action = "Index" }
                )
                );
            }
        }
    }
}