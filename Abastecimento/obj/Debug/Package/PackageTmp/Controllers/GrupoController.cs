using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using IntuitiveFramework.Controllers;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class GrupoController : GrupoLoginController
    {
        public GrupoController()
        {
            base._idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");
        }
    }
}