using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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

                        var result = cmd.ExecuteScalar();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                string username = reader["member_id"].ToString();
                                string fullName = reader["full_name"].ToString();
                                string accountStatus = reader["account_status"].ToString();

                                string encodedFullName = HttpUtility.JavaScriptStringEncode(fullName);
                                Response.Write("<script>alert('Hello, " + encodedFullName + "')</script>");
                                Session["username"] = username;
                                Session["fullname"] = fullName;
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
    }
}

