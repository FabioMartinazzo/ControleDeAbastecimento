<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Delete.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Usuarios>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Usuários
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Excluir Usuário
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ConfirmTitle" runat="server">
	<b style="color:Red">Tem certeza que deseja excluir este usuário?</b>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Usuário
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="MainTable" runat="server">
	<tr>        
        <th class="display-label">Login</th>
        <th class="display-field"><%: Model.Login %></th>

        <th class="display-label">Nome</th>
        <th class="display-field"><%: Model.Nome %></th>
    </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ActionDelete" runat="server">
    <script type="text/javascript" >
        deleteButton('<%: Url.Action("Delete", "Usuario", new { keys = Model.Id, certeza = true }) %>'); 
    </script>
</asp:Content>