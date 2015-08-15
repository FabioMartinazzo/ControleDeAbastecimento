using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class VeiculoController : CadastrosAbastecimentoController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Modelo");
            base.OnActionExecuting(filterContext);
        }

        private Func<Veiculo, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_Veiculo.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<Veiculo>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            return base.List<Veiculo, string>(this._permissionCheck, collection,
                                              x => x.Descricao.Contains(collection["NomePesquisa"], true),
                                              y => y.Descricao);
        }

        public ActionResult Create()
        {
            return base.Create<Veiculo>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<Veiculo>(this._permissionCheck, null, BusinessValidator, collection);
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Veiculo>(this._permissionCheck, null, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Veiculo>(this._permissionCheck, null, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<Veiculo>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<Veiculo>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            Veiculo veiculo = (table as Veiculo);

            if (VeiculoModel.isAnyVeiculoMotorista(ref veiculo))
            {
                msnErro = "Não é possível excluir um modelo que tenha algum equipamento.";
                return false;
            }

            return true;
        }

        public bool BusinessValidator<T>(FormCollection collection, ref T objTable) where T : class
        {
            if (!GlobalBusinessApplications.ConvertAllToUpper(ref collection))
                throw new Exception("Nao foi possivel converter para UpperCase");

            if (GlobalBusinessApplications.IsValorVazio(collection["Descricao"]))
            {
                ModelState.AddModelError("Descricao", "Descrição Obrigatória!");
                return false;
            }

            return base.ValidateEntity<T>(collection, ref objTable);
        }
    }
}
