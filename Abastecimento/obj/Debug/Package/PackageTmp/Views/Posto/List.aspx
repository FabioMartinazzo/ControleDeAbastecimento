﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/List.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Abastecimento.Models.Posto>>" %>
<%@ Import Namespace="Abastecimento.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Posto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Posto
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SearchName" runat="server">
    Pesquisar Posto
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ColumnsTitle" runat="server" >
    <th>
        Descrição
    </th>
    <th>
        Observação
    </th>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ColumnsData" runat="server" >
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { keys = item.Id_Posto })%> 
                <%: Html.ActionLink("Detalhes", "Details", new { keys = item.Id_Posto })%> 
                <%: Html.ActionLink("Excluir", "Delete", new { keys = item.Id_Posto, certeza = false })%>
            </td>
            <td>
                <%: item.Descricao %>
            </td>
            <td>
                <%: GlobalBusinessApplications.getLargeString(item.Observacao) %>
            </td>
        </tr>
    <% } %>
</asp:Content>