<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Combustivel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Combustível
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Combustível
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Combustível
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id_Combustivel) %>
    <tr>
	    <th class = "editor-label">
            <%: Html.Label("Descrição") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Descricao", null, new { @maxlength = ViewData["MaxLength_Descricao"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Descricao", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Observação") %>
        </th>
        <th class="editor-field">
            <%: Html.TextArea("Observacao", null, new { @maxlength = ViewData["MaxLength_Observacao"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Observacao", null, new { @class = "input-validation-error" })%>
        </th>  
    </tr>
</asp:Content>