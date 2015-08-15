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
    public static class VeiculoMotoristaModel
    {
        public static bool isAnyAbastecimentoPosto(ref VeiculoMotorista veiculo)
        {
            return veiculo.AbastecimentoPosto.Any();
        }

        public static bool deleteMotoristasAssociados(ref VeiculoMotorista veiculo)
        {
            try
            {
                while (veiculo.VeiculoMotoristaMotorista.Count > 0)
                    bdContext<AbastecimentoEntities>.Instance.BD.DeleteObject(veiculo.VeiculoMotoristaMotorista.ElementAt(0));

                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool deleteCombustiveisAssociados(ref VeiculoMotorista veiculo)
        {
            try
            {
                while (veiculo.ModeloVeiculoCombustivel.Count > 0)
                    bdContext<AbastecimentoEntities>.Instance.BD.DeleteObject(veiculo.ModeloVeiculoCombustivel.ElementAt(0));

                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool isMotoristaAlready(VeiculoMotorista veiculo, Motorista motorista)
        {
            foreach (VeiculoMotoristaMotorista motoristaInVeiculo in
                     bdContext<AbastecimentoEntities>.Instance.BD.VeiculoMotoristaMotorista.
                                                      Where(x => x.VeiculoMotorista.Id_VeiculoMotorista == 
                                                                   veiculo.Id_VeiculoMotorista))
            {
                if (motoristaInVeiculo.Motorista == motorista)
                    return true;
            }
            return false;
        }

        public static bool isCombustivelAlready(VeiculoMotorista veiculo, Combustivel combustivel)
        {
            foreach (ModeloVeiculoCombustivel combustivelInVeiculo in
                     bdContext<AbastecimentoEntities>.Instance.BD.ModeloVeiculoCombustivel.
                                                      Where(x => x.VeiculoMotorista.Id_VeiculoMotorista == veiculo.Id_VeiculoMotorista))
            {
                if (combustivelInVeiculo.Combustivel == combustivel)
                    return true;
            }
            return false;
        }

        public static string getVeiculoDetailed(VeiculoMotorista veiculo)
        {
            return veiculo.Placa + " - " + 
                   veiculo.Concessionaria.Descricao + " - " + 
                   veiculo.Veiculo.Descricao;
            //return veiculo.Veiculo.Descricao + " - " +
            //       veiculo.Placa;
        }
    }
}