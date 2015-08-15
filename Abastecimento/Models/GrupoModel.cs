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
    public static class GrupoModel
    {
        public static bool isGrupoAdmin(Grupos grupo)
        {
            try
            {
                if ((grupo.Nome == "Admin") && (grupo.IdSistema == 1))
                    return true;

                return false;
            }
            catch
            {
                return false;
            }
        }
    }
}