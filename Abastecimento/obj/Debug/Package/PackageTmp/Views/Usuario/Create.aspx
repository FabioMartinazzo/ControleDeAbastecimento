<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Usuarios>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuários
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Novo Usuário
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Usuário
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
	<tr>
        <th class = "editor-label">
            <%: Html.Label("Nome do Login") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Login", null, new { @maxlength = ViewData["MaxLength_Login"] })%><br />
            <%: Html.ValidationMessage("Login", null, new { @class = "input-validation-error"})%>
        </th>

        <th class = "editor-label">
            <%: Html.Label("Senha") %>
        </th>
        <th class="editor-field">
            <%: Html.Password("Senha", null, new { @maxlength = ViewData["MaxLength_Senha"] })%><br />
            <%: Html.ValidationMessage("Senha", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>

    <tr>
        <th>
            Bloqueado
        </th>
        <td>
            <%: Html.CheckBox("Bloqueado", null )%>
            <%: Html.ValidationMessage("Bloqueado", null, new { @class = "input-validation-error" })%>
        </td>
        <th class = "editor-label">
            <%: Html.Label("Nome do Usuário") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Nome", null, new { @maxlength = ViewData["MaxLength_Nome"] })%><br />
            <%: Html.ValidationMessage("Nome", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>

</asp:Content>