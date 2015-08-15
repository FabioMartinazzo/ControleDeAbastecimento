<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Usuarios>" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Usuários
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Usuário
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Usuário
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id) %>
	<tr>
        <th class = "editor-label">
            <%: Html.Label("Nome do Login") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Login", Model.Login, new { @maxlength = ViewData["MaxLength_Login"] })%><br />
            <%: Html.ValidationMessage("Login", null, new { @class = "input-validation-error"})%>
        </th>

        <th>
            Bloqueado
        </th>
        <td>
            <%: Html.CheckBox("Bloqueado", Model.Bloqueado )%>
            <%: Html.ValidationMessage("Bloqueado", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>

    <tr>
        <th class = "editor-label">
            <%: Html.Label("Nome do Usuário") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Nome", Model.Nome, new { @maxlength = ViewData["MaxLength_Nome"] })%><br />
            <%: Html.ValidationMessage("Nome", null, new { @class = "input-validation-error" })%>
        </th>
        <th class = "editor-label">
            <%: Html.Label("Nova Senha") %>
        </th>
        <th class="editor-field">
            <%: Html.Password("NovaSenha", null, new { @maxlength = ViewData["MaxLength_Senha"] })%><br />
            <%: Html.ValidationMessage("NovaSenha", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Repetir Nova Senha") %>
        </th>
        <th class="editor-field">
            <%: Html.Password("NovaSenhaRepetida", null, new { @maxlength = ViewData["MaxLength_Senha"] })%><br />
            <%: Html.ValidationMessage("NovaSenhaRepetida", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="OthersForms" runat="server">
    <% int idSistema = CustomFunctions.getIdSistema("ControleAbastecimento"); %>

    <% using (Html.BeginForm("AdicionarGruposAoUsuario", "Usuario", FormMethod.Post, new { id = "Form" })) {%>
    <%: Html.ValidationSummary(true)%>
    <%: Html.Hidden("keys", Model.Id)%>
    <fieldset>
        <legend>Grupos Vinculados</legend>
        <table>
            <tr>
                <th>
                    Nome do Grupo
                </th>
                <th>
                    Pertence
                </th>
            </tr>

            <% List<Grupos> allGroups = bdContext<ControleDeLoginEntities>.Instance.BD.Grupos.Where(x => x.IdSistema == idSistema).OrderBy(y => y.Nome).ToList(); %>
            <% foreach (var item in allGroups) { %>
                   <tr>
                       <th>
                           <%: item.Nome %>
                       </th>
                       <th>
                           <%= Html.CheckBox("grp_" + item.Id) %>
                       </th>
                   </tr>
            <% } %>
            <tr>
                <input type="submit" value="Vincular" />
            </tr>
        </table>
    </fieldset>
    <% } %>    
</asp:Content>