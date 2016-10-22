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
    public partial class TeacherDashboard : System.Web.UI.Page
    {
        Teacher teacher = null;
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ASP"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacher"] == null || (string)Session["role"] != "teacher")
            {
                Response.Redirect("TeacherLogin.aspx");
            }


            teacher = (Teacher) Session["teacher"];
            lblTitle.Text = "Teacher dashboard";
            lblName.Text = teacher.firstname + " " + teacher.lastname;

            CourseSqlDataSource.SelectParameters["teacherId"].DefaultValue = teacher.id.ToString();
            grdCourse.DataBind();
        }

        protected void btnCreateCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateCourse.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["teacher"] = null;
            Session["role"] = "";
            Response.Redirect("TeacherLogin.aspx");
        }

        protected void grdCourse_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = grdCourse.Rows[index];
                var id = row.Cells[1].Text;
                // Add code here to add the item to the shopping cart.

                CourseSqlDataSource.DeleteParameters.Add("id", id);
                CourseSqlDataSource.SelectParameters["teacherId"].DefaultValue = teacher.id.ToString();
                CourseSqlDataSource.Delete();
                grdCourse.DataBind();
                Response.Redirect("TeacherLogin.aspx");
            }
        }

        protected void grdCourse_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}