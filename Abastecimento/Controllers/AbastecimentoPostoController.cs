using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class AbastecimentoPostoController : CadastrosAbastecimentoController, ICadastros
    {
        private TPermissionCheck _permissionCheck;

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this._permissionCheck = new TPermissionCheck(getLoginUser(), "Abastecimento");
            base.OnActionExecuting(filterContext);
        }

        private Func<AbastecimentoPosto, bool> CommomIdentifier(MultKeys multkeys)
        {
            return x => x.Id_AbastecimentoPosto.Equals(Convert.ToInt32(multkeys.GetKeyinIndex(0)));
        }

        public ActionResult List()
        {
            return base.List<AbastecimentoPosto>(this._permissionCheck, ReadDropDownListsPesquisa);
        }

        [HttpPost]
        public ActionResult List(FormCollection collection)
        {
            int? posto = null;
            try
            {
                posto = Convert.ToInt32(collection["Posto"]);
            }
            catch
            {
                posto = null;
            }

            int? veiculoMotorista = null;
            try
            {
                veiculoMotorista = Convert.ToInt32(collection["VeiculoMotorista"]);
            }
            catch
            {
                veiculoMotorista = null;
            }

            DateTime? DataInicial = null;
            try
            {
                DataInicial = Convert.ToDateTime(collection["DataInicial"]);
            }
            catch
            {
                DataInicial = null;
            }

            DateTime? DataFinal = null;
            try
            {
                DataFinal = Convert.ToDateTime(collection["DataFinal"]);
            }
            catch
            {
                DataFinal = null;
            }

            return base.List<AbastecimentoPosto, DateTime>(this._permissionCheck, collection,
                                                           x => ((DataInicial == null) ? true : (x.Data.Date >= DataInicial.Value.Date)) &&
                                                                ((DataFinal == null) ? true : (x.Data.Date <= DataFinal.Value.Date)) &&
                                                                ((posto != null) ? (x.Id_Posto == posto) : true) &&
                                                                ((veiculoMotorista != null) ? (x.Id_VeiculoMotorista == veiculoMotorista) : true) &&
                                                                x.VeiculoMotorista.Placa.Contains(collection["NomePesquisa"], true), 
                                                           y => y.Data, ReadDropDownListsPesquisa, false);
        }

        public ActionResult Create()
        {
            return base.Create<AbastecimentoPosto>(this._permissionCheck, ReadDropDownLists);
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            return base.Create<AbastecimentoPosto>(this._permissionCheck, ReadDropDownLists, BusinessValidator, collection);
        }

        public ActionResult Edit(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<AbastecimentoPosto>(this._permissionCheck, ReadDropDownLists, CommomIdentifier(multkeys));
        }

        [HttpPost]
        public ActionResult Edit(string keys, FormCollection collection)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Edit<AbastecimentoPosto>(this._permissionCheck, ReadDropDownLists, BusinessValidator, CommomIdentifier(multkeys), collection);
        }

        public ActionResult Delete(string keys, Boolean certeza)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Delete<AbastecimentoPosto>(this._permissionCheck, ReadDropDownLists, BusinessValidatorForDelete, CommomIdentifier(multkeys), certeza);
        }

        public ActionResult Details(string keys)
        {
            MultKeys multkeys = new MultKeys(keys);
            return base.Details<AbastecimentoPosto>(this._permissionCheck, CommomIdentifier(multkeys));
        }

        public bool BusinessValidatorForDelete<T>(FormCollection formcollection, ref T table, out string msnErro) where T : class
        {
            msnErro = "";
            return true;
        }

        public bool BusinessValidator<T>(FormCollection collection, ref T objTable) where T : class
        {
            if (!GlobalBusinessApplications.ConvertAllToUpper(ref collection))
                throw new Exception("Nao foi possivel converter para UpperCase");

            decimal? qtdCombustivel = null;
            try
            {
                qtdCombustivel = Convert.ToDecimal(collection["Quantidade_Combustivel"]);
            }
            catch
            {
                qtdCombustivel = null;
            }

            if (qtdCombustivel == null)
            {
                ModelState.AddModelError("Quantidade_Combustivel", "Quantidade de combustível deve ser um valor numérico!");
                return false;
            }

            AbastecimentoPosto abastecimentoPosto = (objTable as AbastecimentoPosto);

            if (!base.ValidateEntity<T>(collection, ref objTable))
                return false;

            if (!AbastecimentoPostoModel.isQuantidadeCombustivelMaiorZero(ref abastecimentoPosto))
            {
                ModelState.AddModelError("Quantidade_Combustivel", "Quantidade de combustível deve ser maior que zero!");
                return false;
            }

            Combustivel combustivel = bdAbastecimento.Combustivel.
                                                      Where(x => x.Id_Combustivel.Equals(abastecimentoPosto.Id_Combustivel)).
                                                      FirstOrDefault();
            VeiculoMotorista veiculo = bdAbastecimento.VeiculoMotorista.
                                                       Where(x => x.Id_VeiculoMotorista == abastecimentoPosto.Id_VeiculoMotorista).
                                                       FirstOrDefault();
            Motorista motorista = bdAbastecimento.Motorista.
                                                  Where(x => x.Id_Motorista == abastecimentoPosto.Id_Motorista).
                                                  FirstOrDefault();

            if (veiculo != null)
            {
                if (!AbastecimentoPostoModel.isCombustivelInVeiculo(combustivel, veiculo))
                    throw new Exception("O combustível não é compatível com esse equipamento!");

                //if (!AbastecimentoPostoModel.isMotoristaInVeiculo(motorista, veiculo))
                //    throw new Exception("O motorista não dirige esse equipamento!");
            }

            if (!AbastecimentoPostoModel.isMedidorValidoPorData(ref abastecimentoPosto))
                throw new Exception("A leitura do medidor não está adequada para esta data!");

            return true;
        }

        private void ReadDropDownListsPesquisa()
        {
            this.ViewData["VeiculosMotorista"] = new SelectList(bdAbastecimento.VeiculoMotorista.ToList().
                                                                                Select(x => new
                                                                                        {
                                                                                            Id = x.Id_VeiculoMotorista,
                                                                                            Descricao = VeiculoMotoristaModel.getVeiculoDetailed(x)
                                                                                        }
                                                                                      ).
                                                               OrderBy(x => x.Descricao), "Id", "Descricao");

            this.ViewData["Postos"] = new SelectList(bdAbastecimento.Posto.ToList().
                                                     OrderBy(x => x.Descricao), "Id_Posto", "Descricao");
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
                                                                       NomeCompleto = x.Nome + " " + x.Sobrenome
                                                                   }
                                                                ).
                                                           OrderBy(x => x.NomeCompleto), "Id", "NomeCompleto");
        }
    }
}
