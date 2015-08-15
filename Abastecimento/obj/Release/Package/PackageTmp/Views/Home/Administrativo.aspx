<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Administrativo
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Cadastros Administrativos</h2>
    <br />
    <ul>
        <li><%= Html.ActionLink("Cadastro de Usuários", "List", "Usuario")%></li>
        <li><%= Html.ActionLink("Cadastro de Grupos", "List", "Grupo")%></li>
        <li><%= Html.ActionLink("Cadastro de Estabelecimentos", "List", "Estabelecimentos")%></li>
    </ul>

</asp:Content>
