using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class VeiculoMotoristaController : CadastrosAbastecimentoEntityFrameworkController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Equipamento");
            base.OnActionExecuting(filterContext);
        }

        private Func<VeiculoMotorista, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_VeiculoMotorista.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<VeiculoMotorista>(this._permissionCheck, ReadDropDownListsPesquisa);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            int? veiculo = null;
            try
            {
                veiculo = Convert.ToInt32(collection["Veiculo"]);
            }
            catch
            {
                veiculo = null;
            }

            int? tipoVeiculo = null;
            try
            {
                tipoVeiculo = Convert.ToInt32(collection["TipoVeiculo"]);
            }
            catch
            {
                tipoVeiculo = null;
            }

            int? concessionaria = null;
            try
            {
                concessionaria = Convert.ToInt32(collection["Concessionaria"]);
            }
            catch
            {
                concessionaria = null;
            }

            return base.List<VeiculoMotorista, string>(this._permissionCheck, collection,
                                                       x => ((veiculo != null) ? (x.Id_Veiculo == veiculo) : true) && 
                                                            ((tipoVeiculo != null) ? (x.Id_TipoVeiculo == tipoVeiculo) : true) && 
                                                            ((concessionaria != null) ? (x.Id_Concessionaria == concessionaria) : true) && 
                                                            x.Placa.Contains(collection["NomePesquisa"], true),
                                                        y => y.Placa, ReadDropDownListsPesquisa);
        }

        public ActionResult Create()
        {
            return base.Create<VeiculoMotorista>(this._permissionCheck, ReadDropDownLists);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<VeiculoMotorista>(this._permissionCheck, ReadDropDownLists, BusinessValidator, collection, new List<string>() { "Id_VeiculoMotorista" });
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<VeiculoMotorista>(this._permissionCheck, ReadDropDownLists, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<VeiculoMotorista>(this._permissionCheck, ReadDropDownLists, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<VeiculoMotorista>(this._permissionCheck, null, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<VeiculoMotorista>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public ActionResult AddMotorista(FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(collection["keys"]);
            return base.Add<VeiculoMotorista, VeiculoMotoristaMotorista>(ReadDropDownLists, collection, CommomIdentifier(multkeys), null, BusinessValidatorForAddMotorista);
        }

        public ActionResult AddCombustivel(FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(collection["keys"]);
            return base.Add<VeiculoMotorista, ModeloVeiculoCombustivel>(ReadDropDownLists, collection, CommomIdentifier(multkeys), null, BusinessValidatorForAddCombustivel);
        }

        public ActionResult RemoveMotorista(string keys, string keysPai)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Remove<VeiculoMotorista, VeiculoMotoristaMotorista>(ReadDropDownLists,
                                                                            x => x.Id_VeiculoMotoristaMotorista.
                                                                                 Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0))),
                                                                            keysPai);
        }

        public ActionResult RemoveCombustivel(string keys, string keysPai)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Remove<VeiculoMotorista, ModeloVeiculoCombustivel>(ReadDropDownLists,
                                                                           x => x.Id_ModeloVeiculoCombustivel.
                                                                                  Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0))),
                                                                           keysPai);
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            VeiculoMotorista veiculoMotorista = (table as VeiculoMotorista);

            if (VeiculoMotoristaModel.isAnyAbastecimentoPosto(ref veiculoMotorista))
            {
                msnErro = "Não é possível excluir um veículo que tenha algum registro de abastecimento.";
                return false;
            }

            if (!VeiculoMotoristaModel.deleteMotoristasAssociados(ref veiculoMotorista))
            {
                msnErro = "Ocorreu um erro ao tentar deletar os motoristas associados a este veículo. Delete-os manualmente.";
                return false;
            }

            if (!VeiculoMotoristaModel.deleteCombustiveisAssociados(ref veiculoMotorista))
            {
                msnErro = "Ocorreu um erro ao tentar deletar os combustíveis associados a este veículo. Delete-os manualmente.";
                return false;
            }

            return true;
        }

        public bool BusinessValidatorForAddMotorista<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            VeiculoMotoristaMotorista motoristaInVeiculo = (table as VeiculoMotoristaMotorista);

            if (VeiculoMotoristaModel.isMotoristaAlready(motoristaInVeiculo.VeiculoMotorista, motoristaInVeiculo.Motorista))
            {
                msnErro = "Não é possível adicionar mais de uma vez o mesmo motorista ao mesmo veículo.";
                return false;
            }

            return true;
        }

        public bool BusinessValidatorForAddCombustivel<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            ModeloVeiculoCombustivel combustivelInVeiculo = (table as ModeloVeiculoCombustivel);

            if (VeiculoMotoristaModel.isCombustivelAlready(combustivelInVeiculo.VeiculoMotorista, combustivelInVeiculo.Combustivel))
            {
                msnErro = "Não é possível adicionar mais de uma vez o mesmo combustível ao mesmo veículo.";
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

        private void ReadDropDownListsPesquisa()
        {
            this.ViewData["Veiculos"] = new SelectList(bdAbastecimento.Veiculo.ToList().
                                                       OrderBy(x => x.Descricao), "Id_Veiculo", "Descricao");
            this.ViewData["TiposVeiculos"] = new SelectList(bdAbastecimento.TipoVeiculo.ToList().
                                                       OrderBy(x => x.Descricao), "Id_TipoVeiculo", "Descricao");
            this.ViewData["Concessionarias"] = new SelectList(bdAbastecimento.Concessionaria.ToList().
                                                              OrderBy(x => x.Descricao), "Id_Concessionaria", "Descricao");
        }

        private void ReadDropDownLists()
        {
            ReadDropDownListsPesquisa();

            this.ViewData["Combustiveis"] = new SelectList(bdAbastecimento.Combustivel.ToList().
                                                       OrderBy(x => x.Descricao), "Id_Combustivel", "Descricao");

            this.ViewData["Motoristas"] = new SelectList(bdAbastecimento.Motorista.ToList().
                                                                        Select(x => new
                                                                        {
                                                                            Id = x.Id_Motorista,
                                                                            Descricao = x.Nome + " " +
                                                                                        x.Sobrenome + " - " +
                                                                                        x.Cpf
                                                                        }
                                                                    ).
                                                         OrderBy(x => x.Descricao), "Id", "Descricao");

            var medidores = from Enums.Medidores s in Enum.GetValues(typeof(Enums.Medidores))
                            select new
                            {
                                Id = s.GetHashCode(),
                                Descricao = EnumHelper.GetDescription(typeof(Enums.Medidores), s.ToString())
                            };

            this.ViewData["Medidores"] = new SelectList(medidores, "Id", "Descricao");
        }
    }
}
