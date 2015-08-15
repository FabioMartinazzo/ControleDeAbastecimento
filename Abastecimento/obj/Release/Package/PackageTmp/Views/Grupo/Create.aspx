<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Grupos>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Grupos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Novo Grupo
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Grupo
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
	<tr>
        <th class = "editor-label">
            <%: Html.Label("Nome") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Nome", null, new { @maxlength = ViewData["MaxLength_Nome"] })%><br />
            <%: Html.ValidationMessage("Nome", null, new { @class = "input-validation-error"})%>
        </th>
    </tr>
</asp:Content>