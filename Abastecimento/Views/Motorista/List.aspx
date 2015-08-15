<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Abastecimento.Models.Motorista>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Motorista
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="AdditionalFilters" runat="server">
    <%: Html.Label("Equipamento") %>
    <%: Html.DropDownList("VeiculoMotorista", ViewData["VeiculosMotorista"] as SelectList, "Todos", new { @class = "DropDownList" })%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Nome Completo
    </th>
    <th>
        Cpf
    </th>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id_Motorista })%> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id_Motorista })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id_Motorista, certeza = false })%>
            </td>
            <td>
                <%: item.Nome + " " + item.Sobrenome %>
            </td>
            <td>
                <%: item.Cpf %>
            </td>
        </tr>
    <% } %>
</asp:Content>