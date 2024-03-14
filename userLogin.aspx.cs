using System;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LibraryManagement
{
    public partial class userLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "SELECT * FROM member_master_tbl WHERE member_id=@memberId AND password = @password";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@memberId", txtUserUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtUserPassword.Text.Trim());

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();

                                string username = reader["member_id"].ToString();
                                string fullName = reader["full_name"].ToString();
                                string accountStatus = reader["account_status"].ToString();

                                Session["username"] = username;
                                Session["full_name"] = fullName;
                                Session["role"] = "user";
                                Session["status"] = accountStatus;
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

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }
    }
}

