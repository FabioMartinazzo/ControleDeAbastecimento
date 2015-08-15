<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Impressao.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Abastecimento por Período
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
    Abastecimento por Período
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainTable" runat="server">
    
    <tr class="table-row-1">
        <th class="editor-label">
            <%: Html.Label("Tipo:") %>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Tipo", ViewData["Tipos"] as SelectList, "Todos!", new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Tipo", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Marca:")%>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Marca", ViewData["Marcas"] as SelectList, "Todos!", new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Marca", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>

    <tr>
        <th class="editor-label">
            <%: Html.Label("Modelo:")%>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Modelo", ViewData["Modelos"] as SelectList, "Todos!", new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Modelo", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Equipamento:")%>
        </th>
        <th class="editor-field">
            <%: Html.DropDownList("Equipamento", ViewData["Equipamentos"] as SelectList, "Todos!", new { @class = "DropDownList" })%><br />
            <%: Html.ValidationMessage("Equipamento", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>

    <tr>
        <th class="editor-label">
            <%: Html.Label("Data Inicial:") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("DataInicial", string.Format("{0:dd/MM/yyyy}", DateTime.Now), new { @class= "campoData", @style = "width:100px" } )%><br />
            <%: Html.ValidationMessage("DataInicial", null, new { @class = "input-validation-error" })%>
        </th>

        <th class="editor-label">
            <%: Html.Label("Data Final:") %>
        </th>
        <th class="editor-field">
            <%: Html.TextBox("DataFinal", string.Format("{0:dd/MM/yyyy}", DateTime.Now), new { @class = "campoData", @style = "width:100px" })%><br />
            <%: Html.ValidationMessage("DataFinal", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
        
</asp:Content>