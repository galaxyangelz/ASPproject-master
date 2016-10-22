<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="AspProject.StudentDashboard" %>

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
        Avaiable couses<br />
        <asp:GridView ID="grdCourse" runat="server" DataSourceID="CourseSqlDataSource" AutoGenerateColumns="False" DataKeyNames="id,teacher_id" OnRowCommand="grdCourse_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="teacher_id" HeaderText="teacher_id" SortExpression="teacher_id" Visible="False" />
                <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" Visible="False" />
                <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" Visible="False" />
                <asp:TemplateField HeaderText="Teacher">
                    <ItemTemplate>
<%# Eval("firstname") + " " + Eval("lastname")%></ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField HeaderText="" Text="Enroll" CommandName="enroll"/>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CourseSqlDataSource" runat="server"
ConnectionString="<%$ ConnectionStrings:ASP %>"
SelectCommand="SELECT Course.id, Course.name, Course.teacher_id, Teacher.firstname, Teacher.lastname 
FROM Course INNER JOIN Teacher ON Course.teacher_id = Teacher.id
WHERE Course.id NOT IN (Select course_id FROM Enroll WHERE student_id = @studentId)" ProviderName="System.Data.SqlClient">
          <SelectParameters>
    <asp:Parameter Name="studentId"  />
  </SelectParameters>
            </asp:SqlDataSource>
    
        Your enrolled courses<br />
        <asp:GridView ID="grdEnrolled" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EnrolledDataSource" OnRowCommand="grdEnrolled_RowCommand">
            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />

                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                 <asp:TemplateField HeaderText="Teacher">
                    <ItemTemplate>
                        <%# Eval("firstname") + " " + Eval("lastname")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="teacher_id" HeaderText="teacher_id" SortExpression="teacher_id" Visible="False" />
                <asp:ButtonField CommandName="unenroll" Text="Unenroll" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="EnrolledDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A11DD5_aspprojectConnectionString %>" SelectCommand="SELECT Course.id, Course.name, Course.teacher_id, Teacher.firstname, Teacher.lastname 
FROM Course INNER JOIN Teacher ON Course.teacher_id = Teacher.id
WHERE Course.id IN (Select course_id FROM Enroll WHERE student_id = @studentId)">
            <SelectParameters>
                <asp:Parameter Name="studentId" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
    </form>
</body>
</html>
