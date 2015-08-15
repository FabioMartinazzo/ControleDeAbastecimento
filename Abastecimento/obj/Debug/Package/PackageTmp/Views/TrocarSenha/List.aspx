<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CommomList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Mudar a Senha
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
	Mudar a Senha
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainTable" runat="server">
    <tr>
        <th>
            <%: Html.Label("Digite sua Senha Atual: ") %>
        </th>
        <th>
            <%: Html.Password("SenhaAntiga") %>
            <%: Html.ValidationMessage("SenhaAntiga", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th>
            <%: Html.Label("Digite sua Nova Senha: ") %>
        </th>
        <th>
            <%: Html.Password("SenhaNova")%>
            <%: Html.ValidationMessage("SenhaNova", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th>
            <%: Html.Label("Digite novamente sua Nova Senha: ")%>
        </th>
        <th>
            <%: Html.Password("SenhaNovaRepetida")%>
            <%: Html.ValidationMessage("SenhaNovaRepetida", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th colspan=2 style="text-align:right">
            <input type="submit" value="Mudar" />
        </th>
    </tr>
</asp:Content>