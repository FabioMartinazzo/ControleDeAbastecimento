using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;
using IntuitiveFramework.Controllers;

namespace Abastecimento.Controllers
{
    [HandleError]
    public class HomeController : LoginSessionsController
    {
        public ActionResult Index()
        {
            Session["AbaAtiva"] = "Home";
            return View();
        }

        public ActionResult Cadastros()
        {
            Session["AbaAtiva"] = "Cadastros";
            return View();
        }

        public ActionResult Controle()
        {
            Session["AbaAtiva"] = "Controle";
            return View();
        }

        public ActionResult Relatorios()
        {
            Session["AbaAtiva"] = "Relatorios";
            return View();
        }

        public ActionResult Administrativo()
        {
            Session["AbaAtiva"] = "Administrativo";
            return View();
        }

        public ActionResult Erro(string msnErro)
        {
            this.ViewData["Erro"] = msnErro;
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            return base.Login<AbastecimentoEntities>(collection, "ControleAbastecimento");
        }

        public ActionResult getLogoTop()
        {
            Estabelecimentos objEstabelecimento = getEstabBySessionId();

            var logoTop = (objEstabelecimento == null) ? null : objEstabelecimento.LogoTop;

            return File(logoTop == null ? new byte[] { 0 } : logoTop, "image/jpg");
        }

        public ActionResult getLogo()
        {
            Estabelecimentos objEstabelecimento = getEstabBySessionId();

            var logo = (objEstabelecimento == null) ? null : objEstabelecimento.Logo;

            return File(logo == null ? new byte[] { 0 } : logo, "image/jpg");
        }

        private Estabelecimentos getEstabBySessionId()
        {
            int? idEstab;
            try
            {
                idEstab = (int)Session["IdEstabelecimento"];
            }
            catch
            {
                idEstab = null;
            }

            return (idEstab == null) ? null : bdContext<ControleDeLoginEntities>.Instance.BD.
                                                        Estabelecimentos.Where(x => x.Id == idEstab.Value).
                                                        FirstOrDefault();
        }
    }
}