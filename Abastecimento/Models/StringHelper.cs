using System;
using System.Linq;

using System.Collections.Generic;
using IntuitiveFramework.Models;

namespace Abastecimento.Models
{
    public static class StringHelper
    {
        public static bool Contains(this string s, string compare, bool caseInsensitive)
        {
            switch (caseInsensitive)
            {
                case false:
                    return s.Contains(compare);
                break;
                case true:
                    return s.ToUpper().Contains(compare.ToUpper());
                break;
            }
            return false;
        }
    }
}
