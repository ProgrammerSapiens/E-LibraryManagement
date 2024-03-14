using System;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LibraryManagement
{
    public partial class adminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "SELECT * FROM admin_login_tbl WHERE username=@username AND password = @password";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", txtAdminUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtAdminPassword.Text.Trim());

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();

                                string username = reader["username"].ToString();
                                string fullName = reader["full_name"].ToString();

                                Session["username"] = username;
                                Session["full_name"] = fullName;
                                Session["role"] = "admin";
                                Response.Redirect("homepage.aspx");
                            }
                            else
                                Response.Write("<script>alert('Incorrect username or password')</script>");
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}