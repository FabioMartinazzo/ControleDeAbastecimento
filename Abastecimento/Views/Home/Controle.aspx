<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Controle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Controle</h1>
    <br />
    <ul>
        <li><%= Html.ActionLink("Abastecimentos", "List", "AbastecimentoPosto")%></li>
    </ul>
</asp:Content>
