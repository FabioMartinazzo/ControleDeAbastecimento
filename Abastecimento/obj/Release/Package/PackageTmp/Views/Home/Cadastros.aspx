<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cadastros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cadastros</h1>
    <br />
    <ul>

        <li><%= Html.ActionLink("Equipamentos", "List", "VeiculoMotorista")%></li>
        <li><%= Html.ActionLink("Motoristas", "List", "Motorista")%></li>
        <li><%= Html.ActionLink("Postos", "List", "Posto")%></li>
        <li><%= Html.ActionLink("Combustiveis", "List", "Combustivel")%></li>
        <li><%= Html.ActionLink("Marcas", "List", "Concessionaria")%></li>
        <li><%= Html.ActionLink("Tipos ", "List", "TipoVeiculo")%></li>
        <li><%= Html.ActionLink("Modelos", "List", "Veiculo")%></li>

    </ul>
</asp:Content>
