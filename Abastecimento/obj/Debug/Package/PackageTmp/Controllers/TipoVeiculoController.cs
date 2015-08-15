using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class TipoVeiculoController : CadastrosAbastecimentoController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Tipo Veículo");
            base.OnActionExecuting(filterContext);
        }

        private Func<TipoVeiculo, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_TipoVeiculo.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<TipoVeiculo>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            return base.List<TipoVeiculo, string>(this._permissionCheck, collection,
                                                  x => x.Descricao.Contains(collection["NomePesquisa"], true), 
                                                  y => y.Descricao);
        }

        public ActionResult Create()
        {
            return base.Create<TipoVeiculo>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<TipoVeiculo>(this._permissionCheck, null, BusinessValidator, collection);
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<TipoVeiculo>(this._permissionCheck, null, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<TipoVeiculo>(this._permissionCheck, null, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<TipoVeiculo>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<TipoVeiculo>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            TipoVeiculo tipoVeiculo = (table as TipoVeiculo);

            if (TipoVeiculoModel.isAnyVeiculo(ref tipoVeiculo))
            {
                msnErro = "Não é possível excluir um tipo de veículo que tenha algum veículo cadastrado.";
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
