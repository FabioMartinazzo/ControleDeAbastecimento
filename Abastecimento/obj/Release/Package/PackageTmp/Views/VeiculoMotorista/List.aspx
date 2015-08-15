<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Abastecimento.Models.VeiculoMotorista>>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Equipamento
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="AdditionalFilters" runat="server">
    <%: Html.Label("Tipo") %>
    <%: Html.DropDownList("TipoVeiculo", ViewData["TiposVeiculos"] as SelectList, "Todos", new { @class = "DropDownList" })%>

    <%: Html.Label("Marca") %>
    <%: Html.DropDownList("Concessionaria", ViewData["Concessionarias"] as SelectList, "Todas", new { @class = "DropDownList" })%>

    <%: Html.Label("Modelo")%>
    <%: Html.DropDownList("Veiculo", ViewData["Veiculos"] as SelectList, "Todos", new { @class = "DropDownList" })%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Placa
    </th>
    <th>
        Modelo
    </th>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id_VeiculoMotorista })%> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id_VeiculoMotorista })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id_VeiculoMotorista, certeza = false })%>
            </td>
            <td>
                <%: item.Placa %>
            </td>
            <td>
                <%: item.Veiculo.Descricao %>
            </td>
        </tr>
    <% } %>
</asp:Content>