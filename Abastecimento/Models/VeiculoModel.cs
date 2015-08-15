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
    public static class VeiculoModel
    {
        public static bool isAnyVeiculoMotorista(ref Veiculo veiculo)
        {
            return veiculo.VeiculoMotorista.Any();
        }
    }
}