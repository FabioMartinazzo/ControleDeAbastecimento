<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Abastecimento.Models.AbastecimentoPosto>>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Abastecimento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Abastecimento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Abastecimento
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="AdditionalFilters" runat="server">
    <%: Html.Label("Posto") %>
    <%: Html.DropDownList("Posto", ViewData["Postos"] as SelectList, "Todos", new { @class = "DropDownList" })%>

    <%: Html.Label("Equipamento") %>
    <%: Html.DropDownList("VeiculoMotorista", ViewData["VeiculosMotorista"] as SelectList, "Todos", new { @class = "DropDownList" })%>

    <%: Html.Label("Data Inicial:") %>
    <%: Html.TextBox("DataInicial", ViewData["DataInicial"] != null ? ViewData["DataInicial"] : string.Format("{0:dd/MM/yyyy}", DateTime.Now), new { @class = "campoData", @style = "width:80px" })%>
    <%: Html.ValidationMessage("DataInicial", null, new { @class = "input-validation-error" })%>

    <%: Html.Label("Data Final:") %>
    <%: Html.TextBox("DataFinal", ViewData["DataFinal"] != null ? ViewData["DataFinal"] : string.Format("{0:dd/MM/yyyy}", DateTime.Now), new { @class = "campoData", @style = "width:80px" })%>
    <%: Html.ValidationMessage("DataFinal", null, new { @class = "input-validation-error" })%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Posto
    </th>
    <th>
        Data
    </th>
    <th>
        Equipamento
    </th>
    <th>
        Quantidade
    </th>
    <th>
        Combustível
    </th>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id_AbastecimentoPosto })%> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id_AbastecimentoPosto })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id_AbastecimentoPosto, certeza = false })%>
            </td>
            <td>
                <%: item.Posto.Descricao %>
            </td>
            <td>
                <%: string.Format("{0:dd/MM/yyyy hh:mm}", item.Data) %>
            </td>
            <td>
                <%: VeiculoMotoristaModel.getVeiculoDetailed(item.VeiculoMotorista) %>
            </td>
            <td>
                <%: string.Format("{0:f}", item.Quantidade_Combustivel) %>
            </td>
            <td>
                <%: item.Combustivel.Descricao %>
            </td>
        </tr>
    <% } %>
</asp:Content>