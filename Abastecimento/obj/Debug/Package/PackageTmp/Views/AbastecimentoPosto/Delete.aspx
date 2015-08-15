<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Delete.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.AbastecimentoPosto>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    Abastecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Excluir Abastecimento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ConfirmTitle" runat="server">
	Tem certeza que deseja excluir este abastecimento?
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Abastecimento
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="MainTable" runat="server">
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
        <th class="display-field"><%: Model.Quantidade_Combustivel%></th>
    </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ActionDelete" runat="server">
    <script type="text/javascript" >
        deleteButton('<%: Url.Action("Delete", "AbastecimentoPosto", new { keys = Model.Id_AbastecimentoPosto, certeza = true }) %>');
    </script>
</asp:Content>