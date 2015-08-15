<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitleContent" runat="server">
    Erro
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Erro</h2>
    <div class="input-validation-error">
        <%= ViewData["Erro"] %>
    </div>
</asp:Content>
