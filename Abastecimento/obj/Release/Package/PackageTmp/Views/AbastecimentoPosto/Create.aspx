﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.AbastecimentoPosto>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Abastecimento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Novo Abastecimento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Abastecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
	<tr>
        <th class="editor-label">
            <%: Html.Label("Posto") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Posto", ViewData["Postos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Posto", null, new { @class = "input-validation-error" })%>
        </th>
        <th class="editor-label">
            <%: Html.Label("Data")%>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Data", DateTime.Now, new { @class = "campoData", @style="width:80px" /*@alt = "datetime"*/ }) %>
            <%: Html.ValidationMessage("Data", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Equipamento") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_VeiculoMotorista", ViewData["VeiculosMotorista"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_VeiculoMotorista", null, new { @class = "input-validation-error" })%>
        </th>    
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Combustível") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Combustivel", ViewData["Combustiveis"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Combustivel", null, new { @class = "input-validation-error" })%>
        </th>

         <th class="editor-label">
            <%: Html.Label("Quantidade") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Quantidade_Combustivel", null, new { @alt = "signed-decimal", @style = "width:50px" })%>
            <%: Html.ValidationMessage("Quantidade_Combustivel", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Motorista") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Motorista", ViewData["Motoristas"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Motorista", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Leitura Medidor") %>
        </th>
        <th class="editor-field">
           <%: Html.DropDownList("LeituraMedidor", ViewData["Medidores"] as SelectList, new { @class = "DropDownList",@style = "width:100px" })%><br />
           <%: Html.ValidationMessage("LeituraMedidor", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Valor Unitário")%>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("ValorUnitario", null, new { @alt = "signed-decimal" , @style = "width:60px"})%>
            <%: Html.ValidationMessage("ValorUnitario", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Observação") %>
        </th>
        <th colspan=3 class="editor-field">
            <%: Html.TextArea("Observacao", null, new { @maxlength = ViewData["MaxLength_Observacao"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Observacao", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
</asp:Content>