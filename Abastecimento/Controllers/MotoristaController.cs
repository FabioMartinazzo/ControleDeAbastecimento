using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class MotoristaController : CadastrosAbastecimentoEntityFrameworkController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Motorista");
            base.OnActionExecuting(filterContext);
        }

        private Func<Motorista, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_Motorista.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<Motorista>(this._permissionCheck, ReadDropDownLists);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            int? veiculo = null;
            try
            {
                veiculo = Convert.ToInt32(collection["VeiculoMotorista"]);
            }
            catch
            {
                veiculo = null;
            }

            return base.List<Motorista, string>(this._permissionCheck, collection,
                                                    x => (
                                                          (veiculo != null) ? 
                                                            (MotoristaModel.isAnyVeiculo(
                                                                            x.VeiculoMotoristaMotorista,
                                                                            veiculo.Value)
                                                            ) 
                                                            : 
                                                            true
                                                         ) && 
                                                         (x.Nome + " " + x.Sobrenome).Contains(collection["NomePesquisa"], true),
                                                    y => y.Nome + " " + y.Sobrenome, ReadDropDownLists);
        }

        public ActionResult Create()
        {
            return base.Create<Motorista>(this._permissionCheck, ReadDropDownLists);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<Motorista>(this._permissionCheck, ReadDropDownLists, BusinessValidator, collection, new List<string>() { "Id_Motorista" });
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Motorista>(this._permissionCheck, ReadDropDownLists, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<Motorista>(this._permissionCheck, ReadDropDownLists, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<Motorista>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<Motorista>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public ActionResult AddVeiculo(FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(collection["keys"]);
            return base.Add<Motorista, VeiculoMotoristaMotorista>(ReadDropDownLists, collection, CommomIdentifier(multkeys), null, BusinessValidatorForAdd);
        }

        public ActionResult RemoveVeiculo(string keys, string keysPai)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Remove<Motorista, VeiculoMotoristaMotorista>(ReadDropDownLists,
                                                                     x => x.Id_VeiculoMotoristaMotorista.
                                                                            Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0))),
                                                                     keysPai);
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            Motorista motorista = (table as Motorista);

            if (!MotoristaModel.deleteVeiculosAssociados(ref motorista))
            {
                msnErro = "Ocorreu um erro ao tentar deletar os veículos associados a este motorista. Delete-os manualmente.";
                return false;
            }

            return true;
        }

        public bool BusinessValidatorForAdd<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            VeiculoMotoristaMotorista veiculoInMotorista = (table as VeiculoMotoristaMotorista);

            if (MotoristaModel.isVeiculoAlready(veiculoInMotorista.Motorista, veiculoInMotorista.VeiculoMotorista))
            {
                msnErro = "Não é possível adicionar mais de uma vez o mesmo veículo ao mesmo motorista.";
                return false;
            }

            return true;
        }

        public bool BusinessValidator<T>(FormCollection collection, ref T objTable) where T : class
        {
            if (!GlobalBusinessApplications.ConvertAllToUpper(ref collection))
                throw new Exception("Nao foi possivel converter para UpperCase");

            return base.ValidateEntity<T>(collection, ref objTable);
        }

        private void ReadDropDownLists()
        {
            this.ViewData["VeiculosMotorista"] = new SelectList(bdAbastecimento.VeiculoMotorista.ToList().
                                                                OrderBy(x => x.Placa), "Id_VeiculoMotorista", "Placa");
        }
    }
}
