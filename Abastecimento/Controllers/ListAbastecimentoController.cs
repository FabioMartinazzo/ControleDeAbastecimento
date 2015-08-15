using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Objects;
using System.Reflection;
using System.Configuration;

using Abastecimento.Models;
using IntuitiveFramework.Controllers;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class ListAbastecimentoController : ListController<AbastecimentoEntities>
    {
        protected AbastecimentoEntities bdAbastecimento;

        protected ListAbastecimentoController()
        {
            bdAbastecimento = base.bdInstance;
            base._idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");
        }
    }
}
