<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.EmailConfigs>" %>
<%@ Import Namespace="IntuitiveFramework.Models" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Configuração de Emails
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Configuração de Emails
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados das Configurações de Emails
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id) %>
	<tr>
        <th class = "editor-label">
            <%: Html.Label("Endereço Smtp") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("SmtpHost", Model.SmtpHost, new { @maxlength = ViewData["MaxLength_SmtpHost"] })%><br />
            <%: Html.ValidationMessage("SmtpHost", null, new { @class = "input-validation-error" })%>
        </th>

        <th class = "editor-label">
            <%: Html.Label("Endereço POP3") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Pop3Host", Model.Pop3Host, new { @maxlength = ViewData["MaxLength_SmtpHost"] })%><br />
            <%: Html.ValidationMessage("Pop3Host", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Porta") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Porta", Model.Porta, new { @alt = "int" })%><br />
            <%: Html.ValidationMessage("Porta", null, new { @class = "input-validation-error" })%>
        </th>
        
        <th class = "editor-label">
            <%: Html.Label("Usa SSL?") %>
        </th>
        <th class="editor-field">
            <%: Html.CheckBox("UsaSsl", Model.UsaSsl)%><br />
            <%: Html.ValidationMessage("UsaSsl", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Usa Autenticação Pop?") %>
        </th>
        <th class="editor-field">
            <%: Html.CheckBox("UsaAutenticacaoPop", Model.UsaAutenticacaoPop)%><br />
            <%: Html.ValidationMessage("UsaAutenticacaoPop", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="OthersForms" runat="server">
    <% using (Html.BeginForm("AdicionarDadosEmails", "EmailConfigs", FormMethod.Post, new { id = "Form" })) {%>
    <%: Html.ValidationSummary(true)%>
    <%: Html.Hidden("keys", Model.Id)%>
    <fieldset>
        <legend>Configurações E-mail</legend>
        <table>
            <tr>
                <th class="editor-label">
                    <%: Html.Label("Login") %>
                </th>
                <th class="editor-field">
                    <%: Html.TextBox("Login", null, new { @maxlength = ViewData["MaxLength_Login"] })%><br />
                    <%: Html.ValidationMessage("UsaSsl", null, new { @class = "input-validation-error" })%>
                </th>

                <th class="editor-label">
                    <%: Html.Label("Password") %>
                </th>
                <th class="editor-field">
                    <%: Html.Password("Password", null, new { @maxlength = ViewData["MaxLength_Login"] })%><br />
                    <%: Html.ValidationMessage("Password", null, new { @class = "input-validation-error" })%>
                </th>
            </tr>
            <tr>
                <th class="editor-label">
                    <%: Html.Label("Tipo") %>
                </th>
                <th class="editor-field">
                    <%: Html.DropDownList("Tipo", ViewData["TiposEmails"] as SelectList, "Selecione um Tipo!", new { @class = "dropdownlist" })%><br />
                    <%: Html.ValidationMessage("Tipo", null, new { @class = "input-validation-error" })%>
                </th>
            </tr>
        </table>

        <table class="tabelaComum">
            <tr>
                <th>
                    <input type="submit" value="Adicionar" />
                </th>
                <th>
                    Login
                </th>
                <th>
                    Tipo
                </th>
            </tr>
            <% foreach (var item in Model.DadosEmails) { %>
            <tr>
                <td>
                    <%: Html.ActionLink("Excluir", "ExcluirDadosEmails", new { keysFilho = item.Id, keysPai = Model.Id })%>
                </td>
                <td>
                    <%: item.Login %>
                </td>
                <td>
                    <%: CustomFunctions.getDescricaoEnumPorId<EnumsIntuitive.TipoEmail>(item.Tipo) %>
                </td>                
            </tr>
            <% } %>
        </table>

    </fieldset>
    <% } %>
</asp:Content>