using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class PostoController : CadastrosAbastecimentoController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Posto");
            base.OnActionExecuting(filterContext);
        }

        private Func<Posto, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_Posto.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<Posto>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            return base.List<Posto, string>(this._permissionCheck, collection,
                                            x => x.Descricao.Contains(collection["NomePesquisa"], true), 
                                            y => y.Descricao);
        }

        public ActionResult Create()
        {
            return base.Create<Posto>(this._permissionCheck);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<Posto>(this._permissionCheck, null, BusinessValidator, collection);
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Posto>(this._permissionCheck, null, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Posto>(this._permissionCheck, null, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<Posto>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<Posto>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            Posto posto = (table as Posto);

            if (PostoModel.isAnyAbastecimentoPosto(ref posto))
            {
                msnErro = "Não é possível excluir um posto que tenha algum registro de abastecimento.";
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
