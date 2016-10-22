<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="AspProject.TeacherDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"  />
        <br />
    
        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
    
        <br />
        Your created couses<br />
        <asp:GridView ID="grdCourse" runat="server" DataSourceID="CourseSqlDataSource" OnRowCommand="grdCourse_RowCommand" OnRowCreated="grdCourse_RowCreated">
            <Columns>
                <asp:ButtonField CommandName="delete" Text="Delete" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CourseSqlDataSource" runat="server"
ConnectionString="<%$ ConnectionStrings:ASP %>"
SelectCommand="select * from [Course] WHERE teacher_id = @teacherId" DeleteCommand="DELETE FROM [Course] WHERE id= @id">
            <SelectParameters>
    <asp:Parameter Name="teacherId"  />
  </SelectParameters>
            <DeleteParameters>
                   

            </DeleteParameters>
            </asp:SqlDataSource>
    
        <br />
        <asp:Button ID="btnCreateCourse" runat="server" Text="Create Course" OnClick="btnCreateCourse_Click" />
    
    </div>
    </form>
</body>
</html>
