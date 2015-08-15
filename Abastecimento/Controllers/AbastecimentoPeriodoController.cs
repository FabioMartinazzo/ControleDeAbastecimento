using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Abastecimento.Models;
using Microsoft.Reporting.WebForms;
using IntuitiveFramework.Models;
using Abastecimento.Relatorios;

namespace Abastecimento.Controllers
{
    public class AbastecimentoPeriodoController : ListAbastecimentoController
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Abastecimento por Período");
            base.OnActionExecuting(filterContext);
        }

        public ActionResult List()
        {
            return base.List(this._permissionCheck, ReadDropDownListsPesquisa);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            Session["FormatoRelatorio"] = Convert.ToInt32(collection["FormatoRelatorio"]);
            Session["dataInicial"] = collection["dataInicial"];
            Session["dataFinal"] = collection["dataFinal"];

            Session["Tipo"] = collection["Tipo"];
            Session["Marca"] = collection["Marca"];
            Session["Modelo"] = collection["Modelo"];
            Session["Equipamento"] = collection["Equipamento"];
           
            Response.Redirect("/Relatorios/AbastecimentoPeriodo.aspx");

            return null;
        }

        private void ReadDropDownListsPesquisa()
        {
            ViewData["Tipos"] = new SelectList(bdAbastecimento.TipoVeiculo.OrderBy(y => y.Descricao), 
                                               "Id_TipoVeiculo", "Descricao");

            ViewData["Marcas"] = new SelectList(bdAbastecimento.Concessionaria.OrderBy(y => y.Descricao),
                                                "Id_Concessionaria", "Descricao");

            ViewData["Modelos"] = new SelectList(bdAbastecimento.Veiculo.OrderBy(y => y.Descricao),
                                                 "Id_Veiculo", "Descricao");

            ViewData["Equipamentos"] = new SelectList(bdAbastecimento.VeiculoMotorista.OrderBy(y => y.Placa),
                                                     "Id_VeiculoMotorista", "Placa");
        }
    }
}
