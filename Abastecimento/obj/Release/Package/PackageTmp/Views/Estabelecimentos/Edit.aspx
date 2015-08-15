<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EditMultiTables.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Estabelecimentos>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Estabelecimentos
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Editar Estabelecimento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados Estabelecimento
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
    <%: Html.Hidden("keys", Model.Id) %>
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Razão Social") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("RazaoSocial", Model.RazaoSocial, new { @maxlength = ViewData["MaxLength_RazaoSocial"] }) %> <br/>
            <%: Html.ValidationMessage("RazaoSocial", null, new { @class = "input-validation-error" })%>
        </td>
            
        <th class="editor-label">
            <%: Html.Label("Nome Fantasia") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("NomeFantasia", Model.NomeFantasia, new { @maxlength = ViewData["MaxLength_NomeFantasia"] })%><br/>
            <%: Html.ValidationMessage("NomeFantasia", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
            
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("CNPJ") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("CNPJ", Model.CNPJ, new { @class = "campoCNPJ" })%><br/>
            <%: Html.ValidationMessage("CNPJ", null, new { @class = "input-validation-error" })%>
        </td>
          
        <th class="editor-label">
            <%: Html.Label("Inscrição Estadual") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("InscricaoEstadual", Model.InscricaoEstadual, new { @maxlength = ViewData["MaxLength_InscricaoEstadual"] })%><br/>
            <%: Html.ValidationMessage("InscricaoEstadual", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Inscrição Municipal") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("InscricaoMunicipal", Model.InscricaoMunicipal, new { @maxlength = ViewData["MaxLength_InscricaoMunicipal"] })%><br/>
            <%: Html.ValidationMessage("InscricaoMunicipal", null, new { @class = "input-validation-error" })%>
        </td>            
                     
        <th class="editor-label">
            <%: Html.Label("Logradouro") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Logradouro", Model.Logradouro, new { @maxlength = ViewData["MaxLength_Logradouro"] })%><br/>
            <%: Html.ValidationMessage("Logradouro", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Endereço") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Endereco", Model.Endereco, new { @maxlength = ViewData["MaxLength_Endereco"] })%><br/>
            <%: Html.ValidationMessage("Endereco", null, new { @class = "input-validation-error" })%>
        </td>            
        
        <th class="editor-label">
            <%: Html.Label("Número") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Numero", Model.Numero, new { @class = "int" })%><br/>
            <%: Html.ValidationMessage("Numero", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>

    <tr align="left">                      
        <th class="editor-label">
            <%: Html.Label("Bairro") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Bairro", Model.Bairro, new { @maxlength = ViewData["MaxLength_Bairro"] })%><br/>
            <%: Html.ValidationMessage("Bairro", null, new { @class = "input-validation-error" })%>
        </td>
                     
        <th class="editor-label">
            <%: Html.Label("Cidade") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Cidade", Model.Cidade, new { @maxlength = ViewData["MaxLength_Cidade"] })%><br/>
            <%: Html.ValidationMessage("Cidade", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
          
    <tr align="left">          
        <th class="editor-label">
            <%: Html.Label("Estado") %>
        </th>
        <td class="editor-field">
            <%= Html.TextBox("Estado", Model.Estado)%><br />
            <%: Html.ValidationMessage("Estado", null, new { @class = "input-validation-error" })%>
        </td>

        <th class="editor-label">
            <%: Html.Label("CEP") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("CEP", Model.CEP, new { @class = "campoCEP" })%><br/>
            <%: Html.ValidationMessage("CEP", null, new { @class = "input-validation-error" })%>
        </td>
    </tr>
         
    <tr align="left">
        <th class="editor-label">
            <%: Html.Label("Telefone") %>
        </th>                    
        <td class="editor-field">
            <%: Html.TextBox("Fone", Model.Fone, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Fone", null, new { @class = "input-validation-error" })%>
        </td> 
        
        <th class="editor-label">
            <%: Html.Label("Fax") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Fax", Model.Fax, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Fax", null, new { @class = "input-validation-error" })%>
        </td>                    
    </tr>            
           
    <tr align="left">      
        <th class="editor-label">
            <%: Html.Label("Celular") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Celular", Model.Celular, new { @class = "campoFone" })%><br/>
            <%: Html.ValidationMessage("Celular", null, new { @class = "input-validation-error" })%>
        </td> 
        
        <th class="editor-label">
            <%: Html.Label("E-mail") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("Email", Model.Email, new { @maxlength = ViewData["MaxLength_Email"] })%><br/>
            <%: Html.ValidationMessage("Email", null, new { @class = "input-validation-error" })%>
        </td>           
    </tr>    

    <tr>
        <th class="editor-label">
            <%: Html.Label("Connection Alias") %>
        </th>
        <td class="editor-field">
            <%: Html.TextBox("AliasConnection", Model.AliasConnection, new { @maxlength = ViewData["MaxLength_AliasConnection"] })%><br/>
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

<asp:Content ID="Content9" ContentPlaceHolderID="OthersForms" runat="server">
    <% using (Html.BeginForm("AdicionarEmailConfig", "Estabelecimentos", FormMethod.Post, new { id = "Form" })) {%>
    <%: Html.ValidationSummary(true)%>
    <%: Html.Hidden("keys", Model.Id)%>
    <fieldset>
        <legend>Configurações E-mail</legend>
        <table>
            <tr>
                <th class="editor-label">
                    <%: Html.Label("Endereço do Smtp") %>
                </th>
                <th class="editor-field">
                    <%: Html.TextBox("SmtpHost")%><br />
                    <%: Html.ValidationMessage("SmtpHost", null, new { @class = "input-validation-error" })%>
                </th>

                <th class="editor-label">
                    <%: Html.Label("Endereço do Pop3") %>
                </th>
                <th class="editor-field">
                    <%: Html.TextBox("Pop3Host")%><br />
                    <%: Html.ValidationMessage("Pop3Host", null, new { @class = "input-validation-error" })%>
                </th>

                <th class="editor-label">
                    <%: Html.Label("Porta") %>
                </th>
                <th class="editor-field">
                    <%: Html.TextBox("Porta")%><br />
                    <%: Html.ValidationMessage("Porta", null, new { @class = "input-validation-error" })%>
                </th>
            </tr>
            <tr>
                <th class="editor-label">
                    <%: Html.Label("Usa SSL?") %>
                </th>
                <th class="editor-field">
                    <%: Html.CheckBox("UsaSsl")%><br />
                    <%: Html.ValidationMessage("UsaSsl", null, new { @class = "input-validation-error" })%>
                </th>

                <th class="editor-label">
                    <%: Html.Label("Usa Autenticação Pop?") %>
                </th>
                <th class="editor-field">
                    <%: Html.CheckBox("UsaAutenticacaoPop")%><br />
                    <%: Html.ValidationMessage("UsaAutenticacaoPop", null, new { @class = "input-validation-error" })%>
                </th>
            </tr>
        </table>

        <table class="tabelaComum">
            <tr>
                <th>
                    <input type="submit" value="Adicionar" />
                </th>
                <th>
                    Endereço Smtp
                </th>
                <th>
                    Endereço Pop3
                </th>
                <th>
                    Porta
                </th>
                <th>
                    Usa SSL?
                </th>
                <th>
                    Usa Autenticação Pop?
                </th>
            </tr>
            <% foreach (var item in Model.EmailConfigs) { %>
            <tr>
                <td>
                    <%: Html.ActionLink("Excluir", "ExcluirEmailConfig", new { keysFilho = item.Id, keysPai = Model.Id })%>|
                    <%: Html.ActionLink("Editar", "Edit", "EmailConfigs", null, null, null, new { keys = item.Id }, null) %>
                </td>
                <td>
                    <%: item.SmtpHost %>
                </td>
                <td>
                    <%: item.Pop3Host %>
                </td>
                <td>
                    <%: item.Porta == null ? "Padrão" : item.Porta.Value.ToString() %>
                </td>
                <td>
                    <%: item.UsaSsl ? "Sim" : "Não" %>
                </td>
                <td>
                    <%: item.UsaAutenticacaoPop ? "Sim" : "Não"%>
                </td>
            </tr>
            <% } %>
        </table>

    </fieldset>
    <% } %>
</asp:Content>