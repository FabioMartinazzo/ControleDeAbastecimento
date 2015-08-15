<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Delete.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.TipoVeiculo>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Tipo de Equipamento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Excluir Tipo de Equipamento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ConfirmTitle" runat="server">
	Tem certeza que deseja excluir este tipo de equipamento?
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Tipo de Equipamento
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="MainTable" runat="server">
	<tr>        
        <th class="display-label">Descrição</th>
        <th class="display-field"><%: Model.Descricao %></th>

        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ActionDelete" runat="server">
    <script type="text/javascript" >
        deleteButton('<%: Url.Action("Delete", "TipoVeiculo", new { keys = Model.Id_TipoVeiculo, certeza = true }) %>');
    </script>
</asp:Content>