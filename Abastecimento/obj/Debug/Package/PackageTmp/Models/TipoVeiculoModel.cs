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
    public static class TipoVeiculoModel
    {
        public static bool isAnyVeiculo(ref TipoVeiculo tipoVeiculo)
        {
            return tipoVeiculo.VeiculoMotorista.Any();
        }
    }
}