<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<IntuitiveFramework.Models.Grupos>>" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Grupos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Grupos
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Grupos
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Nome
    </th>
    <th>
        Nº Logins Pertencentes
    </th>    
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% int idSistema = CustomFunctions.getIdSistema("ControleAbastecimento"); %>
    <% int idEstabelecimento = (int)Session["IdEstabelecimento"]; %> 
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id }) %> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id, certeza = false })%>
            </td>
            <td>
                <%: item.Nome %>
            </td>
            <td>
                <%: item.GrupoUsuarios.Where(x => x.Grupos.IdSistema == idSistema && x.IdEstabelecimento == idEstabelecimento).Count()%>
            </td>
        </tr>
    <% } %>
</asp:Content>