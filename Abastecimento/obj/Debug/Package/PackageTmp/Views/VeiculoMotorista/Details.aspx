<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Details.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.VeiculoMotorista>" %>
<%@ Import Namespace="Abastecimento.Models" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Detalhes do Equipamento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Equipamento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
    <tr>
        <th class="display-label">Placa</th>
        <th class="display-field"><%: Model.Placa %></th>

        <th class="display-label">Marca</th>
        <th class="display-field"><%: Model.Concessionaria.Descricao %></th>
    </tr>
    <tr>
        <th class="display-label">Modelo</th>
        <th class="display-field"><%: Model.Veiculo.Descricao %></th>

        <th class="display-label">Tipo</th>
        <th class="display-field"><%: Model.TipoVeiculo.Descricao %></th>
    </tr>
    <tr>
        <th class="display-label">Ano</th>
        <th class="display-field"><%: Model.Ano %></th>

        <th class="display-label">Medidor</th>
        <th class="display-field"><%: EnumHelper.GetDescription((Enums.Medidores)(Convert.ToInt32(Model.Medidor))) %></th>
    </tr>
    <tr>
        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="AditionalTables" runat="server">
    <fieldset>
        <legend>Motoristas Associados</legend>
        <table>
            <% foreach (var item in Model.VeiculoMotoristaMotorista) { %>
            <tr>
                <th class="display-label">Nome Completo</th>
                <th class="display-field"><%: item.Motorista.Nome + " " + 
                                              item.Motorista.Sobrenome %></th>

                <th class="display-label">Cpf</th>
                <th class="display-field"><%: item.Motorista.Cpf %></th>
            </tr>
            <% } %>
        </table>
    </fieldset>

    <fieldset>
        <legend>Combustíveis</legend>
        <table>
            <% foreach (var item in Model.ModeloVeiculoCombustivel) { %>
            <tr>
                <th class="display-label">Descricao</th>
                <th class="display-field"><%: item.Combustivel.Descricao %></th>
            </tr>
            <% } %>
        </table>
    </fieldset>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="OtherLinks" runat="server">
    <%: Html.ActionLink("Editar", "Edit", new { keys=Model.Id_VeiculoMotorista }) %>
</asp:Content>