<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div>
        <div align="left">
            <h1>Controle de Abastecimento</h1>
        </div>
	</div>
    
    <div style="text-align:center">

        <% if (Session["Login"] == null) { %>
            <div style="text-align:center">
                <%  using (Html.BeginForm("Login", "Home", FormMethod.Post, new { id = "Form" })) {%>
                <%: Html.ValidationSummary(true) %>
                    <table align="center" class="tabelaComum">
                        <tr>
                            <th>
                                <%: Html.Label("Login")%>
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.TextBox("Login")%>                    
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <%: Html.Label("Senha")%>
                            </th>
                        <tr>
                        </tr>
                            <td>
                                <%: Html.Password("Senha")%>
                            </td>                    
                        </tr>    
                        <tr>
                            <td align="right">
                                <input type="submit" value="Log In" />
                                <span style="color:Red"><%: ViewData["FalhaLogin"]%></span>
                            </td>
                        </tr>
                    </table>
                <% } %>
            </div>
        <% } else { %>
            <img alt="ControleAbastecimento" src='<%= Url.Action("getLogo", "Home") %>' />
        <% } %>

    </div>
</asp:Content>
