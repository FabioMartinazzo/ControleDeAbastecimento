<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Delete.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.VeiculoMotorista>" %>
<%@ Import Namespace="Abastecimento.Models" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Excluir Equipamento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ConfirmTitle" runat="server">
	Tem certeza que deseja excluir este equipamento?
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Equipamento
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="MainTable" runat="server">
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
        <th class="display-field"><%: string.Format("{f:0}", Model.Medidor) %></th>
    </tr>
    <tr>
        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ActionDelete" runat="server">
    <script type="text/javascript" >
        deleteButton('<%: Url.Action("Delete", "VeiculoMotorista", new { keys = Model.Id_VeiculoMotorista, certeza = true }) %>');
    </script>
</asp:Content>