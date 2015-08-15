<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<Abastecimento.Models.VeiculoMotorista>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Equipamento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Equipamento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados do Equipamento
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id_VeiculoMotorista)%>
    <tr>
        <th class = "editor-label">
            <%: Html.Label("Placa") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Placa", null, new { @maxlength = ViewData["MaxLength_Placa"], @style = "text-transform: uppercase;width:100px" })%><br />
            <%: Html.ValidationMessage("Placa", null, new { @class = "input-validation-error" })%>
        </th>
        <th class="editor-label">
            <%: Html.Label("Marca") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Concessionaria", ViewData["Concessionarias"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Concessionaria", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
	<tr>
        <th class="editor-label">
            <%: Html.Label("Modelo")%>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_Veiculo", ViewData["Veiculos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_Veiculo", null, new { @class = "input-validation-error" })%>
        </th>
         <th class="editor-label">
            <%: Html.Label("Tipo") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Id_TipoVeiculo", ViewData["TiposVeiculos"] as SelectList, new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Id_TipoVeiculo", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
	<tr>

        <th class = "editor-label">
            <%: Html.Label("Ano") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("Ano", null, new { @alt = "ano", @style = "width:60px" })%><br />
            <%: Html.ValidationMessage("Ano", null, new { @class = "input-validation-error" })%>
        </th>
        <th class="editor-label">
            <%: Html.Label("Medidor") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Medidor", ViewData["Medidores"] as SelectList, new { @class = "DropDownList",@style = "width:100px" })%><br />
            <%: Html.ValidationMessage("Medidor", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>    
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
    <% using (Html.BeginForm("AddMotorista", ViewData["NomeControler"] as string, FormMethod.Post, new { id = "Form" })) { %>
    <%: Html.Hidden("keys", string.Format("{0}", Model.Id_VeiculoMotorista)) %>
        <fieldset>
            <legend>Motoristas</legend>

            <table>
                <tr style="background: #E0FFFF" >
                    <th><input type="submit" value="Adicionar" id="Adicionar" style="width:70px"  title="Adicionar" /><%: Html.DropDownList("Id_Motorista", ViewData["Motoristas"] as SelectList, new { @class = "DropDownLists" })%></th>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>Cpf</th>
                </tr>

                <% foreach (var item in Model.VeiculoMotoristaMotorista) { %>
                <tr>
                    <td>
                        <a href='<%= Url.Action("RemoveMotorista", ViewData["NomeControler"] as string, new { keys=item.Id_VeiculoMotoristaMotorista, keysPai=Model.Id_VeiculoMotorista, @style = "width:100px"})  %>'>Remover</a>
                    </td>
                    <td>
                        <%: item.Motorista.Nome %>
                    </td>
                    <td>
                        <%: item.Motorista.Sobrenome %>
                    </td>
                    <td>
                        <%: item.Motorista.Cpf %>
                    </td>
                </tr>
                <% } %>
            </table>
        </fieldset>
    <% } %>

    <% using (Html.BeginForm("AddCombustivel", ViewData["NomeControler"] as string, FormMethod.Post, new { id = "Form" })) { %>
    <%: Html.Hidden("keys", string.Format("{0}", Model.Id_VeiculoMotorista)) %>
        <fieldset>
            
            <table>
                <tr style="background: #E0FFFF" >
                    <th><input type="submit" value="Adicionar" id="Submit1" style="width:70px"  title="Adicionar" /><%: Html.DropDownList("Id_Combustivel", ViewData["Combustiveis"] as SelectList, new { @class = "DropDownLists" }) %></th>
                    <th>Combustível</th>                  
                </tr>

                <% foreach (var item in Model.ModeloVeiculoCombustivel) { %>
                <tr>
                    <td>
                        <a href='<%= Url.Action("RemoveCombustivel", ViewData["NomeControler"] as string, new { keys=item.Id_ModeloVeiculoCombustivel, keysPai=Model.Id_VeiculoMotorista, @style = "width:100px"})  %>'>Remover</a>
                    </td>
                    <td>
                        <%: item.Combustivel.Descricao %>
                    </td>
                </tr>
                <% } %>
            </table>
        </fieldset>
    <% } %>
</asp:Content>