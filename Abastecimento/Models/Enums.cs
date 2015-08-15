using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

namespace Abastecimento.Models
{
    public class Enums
    {
        public enum UFs
        {
            [Description("AC")]
            Acre = 1,
            [Description("AL")]
            Alagoas = 2,
            [Description("AP")]
            Amapa = 3,
            [Description("AM")]
            Amazonas = 4,
            [Description("BA")]
            Bahia = 5,
            [Description("CE")]
            Ceara = 6,
            [Description("ES")]
            Espirito_Santo = 7,
            [Description("GO")]
            Goias = 8,
            [Description("MA")]
            Maranhao = 9,
            [Description("MT")]
            Mato_Grosso = 10,
            [Description("MS")]
            Mato_Grosso_do_Sul = 11,
            [Description("MG")]
            Minas_Gerais = 12,
            [Description("PR")]
            Parana = 13,
            [Description("PB")]
            Paraiba = 14,
            [Description("PA")]
            Para = 15,
            [Description("PE")]
            Pernambuco = 16,
            [Description("PI")]
            Piaui = 17,
            [Description("RJ")]
            Rio_de_Janeiro = 18,
            [Description("RN")]
            Rio_Grande_do_Norte = 19,
            [Description("RS")]
            Rio_Grande_do_Sul = 20,
            [Description("RO")]
            Rondonia = 21,
            [Description("RR")]
            Roraima = 22,
            [Description("SC")]
            Santa_Catarina = 23,
            [Description("SE")]
            Sergipe = 24,
            [Description("SP")]
            Sao_Paulo = 25,
            [Description("TO")]
            Tocantins = 26,
            [Description("DF")]
            Distrito_Federal = 27,
        }

        public enum FormatosRelatorio
        {
            [Description("Pdf")]
            Pdf = 1,
            [Description("Excel")]
            Excel = 2,
        }

        public enum Medidores
        {
            [Description("Km")]
            Km = 0,
            [Description("Hora")]
            Hora = 1,
        }
    }
}