<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="AspProject.StudentLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
    <div>
    <h1>STUDENT LOG IN</h1>
    <asp:Label runat="server" ForeColor="IndianRed" ID="ErrorLabel"></asp:Label><br />
    <asp:Label runat="server" Text="Username"></asp:Label><asp:TextBox runat="server" ID="Username"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Username" ErrorMessage="Username must not be empty"></asp:RequiredFieldValidator><br />
    <asp:Label runat="server" Text="Password"></asp:Label><asp:TextBox runat="server" ID="Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password must not be empty"></asp:RequiredFieldValidator><br />
    <asp:Button runat="server" Text="Log in" ID="Log" OnClick="Log_Click" /><br />
    <asp:Hyperlink runat="server" Text="Register" NavigateUrl="~/StudentRegister.aspx"></asp:Hyperlink>
    <asp:Hyperlink runat="server" Text="Home" NavigateUrl="~/Default.aspx"></asp:Hyperlink>
    </div>
    </form>
</body>
</html>
