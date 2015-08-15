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
    public static class UsuarioModel
    {
        public static Usuarios getUsuarioByLoginESenhaCripto(string login, string senha)
        {
            try
            {
                return 
                    bdContext<ControleDeLoginEntities>.Instance.BD.Usuarios.
                                                       Where(x => x.Login == login &&
                                                                  x.Senha == senha).
                                                       FirstOrDefault();

            }
            catch
            {
                return null;
            }
        }
    }
}