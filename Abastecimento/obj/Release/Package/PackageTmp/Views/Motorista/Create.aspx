<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Motorista>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Novo Motorista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Motorista
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
	<tr>
        <th class="editor-label">
            <%: Html.Label("Nome") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Nome", null, new { @maxlength = ViewData["MaxLength_Nome"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Nome", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Sobrenome") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Sobrenome", null, new { @maxlength = ViewData["MaxLength_Sobrenome"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Sobrenome", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Telefone 1") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Telefone1", null, new { @alt = "phone" })%><br />
            <%: Html.ValidationMessage("Telefone1", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Telefone 2") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Telefone2", null, new { @alt = "phone" })%><br />
            <%: Html.ValidationMessage("Telefone2", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Cpf") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Cpf", null, new { @alt = "cpf" })%><br />
            <%: Html.ValidationMessage("Cpf", null, new { @class = "input-validation-error" })%>
        </th>

        <th class = "editor-label">
            <%: Html.Label("Observação") %>
        </th>
        <th class="editor-field">
            <%: Html.TextArea("Observacao", null, new { @maxlength = ViewData["MaxLength_Observacao"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Observacao", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
</asp:Content>