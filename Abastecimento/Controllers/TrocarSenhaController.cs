using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using IntuitiveFramework.Controllers;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class TrocarSenhaController : TrocarSenhaLoginController
    {
        public TrocarSenhaController()
        {
            base._idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");
        }
    }
}