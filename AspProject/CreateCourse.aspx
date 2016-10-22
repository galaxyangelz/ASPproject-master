<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCourse.aspx.cs" Inherits="AspProject.CreateCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>New course</h1>
    <div>
    <asp:Label runat="server" ID="ErrorLabel" ForeColor="IndianRed"></asp:Label><br />
    <asp:Label runat="server" Text="Course name"></asp:Label>
        <asp:TextBox runat="server" ID="txtCourseName"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourseName" ErrorMessage="Coursename can not be duplicate" Display="Dynamic" ID="txtCourseNameVal"></asp:RequiredFieldValidator><br />
   
    </div>
    <br />
    <asp:Button runat="server" Text="Create" ID="Create" OnClick="Create_Click"/><br />
    <asp:Hyperlink runat="server" Text="Back" NavigateUrl="~/TeacherDashboard.aspx"></asp:Hyperlink>   

    </div>
    </form>
</body>
</html>
