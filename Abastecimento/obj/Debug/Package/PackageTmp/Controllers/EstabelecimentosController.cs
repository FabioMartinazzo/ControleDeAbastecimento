using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Abastecimento.Models;
using IntuitiveFramework.Controllers;
using IntuitiveFramework.Models;

namespace Abastecimento.Controllers
{
    public class EstabelecimentosController : EstabelecimentosLoginController
    {
        public EstabelecimentosController()
        {
            base._idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");
        }

        private void ReadDropDownLists()
        {
            var uf = from Enums.UFs s in Enum.GetValues(typeof(Enums.UFs))
                     select new
                     {
                         ID = s.GetHashCode(),
                         Descricao = EnumHelper.GetDescription(typeof(Enums.UFs), s.ToString())
                     };

            this.ViewData["UFs"] = new SelectList(uf, "ID", "Descricao");
        }
    }
}