using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using IntuitiveFramework.Controllers;
using IntuitiveFramework.Models;

namespace BeautySys.Controllers
{
    public class UsuarioController : UsuarioLoginController
    {
        public UsuarioController()
        {
            base._idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");
        }
    }
}