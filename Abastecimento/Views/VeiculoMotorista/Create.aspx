<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.VeiculoMotorista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Novo Equipamento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Equipamento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Placa") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Placa", null, new { @maxlength = ViewData["MaxLength_Placa"], @style = "text-transform: uppercase;width:100px" })%><br />
            <%: Html.ValidationMessage("Placa", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Marca") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Concessionaria", ViewData["Concessionarias"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Concessionaria", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>

    <tr>
        <th class="editor-label">
            <%: Html.Label("Modelo")%>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Veiculo", ViewData["Veiculos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Veiculo", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Tipo") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_TipoVeiculo", ViewData["TiposVeiculos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_TipoVeiculo", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Ano") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Ano", null, new { @alt = "int", @style = "width:60px" })%><br />
            <%: Html.ValidationMessage("Ano", null, new { @class = "input-validation-error" })%>
        </th>

        <th class = "editor-label">
            <%: Html.Label("Medidor") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Medidor", ViewData["Medidores"] as SelectList, new { @class = "DropDownList",@style = "width:100px" })%><br />
            <%: Html.ValidationMessage("Medidor", null, new { @class = "input-validation-error" })%>
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