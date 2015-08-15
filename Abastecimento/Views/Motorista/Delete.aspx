<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Delete.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Motorista>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Excluir Motorista
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ConfirmTitle" runat="server">
	Tem certeza que deseja excluir este motorista?
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Motorista
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="MainTable" runat="server">
	<tr>
        <th class="display-label">Nome</th>
        <th class="display-field"><%: Model.Nome %></th>

        <th class="display-label">Sobrenome</th>
        <th class="display-field"><%: Model.Sobrenome %></th>
    </tr>
    <tr>
        <th class="display-label">Cpf</th>
        <th class="display-field"><%: Model.Cpf %></th>

        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ActionDelete" runat="server">
    <script type="text/javascript" >
        deleteButton('<%: Url.Action("Delete", "Motorista", new { keys = Model.Id_Motorista, certeza = true }) %>');
    </script>
</asp:Content>