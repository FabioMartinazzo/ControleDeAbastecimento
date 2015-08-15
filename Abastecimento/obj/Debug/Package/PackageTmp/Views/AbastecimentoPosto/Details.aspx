<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Details.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.AbastecimentoPosto>" %>
<%@ Import Namespace="Abastecimento.Models" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Abastecimento
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Detalhes do Abastecimento
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Abastecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
    <tr>
        <th class="display-label">Posto</th>
        <th class="display-field"><%: Model.Posto.Descricao %></th>

        <th class="display-label">Data</th>
        <th class="display-field"><%: string.Format("{0:dd/MM/yyyy hh:mm}", Model.Data) %></th>
    </tr>
    <tr>
        <th class="display-label">Equipamento</th>
        <th class="display-field"><%: VeiculoMotoristaModel.getVeiculoDetailed(Model.VeiculoMotorista) %></th>
        
        <th class="display-label">Quantidade</th>
        <th class="display-field"><%: string.Format("{0:f}", Model.Quantidade_Combustivel) %></th>
    </tr>
    <tr>
        <th class="display-label">Combustível</th>
        <th class="display-field"><%: Model.Combustivel.Descricao %></th>

        <th class="display-label">Motorista</th>
        <th class="display-field"><%: Model.Motorista.Nome + " " + Model.Motorista.Sobrenome %></th>
    </tr>
    <tr>
        <th class="display-label">Leitura Medidor</th>
        <th class="display-field"><%: string.Format("{f:0}", Model.LeituraMedidor)%></th>

        <th class="display-label">Valor Unitário</th>
        <th class="display-field"><%: string.Format("{0:f}", Model.ValorUnitario) %></th>
    </tr>
    <tr>
        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="OtherLinks" runat="server">
    <%: Html.ActionLink("Editar", "Edit", new { keys = Model.Id_AbastecimentoPosto })%>
</asp:Content>