<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Grupos>" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Grupos
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Grupo
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Grupo
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id) %>
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

<asp:Content ID="Content7" ContentPlaceHolderID="OthersForms" runat="server">

    <% int idSistema = CustomFunctions.getIdSistema("ControleAbastecimento");  %>

    <% using (Html.BeginForm("AdicionarGruposAoUsuario", "Grupo", FormMethod.Post, new { id = "Form" })) {%>    
    <%: Html.ValidationSummary(true)%>
    <%: Html.Hidden("keys", Model.Id)%>
    <fieldset>
        <legend>Usuários Vinculados</legend>
        <table>
            <tr>
                <th>
                    Login do Usuário
                </th>
                <th>
                    Pertence
                </th>
            </tr>     
            <% int idEstabelecimento = (int)Session["IdEstabelecimento"]; %>       
            <% List<Usuarios> allUsers = bdContext<ControleDeLoginEntities>.Instance.BD.Usuarios.Where(x => x.IdSistema == idSistema && x.GrupoUsuarios.Any(g => g.IdEstabelecimento == idEstabelecimento)).OrderBy(y => y.Login).ToList(); %>
            <% foreach (var item in allUsers) { %>
            <tr>
                <th>
                    <%: item.Login %>
                </th>
                <th>
                    <%= Html.CheckBox("usr_" + item.Id) %>
                </th>
            </tr>
            <% } %>
            <tr>
                <input type="submit" value="Vincular" />
            </tr>
        </table>
    </fieldset>
    <% } %>

    <% using (Html.BeginForm("AdicionarPermissoesAoGrupo", "Grupo", FormMethod.Post, new { id = "Form" })) {%>    
    <%: Html.ValidationSummary(true)%>
    <%: Html.Hidden("keys", Model.Id)%>
    <fieldset>
        <legend>Permissões do Grupo</legend>
        <table>
            <tr>
                <th>
                    Módulo
                </th>
                <th>
                    Permissões
                </th>
            </tr>

            <% List<Visao> allModules = bdContext<ControleDeLoginEntities>.Instance.BD.Visao.Where(x => x.IdSistema == idSistema).OrderBy(y => y.Descricao).ToList(); %>
            <% foreach (var item in allModules) { %>
                    <tr>
                        <th>
                            <%: Html.Label(item.Descricao) %>
                        </th>
                        <th>
                            <% if (item.TipoPermissoesPorVisao.Create) { %>
                                <%: Html.Label("Create") %>
                                <%= Html.CheckBox("perm_" + item.Id + ";Create")%>
                            <% } %>
                            <% if (item.TipoPermissoesPorVisao.Edit) { %>
                                <%: Html.Label("Edit")%>
                                <%= Html.CheckBox("perm_" + item.Id + ";Edit") %>
                            <% } %>
                            <% if (item.TipoPermissoesPorVisao.Delete) {  %>
                                <%: Html.Label("Delete")%>
                                <%= Html.CheckBox("perm_" + item.Id + ";Delete") %>
                            <% } %>
                            <% if (item.TipoPermissoesPorVisao.List) {  %>
                                <%: Html.Label("List")%>
                                <%= Html.CheckBox("perm_" + item.Id + ";List") %>
                            <% } %>
                            <% if (item.TipoPermissoesPorVisao.Details) { %>
                                <%: Html.Label("Details")%>
                                <%= Html.CheckBox("perm_" + item.Id + ";Details") %>
                            <% } %>
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