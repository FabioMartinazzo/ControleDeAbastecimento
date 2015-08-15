<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Details.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Motorista>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Detalhes do Motorista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Motorista
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
    <tr>
        <th class="display-label">Nome</th>
        <th class="display-field"><%: Model.Nome %></th>

        <th class="display-label">Sobrenome</th>
        <th class="display-field"><%: Model.Sobrenome %></th>
    </tr>
    <tr>
        <th class="display-label">Telefone 1</th>
        <th class="display-field"><%: Model.Telefone1 %></th>

        <th class="display-label">Telefone 2</th>
        <th class="display-field"><%: Model.Telefone2 %></th>
    </tr>
    <tr>
        <th class="display-label">Cpf</th>
        <th class="display-field"><%: Model.Cpf %></th>

        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="AditionalTables" runat="server">
    <fieldset>
        <legend>Carros Associados</legend>
        <table>
            <% foreach (var item in Model.VeiculoMotoristaMotorista) { %>
            <tr>
                <th class="display-label">Veículo</th>
                <th class="display-field"><%: ModeloVeiculoModel.getVeiculoDetailed(item.VeiculoMotorista.ModeloVeiculo) %></th>

                <th class="display-label">Cor</th>
                <th class="display-field"><%: item.VeiculoMotorista.Cor.Descricao %></th>

                <th class="display-label">Placa</th>
                <th class="display-field"><%: item.VeiculoMotorista.Placa %></th>
            </tr>
            <% } %>
        </table>
    </fieldset>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="OtherLinks" runat="server">
    <%: Html.ActionLink("Editar", "Edit", new { keys=Model.Id_Motorista }) %>
</asp:Content>