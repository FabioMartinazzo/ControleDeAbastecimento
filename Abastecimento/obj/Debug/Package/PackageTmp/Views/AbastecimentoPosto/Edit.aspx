<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.AbastecimentoPosto>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Abastecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Abastecimento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Abastecimento
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id_AbastecimentoPosto)%>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Posto") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Posto", ViewData["Postos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Posto", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Quantidade") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Quantidade_Combustivel", 100 * Model.Quantidade_Combustivel, new { @alt = "signed-decimal", @style = "width:50px" })%>
            <%: Html.ValidationMessage("Quantidade_Combustivel", null, new { @class = "input-validation-error" })%>
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

        <th class="editor-label">
            <%: Html.Label("Data")%>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Data", null, new { @class = "campoData", @style = "width:80px" })%>
            <%: Html.ValidationMessage("Data", null, new { @class = "input-validation-error" })%>
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
           <%: Html.TextBox("LeituraMedidor", 100 * Model.LeituraMedidor, new { @alt = "signed-decimal", @style = "width:60px" })%><br />
           <%: Html.ValidationMessage("LeituraMedidor", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Valor Unitário")%>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("ValorUnitario", 100 * Model.ValorUnitario, new { @alt = "signed-decimal" })%>
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