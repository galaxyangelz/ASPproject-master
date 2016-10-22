using AspProject.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspProject
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        Student student = null;
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ASP"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] == null || (string)Session["role"] != "student")
            {
                Response.Redirect("StudentLogin.aspx");
            }


            student = (Student)Session["student"];
            lblTitle.Text = "Student dashboard";
            lblName.Text = student.firstname + " " + student.lastname;

            CourseSqlDataSource.SelectParameters["studentId"].DefaultValue = student.id.ToString();
            grdCourse.DataBind();

            EnrolledDataSource.SelectParameters["studentId"].DefaultValue = student.id.ToString();
            grdEnrolled.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["student"] = null;
            Session["role"] = "";
            Response.Redirect("StudentLogin.aspx");
        }

        protected void grdCourse_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "enroll")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = grdCourse.Rows[index];
                var key = grdCourse.DataKeys[index];
                var course_id = key.Values[0];

                con.Open();
                cmd = new SqlCommand("INSERT INTO [Enroll](student_id,course_id) VALUES(@studentId,@courseId);", con);
                cmd.Parameters.AddWithValue("@studentId", student.id);
                cmd.Parameters.AddWithValue("@courseId", course_id);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("StudentDashboard.aspx");
            }
        }

        protected void grdEnrolled_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "unenroll")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = grdEnrolled.Rows[index];
                var key = grdEnrolled.DataKeys[index];
                var course_id = key.Values[0];

                con.Open();
                cmd = new SqlCommand("DELETE FROM [Enroll] WHERE student_id = @studentId AND course_id = @courseId", con);
                cmd.Parameters.AddWithValue("@studentId", student.id);
                cmd.Parameters.AddWithValue("@courseId", course_id);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("StudentDashboard.aspx");
            }
        }
    }
}