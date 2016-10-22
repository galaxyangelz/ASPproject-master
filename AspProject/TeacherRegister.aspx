<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherRegister.aspx.cs" Inherits="AspProject.TeacherRegister1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>New teacher</h1>
    <div>
    <asp:Label runat="server" ID="ErrorLabel" ForeColor="IndianRed"></asp:Label><br />
    <asp:Label runat="server" Text="Username"></asp:Label>
        <asp:TextBox runat="server" ID="UsernameReg"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UsernameReg" ErrorMessage="Username must not be empty" Display="Dynamic" ID="UsernameRegVal"></asp:RequiredFieldValidator><br />
   <asp:Label runat="server" Text="Password"></asp:Label>
        <asp:TextBox runat="server" ID="PasswordReg" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="PasswordReg" ErrorMessage="Password must not be empty" Display="Dynamic" ID="PasswordRegVal" ></asp:RequiredFieldValidator><br />
   <asp:Label runat="server" Text="Repeat Password"></asp:Label>
        <asp:TextBox runat="server" ID="RePasswordReg" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="RePasswordReg" ErrorMessage="Fill must not be empty" Display="Dynamic" ID="RePasswordRegVal"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ControlToCompare="PasswordReg" ControlToValidate="RePasswordReg" ErrorMessage="Password does not match"></asp:CompareValidator><br />
   <asp:Label runat="server" Text="Email"></asp:Label>
         <asp:TextBox runat="server" ID="EmailReg"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailReg" ErrorMessage="Email must not be empty" Display="Dynamic" ID="EmailRegVal"></asp:RequiredFieldValidator><br />  
    <asp:Label runat="server" Text="First Name"></asp:Label>
        <asp:TextBox runat="server" ID="FnameReg"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="FnameReg" ErrorMessage="First Name must not be empty" Display="Dynamic" ID="FnameRegVal"></asp:RequiredFieldValidator><br />
    <asp:Label runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox runat="server" ID="LnameReg"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="LnameReg" ErrorMessage="Last Name must not be empty" Display="Dynamic" ID="LnameRegVal"></asp:RequiredFieldValidator><br />
   
    </div>
    <br />
    <asp:Button runat="server" Text="Create" ID="Create" OnClick="Create_Click"/><br />
    <asp:Hyperlink runat="server" Text="Back" NavigateUrl="~/TeacherLogin.aspx"></asp:Hyperlink>   

    </div>
    </form>
</body>
</html>
