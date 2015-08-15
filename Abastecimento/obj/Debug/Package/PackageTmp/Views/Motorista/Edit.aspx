<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.Motorista>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Motorista
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Motorista
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Motorista
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id_Motorista)%>
    <tr>
	    <th class="editor-label">
            <%: Html.Label("Nome") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Nome", null, new { @maxlength = ViewData["MaxLength_Nome"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Nome", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Sobrenome") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Sobrenome", null, new { @maxlength = ViewData["MaxLength_Sobrenome"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Sobrenome", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Telefone 1") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Telefone1", null, new { @alt = "phone" })%><br />
            <%: Html.ValidationMessage("Telefone1", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Telefone 2") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Telefone2", null, new { @alt = "phone" })%><br />
            <%: Html.ValidationMessage("Telefone2", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Cpf") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Cpf", null, new { @alt = "cpf" })%><br />
            <%: Html.ValidationMessage("Cpf", null, new { @class = "input-validation-error" })%>
        </th>

        <th class = "editor-label">
            <%: Html.Label("Observação") %>
        </th>
        <th class="editor-field">
            <%: Html.TextArea("Observacao", null, new { @maxlength = ViewData["MaxLength_Observacao"], @style = "text-transform: uppercase;" })%><br />
            <%: Html.ValidationMessage("Observacao", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="OthersForms" runat="server">
    <% using (Html.BeginForm("AddVeiculo", ViewData["NomeControler"] as string, FormMethod.Post, new { id = "Form" })) { %>
    <%: Html.Hidden("keys", string.Format("{0}", Model.Id_Motorista)) %>
        <fieldset>
            <legend>Veículos</legend>

            <table>
                <tr style="background: #E0FFFF" >
                    <th><input type="submit" value="Adicionar" id="Adicionar" style="width:70px"  title="Adicionar" /><%: Html.DropDownList("Id_VeiculoMotorista", ViewData["VeiculosMotorista"] as SelectList, new { @class = "DropDownLists" })%></th>
                    <th>Número</th>
                    <th>Modelo</th>
                </tr>

                <% foreach (var item in Model.VeiculoMotoristaMotorista) { %>
                <tr>
                    <td>
                        <a href='<%= Url.Action("RemoveVeiculo", ViewData["NomeControler"] as string, new { keys=item.Id_VeiculoMotoristaMotorista, keysPai=Model.Id_Motorista, @style = "width:100px"})  %>'>Remover</a>
                    </td>
                    <td>
                        <%: item.VeiculoMotorista.Placa %>
                    </td>
                    <td>
                        <%: item.VeiculoMotorista.Veiculo.Descricao %>
                    </td>
                </tr>
                <% } %>
            </table>
        </fieldset>
    <% } %>
</asp:Content>