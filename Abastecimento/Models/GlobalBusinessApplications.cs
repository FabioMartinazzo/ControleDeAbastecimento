using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using IntuitiveFramework.Models;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web.Mvc;
using System.Web;

namespace Abastecimento.Models
{
    public static class GlobalBusinessApplications
    {
        public static bool IsValorVazio(string input)
        {
            return string.IsNullOrEmpty(input);
        }

        public static bool IsValorZero(decimal input)
        {
            return input.Equals(0);
        }     

        public static bool enviarEmail(string sendFrom, string sendTo, List<string> destinatarios, string emailOrigem, 
                                       string Password, string Assunto, string corpoMensagem, bool isHtml,
                                       EmailConfigs configEmail)
        {
            try
            {
                MailMessage mail = new MailMessage();

                mail.To.Add(sendTo);

                foreach (var destinatario in destinatarios)
                    mail.Bcc.Add(destinatario);

                mail.From = new MailAddress(sendFrom);
                mail.Subject = Assunto;

                mail.Body = corpoMensagem;
                mail.IsBodyHtml = isHtml;                

                SmtpClient smtp = new SmtpClient();

                smtp.Host = configEmail.SmtpHost;
                smtp.EnableSsl = configEmail.UsaSsl;

                if (configEmail.Porta != null)
                    smtp.Port = configEmail.Porta.Value;

                //smtp.UseDefaultCredentials = false;

                if (configEmail.UsaAutenticacaoPop)
                    smtp.Credentials = new System.Net.NetworkCredential(emailOrigem, Password);

                smtp.Timeout = 10000;
                smtp.Send(mail);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool isCpf(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string tempCpf;
            string digito;
            int soma;
            int resto;

            cpf = cpf.Trim();
            cpf = cpf.Replace(".", "").Replace("-", "");

            if (cpf.Length != 11)
                return false;

            tempCpf = cpf.Substring(0, 9);
            soma = 0;
            for (int i = 0; i < 9; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();

            tempCpf = tempCpf + digito;

            soma = 0;
            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cpf.EndsWith(digito);
        }

        public static bool isCNPJ(string cnpj)
        {
            int[] multiplicador1 = new int[12] { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[13] { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int soma;
            int resto;
            string digito;
            string tempCnpj;

            cnpj = cnpj.Trim();
            cnpj = cnpj.Replace(".", "").Replace("-", "").Replace("/", "");

            if (cnpj.Length != 14)
                return false;

            tempCnpj = cnpj.Substring(0, 12);

            soma = 0;
            for (int i = 0; i < 12; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador1[i];

            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();

            tempCnpj = tempCnpj + digito;
            soma = 0;
            for (int i = 0; i < 13; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador2[i];

            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cnpj.EndsWith(digito);
        }

        public static bool IsEstadoLengthValido(string estado)
        {
            return estado.Length.Equals(2);
        }

        public static int getIdEstabelecimentoUsuarioLogado(Usuarios usuario)
        {
            return usuario.Sistemas.Estabelecimentos.FirstOrDefault().Id;
        }

        public static float NullOr(double? valor, float or)
        {
            try
            {
                return float.Parse(valor.ToString());
            }
            catch
            {
                return or;
            }
        }

        public static bool isImagemValida(ref HttpPostedFileBase arquivoImagem)
        {
            try
            {
                if (
                    (arquivoImagem.ContentType == "image/jpg")
                     ||
                    (arquivoImagem.ContentType == "image/jpeg")
                   )
                    return true;

                return false;
            }
            catch
            {
                return false;
            }
        }

        public static string getLargeString(string input)
        {
            string prefix = "";
            int limitLength = 150;
            if (input.Length < limitLength)
                limitLength = input.Length;
            else
                prefix = " (...)";

            return input.Substring(0, limitLength) + prefix;
        }

        public static bool ConvertAllToUpper(ref FormCollection collection)
        {
            try
            {
                for (int index = 0; index < collection.Count; index++)
                    collection.Set(collection.GetKey(index), collection.Get(index).ToString().ToUpper());

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

