<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<IntuitiveFramework.Models.Estabelecimentos>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Estabelecimentos
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Estabelecimentos
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Estabelecimentos
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ColumnsTitle" runat="server"> 
    <th>
        Razão Social
    </th>
    <th>
        Nome Fantasia
    </th>
    <th>
        CNPJ
    </th>
    <th>
        Telefone
    </th>
    <th>
        Fax
    </th>
    <th>
        Celular
    </th>
    <th>
        E-mail
    </th>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ColumnsData" runat="server"> 
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id }) %> |
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { keys = item.Id, certeza = false })%>
            </td>        
            <td>
                <%: item.RazaoSocial %>
            </td>
            <td>
                <%: item.NomeFantasia %>
            </td>
            <td>
                <%: item.CNPJ %>
            </td>                
            <td>
                <%: item.Fone %>
            </td>
            <td>
                <%: item.Fax %>
            </td>
            <td>
                <%: item.Celular %>
            </td>
            <td>
                <%: item.Email %>
            </td>
        </tr>
    
    <% } %>
</asp:Content>