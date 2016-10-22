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
    public partial class TeacherRegister : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ASP"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Log_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE username ='" + Username.Text + "' AND password ='" + Password.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar());

            if (temp == 1)
            {
                string subsql = "SELECT id FROM [User] WHERE username ='" + Username.Text + "' AND password ='" + Password.Text + "'";
                cmd = new SqlCommand("SELECT * FROM [Teacher] WHERE user_id = ("+ subsql + ")", con);                
             
                SqlDataReader reader;

                reader = cmd.ExecuteReader();
                
                if (reader.HasRows)
                {
                    // Read advances to the next row.
                    while (reader.Read())
                    {
                        Teacher teacher = new Teacher();
                        teacher.id =  reader.GetInt32(reader.GetOrdinal("id"));
                        teacher.firstname = reader.GetString(reader.GetOrdinal("firstname"));
                        teacher.lastname = reader.GetString(reader.GetOrdinal("lastname"));
                        teacher.user_id = reader.GetInt32(reader.GetOrdinal("user_id"));
                        Session["teacher"] = teacher;
                        Session["role"] = "teacher";
                    }
                }

                con.Close();
                Response.Redirect("TeacherDashboard.aspx");
            }

            ErrorLabel.Text = "Username or password is wrong";
            con.Close();
        }
    }
}