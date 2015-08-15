<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Details.Master" Inherits="System.Web.Mvc.ViewPage<IntuitiveFramework.Models.Estabelecimentos>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
	Estabelecimento
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="H2Title" runat="server">
	Detalhes Estabelecimento
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LegendTitle" runat="server">
	Dados Estabelecimento
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainTable" runat="server">
	<tr>  
        <th class="display-label">Razão Social</th>
        <td class="display-field"><%: Model.RazaoSocial %></td>
                         
        <th class="display-label">Nome Fantasia</th>
        <td class="display-field"><%: Model.NomeFantasia %></td>
    </tr>
    <tr>        
        <th class="display-label">CNPJ</th>
        <td class="display-field"><%: Model.CNPJ %></td>
        
        <th class="display-label">Inscrição Estadual</th>
        <td class="display-field"><%: Model.InscricaoEstadual %></td>
    </tr>
    <tr>
        <th class="display-label">Inscrição Municipal</th>
        <td class="display-field"><%: Model.InscricaoMunicipal %></td>
        
        <th class="display-label">Logradouro</th>
        <td class="display-field"><%: Model.Logradouro %></td>
    </tr>
    <tr>
        <th class="display-label">Endereço</th>
        <td class="display-field"><%: Model.Endereco %></td>
        
        <th class="display-label">Bairro</th>
        <td class="display-field"><%: Model.Bairro %></td>
    </tr>
    <tr>
        <th class="display-label">Cidade</th>
        <td class="display-field"><%: Model.Cidade %></td>
        
        <th class="display-label">Estado</th>
        <td class="display-field"><%: Model.Estado %></td>
    </tr>
    <tr>        
        <th class="display-label">CEP</th>
        <td class="display-field"><%: Model.CEP %></td>
        
        <th class="display-label">Telefone</th>
        <td class="display-field"><%: Model.Fone %></td>
    </tr>
    <tr>         
        <th class="display-label">Fax</th>
        <td class="display-field"><%: Model.Fax%></td>

        <th class="display-label">Celular</th>
        <td class="display-field"><%: Model.Celular%></td>
    </tr>
    <tr>         
        <th class="display-label">E-mail</th>
        <td class="display-field"><%: Model.Email %></td>

        <th class="display-label">Connection Alias</th>
        <td class="display-field"><%: Model.AliasConnection %></td>
    </tr>
    <tr>
        <th class="display-label">Código do Município</th>
        <td class="display-field"><%: Model.CodMunicipio %></td>
    </tr>
</asp:Content>