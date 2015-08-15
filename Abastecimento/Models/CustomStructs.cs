using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Objects;
using IntuitiveFramework.Models;

namespace Abastecimento.Models
{
    public struct ArquivoCollection
    {
        public Byte[] Dados;
        public string Nome;
    }

    public class ValDescr
    {
        private int _id;
        private string _desc;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string Descricao
        {
            get { return _desc; }
            set { _desc = value; }
        }
    }

    public struct IntPlusFloat
    {
        public int intValue;
        public double doubleValue;
    }
}