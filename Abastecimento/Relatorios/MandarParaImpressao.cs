using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Objects.DataClasses;
using Microsoft.Reporting.WebForms;
using System.Globalization;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Relatorios
{
    public class MandarParaImpressao : System.Web.UI.Page
    {
        protected void Imprimir(ref ReportViewer reportViewer, string nomeRelatorio)
        {
            string tipoRelatorio = EnumHelper.GetDescription(typeof(Enums.FormatosRelatorio), Enum.GetName(typeof(Enums.FormatosRelatorio), (int)Session["FormatoRelatorio"]));

            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = "application/" + tipoRelatorio;
            string encoding = string.Empty;
            string extension = string.Empty;

            byte[] bytes = reportViewer.LocalReport.Render(tipoRelatorio, null, out mimeType, out encoding, out extension, out streamids, out warnings);

            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}.{1}", nomeRelatorio, extension));
            Response.BinaryWrite(bytes);
            Response.Flush();
        }
    }
}