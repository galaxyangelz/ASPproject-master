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
    public partial class StudentRegister : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ASP"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE username ='" + UsernameReg.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar());

            if (temp == 1)
            {
                ErrorLabel.Text = "Username Already Exists";
            }
            else
            {
                cmd = new SqlCommand("INSERT INTO [User](username,password,email) VALUES(@Username,@Password,@Email);SELECT SCOPE_IDENTITY();", con);
                cmd.Parameters.AddWithValue("@Username", UsernameReg.Text);
                cmd.Parameters.AddWithValue("@Password", PasswordReg.Text);
                cmd.Parameters.AddWithValue("@Email", EmailReg.Text);
                int last_id = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = new SqlCommand("INSERT INTO [Student](firstname,lastname,user_id) VALUES(@Fname,@Lname,@UserId);", con);
                cmd.Parameters.AddWithValue("@Fname", FnameReg.Text);
                cmd.Parameters.AddWithValue("@Lname", LnameReg.Text);
                cmd.Parameters.AddWithValue("@UserID", last_id);
                cmd.ExecuteNonQuery();
                Response.Redirect("StudentDashboard.aspx");
            }
            con.Close();
        }
    }
}