<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FormValidationStockage.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 121px;
        }
        .auto-style3 {
            width: 121px;
            height: 26px;
            text-align: left;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            text-align: justify;
        }
        .auto-style6 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
               <label> FORM VALIDATION </label>
                 <asp:HiddenField ID="hfContactID" runat="server" />
                   <table class="auto-style1">
                       <tr>
                           <td class="auto-style3">Nom</td>
                           <td class="auto-style4">
                               <asp:TextBox ID="txtNom" runat="server" Width="200px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNom" ErrorMessage="*Nom Obligatoire" ForeColor="Red" EnableTheming="True"></asp:RequiredFieldValidator>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style2">Email</td>
                           <td>
                               <asp:TextBox ID="txtEmail" runat="server" Width="199px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Prenom Obligatoire" ForeColor="Red"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator  display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Invalide" ForeColor="#6600CC" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style2">Date de naissance</td>
                           <td class="auto-style5">
                               <asp:TextBox ID="txtDate" runat="server" Width="198px"></asp:TextBox>
                               <asp:Button ID="Button1"  CausesValidation="false" runat="server" OnClick="Button1_Click" Text="Selectionner une Date" Width="147px" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate" ErrorMessage="*Date Obligatoire" ForeColor="Red"></asp:RequiredFieldValidator>
                               <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                           </td>
                       </tr>
                        <tr>
                            <td>
                    
                                Fichier(pdf)</td>
                             <td>
                               <asp:FileUpload ID="FileUpload1" runat="server" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*Veuillez choisir un pdf" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                       <tr>
                             <td>
                             </td>
                             <td>
                               <asp:Button ID="btn" runat="server" CssClass="auto-style6"  style="height: 26px" Text="Save" Width="91px" OnClick="btnSave_Click" />
                             </td>
                       </tr>
                       <tr>
                            <td>&nbsp;</td>
                             <td>
                                <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                             </td>
                       </tr>
                       <tr>
                            <td> &nbsp;</td>
                            <td>
                                 <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                       </tr>
                </table>
               
        </div>
            <hr />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Nom" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                     <asp:BoundField DataField="DateNaissance" HeaderText="Date de Naissance" />
                    <asp:BoundField DataField="NomFichier" HeaderText="File Name" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton CausesValidation="false" ID="lnkView" runat="server" Text="View" OnClick="View" CommandArgument='<%# Eval("ContactID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <hr />
            <div>
                <asp:Literal ID="ltEmbed" runat="server" />
            </div>


    </form>
</body>
</html>
