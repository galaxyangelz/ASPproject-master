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
    public partial class CreateCourse : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ASP"].ConnectionString);
        Teacher teacher = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            teacher = (Teacher)Session["teacher"];
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("SELECT COUNT(*) FROM [Course] WHERE teacher_id = '"+teacher.id+"' AND name ='" + txtCourseName.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar());

            if (temp == 1)
            {
                ErrorLabel.Text = "Course name exists";
            }
            else
            {
                cmd = new SqlCommand("INSERT INTO [Course](name,teacher_id) VALUES(@Name,@TeacherId);", con);
                cmd.Parameters.AddWithValue("@Name", txtCourseName.Text);
                cmd.Parameters.AddWithValue("@TeacherId", teacher.id);
                int last_id = Convert.ToInt32(cmd.ExecuteScalar());
                Response.Redirect("TeacherDashboard.aspx");
            }
            con.Close();
        }
    }
}