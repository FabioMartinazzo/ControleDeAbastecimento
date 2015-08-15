using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using IntuitiveFramework.Models;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;

namespace Abastecimento.Models
{
    public static class AbastecimentoPostoModel
    {
        public static bool isQuantidadeCombustivelMaiorZero(ref AbastecimentoPosto abastecimento)
        {
            return abastecimento.Quantidade_Combustivel >= 0;
        }

        public static bool isCombustivelInVeiculo(Combustivel combustivel, VeiculoMotorista veiculo)
        {
            foreach (ModeloVeiculoCombustivel combustivelInModeloVeiculo in
                     veiculo.ModeloVeiculoCombustivel)
            {
                if (combustivelInModeloVeiculo.Combustivel == combustivel)
                    return true;
            }

            return false;
        }

        public static bool isMedidorValidoPorData(ref AbastecimentoPosto abastecimento)
        {
            int thisAbastecId = abastecimento.Id_AbastecimentoPosto;
            int thisEquip = abastecimento.Id_VeiculoMotorista;

            IEnumerable<AbastecimentoPosto> abastecimentosDb = bdContext<AbastecimentoEntities>.Instance.BD.
                                                                         AbastecimentoPosto.
                                                                         Where(x => x.Id_AbastecimentoPosto != thisAbastecId && 
                                                                                    x.Id_VeiculoMotorista == thisEquip).
                                                                         ToList();

            foreach (var abastecimentoDb in abastecimentosDb)
            {
                if ((abastecimentoDb.Data < abastecimento.Data) && 
                    (abastecimentoDb.LeituraMedidor > abastecimento.LeituraMedidor))
                    return false;

                if ((abastecimentoDb.Data > abastecimento.Data) &&
                    (abastecimentoDb.LeituraMedidor < abastecimento.LeituraMedidor))
                    return false;
            }

            return true;
        }

        public static bool isMotoristaInVeiculo(Motorista motorista, VeiculoMotorista veiculo)
        {
            foreach (VeiculoMotoristaMotorista motoristaInVeiculo in
                     veiculo.VeiculoMotoristaMotorista)
            {
                if (motoristaInVeiculo.Motorista == motorista)
                    return true;
            }

            return false;
        }
    }
}