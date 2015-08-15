<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CreateEdit.master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Estabelecimentos>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Estabelecimentos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="H2Title" runat="server">
    Estabelecimentos
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LegendTitle" runat="server">
    Dados Estabelecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainTable" runat="server">
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Razão Social") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("RazaoSocial", null, new { @maxlength = ViewData["MaxLength_RazaoSocial"] }) %> <br/>
            <%: Html.ValidationMessage("RazaoSocial", null, new { @class = "input-validation-error" })%>
        </td>
            
        <th class="editor-label">
            <%: Html.Label("Nome Fantasia") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("NomeFantasia", null, new { @maxlength = ViewData["MaxLength_NomeFantasia"] })%><br/>
            <%: Html.ValidationMessage("NomeFantasia", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
            
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("CNPJ") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("CNPJ", null, new { @class = "campoCNPJ" })%><br/>
            <%: Html.ValidationMessage("CNPJ", null, new { @class = "input-validation-error" })%>
        </td>
          
        <th class="editor-label">
            <%: Html.Label("Inscrição Estadual") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("InscricaoEstadual", null, new { @maxlength = ViewData["MaxLength_InscricaoEstadual"] })%><br/>
            <%: Html.ValidationMessage("InscricaoEstadual", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Inscrição Municipal") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("InscricaoMunicipal", null, new { @maxlength = ViewData["MaxLength_InscricaoMunicipal"] })%><br/>
            <%: Html.ValidationMessage("InscricaoMunicipal", null, new { @class = "input-validation-error" })%>
        </td>            
                     
        <th class="editor-label">
            <%: Html.Label("Logradouro") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Logradouro", null, new { @maxlength = ViewData["MaxLength_Logradouro"] })%><br/>
            <%: Html.ValidationMessage("Logradouro", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Endereço") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Endereco", null, new { @maxlength = ViewData["MaxLength_Endereco"] })%><br/>
            <%: Html.ValidationMessage("Endereco", null, new { @class = "input-validation-error" })%>
        </td>            
        
        <th class="editor-label">
            <%: Html.Label("Número") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Numero", null, new { @class = "int" })%><br/>
            <%: Html.ValidationMessage("Numero", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>

    <tr align="left">                      
        <th class="editor-label">
            <%: Html.Label("Bairro") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Bairro", null, new { @maxlength = ViewData["MaxLength_Bairro"] })%><br/>
            <%: Html.ValidationMessage("Bairro", null, new { @class = "input-validation-error" })%>
        </td>
                     
        <th class="editor-label">
            <%: Html.Label("Cidade") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Cidade", null, new { @maxlength = ViewData["MaxLength_Cidade"] })%><br/>
            <%: Html.ValidationMessage("Cidade", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">          
        <th class="editor-label">
            <%: Html.Label("Estado") %>
        </th>
        <td class="editor-field">
            <%= Html.TextBox("Estado", null)%><br />
            <%: Html.ValidationMessage("Estado", null, new { @class = "input-validation-error" })%>
        </td>

        <th class="editor-label">
            <%: Html.Label("CEP") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("CEP", null, new { @class = "campoCEP" })%><br/>
            <%: Html.ValidationMessage("CEP", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
         
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Telefone") %>
        </th>                    
        <td class="editor-field">
            <%: Html.TextBox("Fone", null, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Fone", null, new { @class = "input-validation-error" })%>
        </td> 
        
        <th class="editor-label">
            <%: Html.Label("Fax") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Fax", null, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Fax", null, new { @class = "input-validation-error" })%>
        </td>                    
    </tr>            
           
    <tr align="left">      
        <th class="editor-label">
            <%: Html.Label("Celular") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Celular", null, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Celular", null, new { @class = "input-validation-error" })%>
        </td> 
        
        <th class="editor-label">
            <%: Html.Label("E-mail") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Email", null, new { @maxlength = ViewData["MaxLength_Email"] })%><br/>
            <%: Html.ValidationMessage("Email", null, new { @class = "input-validation-error" })%>
        </td>           
    </tr>    

    <tr>
        <th class="editor-label">
            <%: Html.Label("Connection Alias") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("AliasConnection", null, new { @maxlength = ViewData["MaxLength_AliasConnection"] })%><br/>
            <%: Html.ValidationMessage("AliasConnection", null, new { @class = "input-validation-error" })%>
        </td>

        <th class="editor-label">
            <%: Html.Label("Arquivo Logo Pequeno")%>
        </th>
        <th class="editor-field">                    
            <input type="file" id="LogoTop" name="LogoTop" />
            <%: Html.ValidationMessage("LogoTop", null, new { @class = "input-validation-error" })%>
        </th>
    </tr>
    <tr>
        <th class="editor-label">
            <%: Html.Label("Arquivo Logo Grande")%>
        </th>
        <th class="editor-field">                    
            <input type="file" id="Logo" name="Logo" />
            <%: Html.ValidationMessage("Logo", null, new { @class = "input-validation-error" })%>
        </th>

        <%--<th class="editor-label">
            <%: Html.Label("Código Município") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("CodMunicipio", Model.CodMunicipio, new { @alt = "int" })%><br/>
            <%: Html.ValidationMessage("CodMunicipio", null, new { @class = "input-validation-error" })%>
        </td>--%>
    </tr>
</asp:Content>