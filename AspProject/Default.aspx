<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspProject.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Hyperlink runat="server" Text="Student" NavigateUrl="~/StudentLogin.aspx"></asp:Hyperlink>
        <asp:Hyperlink runat="server" Text="Teacher" NavigateUrl="~/TeacherLogin.aspx"></asp:Hyperlink>
        <asp:Hyperlink runat="server" Text="About Us" NavigateUrl="~/Khuong.aspx"></asp:Hyperlink>
    </div>
    </form>
</body>
</html>
