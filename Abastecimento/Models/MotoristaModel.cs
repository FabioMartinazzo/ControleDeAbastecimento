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
    public static class MotoristaModel
    {
        public static bool deleteVeiculosAssociados(ref Motorista motorista)
        {
            try
            {
                while (motorista.VeiculoMotoristaMotorista.Count > 0)
                    bdContext<AbastecimentoEntities>.Instance.BD.DeleteObject(motorista.VeiculoMotoristaMotorista.ElementAt(0));

                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool isAnyVeiculo(IEnumerable<VeiculoMotoristaMotorista> veiculosMotoristaAssociados, int Id_VeiculoMotorista)
        {
            foreach (VeiculoMotoristaMotorista veiculoMotoristaAssociado in veiculosMotoristaAssociados)
            {
                if (veiculoMotoristaAssociado.VeiculoMotorista.Id_VeiculoMotorista == Id_VeiculoMotorista)
                    return true;
            }

            return false;
        }

        public static bool isVeiculoAlready(Motorista motorista, VeiculoMotorista veiculo)
        {
            foreach (VeiculoMotoristaMotorista veiculoInMotorista in 
                     bdContext<AbastecimentoEntities>.Instance.BD.VeiculoMotoristaMotorista.
                                                      Where(x => x.Motorista.Id_Motorista == motorista.Id_Motorista))
            {
                if (veiculoInMotorista.VeiculoMotorista == veiculo)
                    return true;
            }
            return false;
        }
    }
}