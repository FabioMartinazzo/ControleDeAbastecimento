using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class ConcessionariaController : CadastrosAbastecimentoController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Marca");
            base.OnActionExecuting(filterContext);
        }

        private Func<Concessionaria, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_Concessionaria.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<Concessionaria>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            return base.List<Concessionaria, string>(this._permissionCheck, collection,
                                                     x => x.Descricao.Contains(collection["NomePesquisa"], true), 
                                                     y => y.Descricao);
        }

        public ActionResult Create()
        {
            return base.Create<Concessionaria>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<Concessionaria>(this._permissionCheck, null, BusinessValidator, collection);
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Concessionaria>(this._permissionCheck, null, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Concessionaria>(this._permissionCheck, null, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<Concessionaria>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<Concessionaria>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            Concessionaria concessionaria = (table as Concessionaria);

            if (ConcessionariaModel.isAnyVeiculo(ref concessionaria))
            {
                msnErro = "Não é possível excluir uma concessionária que tenha algum veículo.";
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
