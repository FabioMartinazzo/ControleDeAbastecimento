<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Details.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Combustivel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Combustível
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Detalhes do Combustível
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Combustível
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
	<tr>        
        <th class="display-label">Descrição</th>
        <th class="display-field"><%: Model.Descricao %></th>

        <th class="display-label">Observação</th>
        <th class="display-field"><%: Model.Observacao %></th>
    </tr> 
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="OtherLinks" runat="server">
    <%: Html.ActionLink("Editar", "Edit", new { keys=Model.Id_Combustivel }) %>
</asp:Content>