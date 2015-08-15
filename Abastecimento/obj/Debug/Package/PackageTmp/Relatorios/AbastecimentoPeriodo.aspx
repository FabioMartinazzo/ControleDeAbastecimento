<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AbastecimentoPeriodo.aspx.cs" Inherits="Abastecimento.Relatorios.AbastecimentoPeriodo" %>
<%@ Import Namespace="Microsoft.Reporting.WebForms" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <rsweb:ReportViewer ID="reportAbastecimentoPeriodo" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1080px">
        <LocalReport ReportPath="Relatorios\AbastecimentoPeriodo.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
    
</body>
</html>
