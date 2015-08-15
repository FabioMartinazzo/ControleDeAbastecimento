<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<IntuitiveFramework.Models.Usuarios>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuários
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Usuários
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Usuários
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Login
    </th>
    <th>
        Nome
    </th>
    <th>
        Data Criação
    </th>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id }) %> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id, certeza = false })%>
            </td>
            <td>
                <%: item.Login %>
            </td>
            <td>
                <%: item.Nome %>
            </td>
            <td>
                <%: string.Format("{0:d}", item.DataCriacao) %>
            </td>
        </tr>
    <% } %>
</asp:Content>