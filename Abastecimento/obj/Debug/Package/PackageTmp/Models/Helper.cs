using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abastecimento.Models
{
    public class Helper
    {
        public string valorExtenso(string wvalor)
        {
            string[] wunidade = { "", " e um", " e dois", " e trez", " e quatro", " e cinco", " e seis", " e sete", " e oito", " e nove" };
            string[] wdezes = { "", " e onze", " e doze", " e treze", " e quatorze", " e quinze", " e dezesseis", " e dezessete", " e dezoito", " e dezenove" };
            string[] wdezenas = { "", " e dez", " e vinte", " e trinta", " e quarenta", " e cinquenta", " e sessenta", " e setenta", " e oitenta", " e noventa" };
            string[] wcentenas = { "", " e cento", " e duzentos", " e trezentos", " e quatrocentos", " e quinhentos", " e seiscentos", " e setecentos", " e oitocentos", " e novecentos" };
            string[] wplural = { " bilhões", " milhões", " mil", "" };
            string[] wsingular = { " bilhão", " milhão", " mil", "" };
            string wextenso = "";
            string wfracao;
            wvalor = wvalor.Replace("R$", "");
            string wnumero = wvalor.Replace(",", "").Trim();
            wnumero = wnumero.Replace(".", "").PadLeft(14, '0');
            if (Int64.Parse(wnumero.Substring(0, 12)) > 0)
            {
                for (int i = 0; i < 4; i++)
                {
                    wfracao = wnumero.Substring(i * 3, 3);
                    if (int.Parse(wfracao) != 0)
                    {
                        if (int.Parse(wfracao.Substring(0, 3)) == 100) wextenso += " e cem";
                        else
                        {
                            wextenso += wcentenas[int.Parse(wfracao.Substring(0, 1))];
                            if (int.Parse(wfracao.Substring(1, 2)) > 10 && int.Parse(wfracao.Substring(1, 2)) < 20) wextenso += wdezes[int.Parse(wfracao.Substring(2, 1))];
                            else
                            {
                                wextenso += wdezenas[int.Parse(wfracao.Substring(1, 1))];
                                wextenso += wunidade[int.Parse(wfracao.Substring(2, 1))];
                            }
                        }
                        if (int.Parse(wfracao) > 1)
                            wextenso += wplural[i];
                        else 
                            wextenso += wsingular[i];
                    }
                }
                if (Int64.Parse(wnumero.Substring(0, 12)) > 1) wextenso += " reais";
                else wextenso += " real";
            }
            wfracao = wnumero.Substring(12, 2);
            if (int.Parse(wfracao) > 0)
            {
                if (int.Parse(wfracao.Substring(0, 2)) > 10 && int.Parse(wfracao.Substring(0, 2)) < 20) wextenso = wextenso + wdezes[int.Parse(wfracao.Substring(1, 1))];
                else
                {
                    wextenso += wdezenas[int.Parse(wfracao.Substring(0, 1))];
                    wextenso += wunidade[int.Parse(wfracao.Substring(1, 1))];
                }
                if (int.Parse(wfracao) > 1) wextenso += " centavos";
                else wextenso += " centavo";
            }
            if (wextenso != "") wextenso = wextenso.Substring(3, 1).ToUpper() + wextenso.Substring(4);
            else wextenso = "Nada";

            wextenso = wextenso.Replace("bilhões e", "bilhões,");
            wextenso = wextenso.Replace("milhões e", "milhões,");
            wextenso = wextenso.Replace("mil e", "mil,");
            wextenso = wextenso.Replace("bilhão e", "bilhão,");
            wextenso = wextenso.Replace("milhão e", "milhão,");

            return wextenso;
        }

    }
}