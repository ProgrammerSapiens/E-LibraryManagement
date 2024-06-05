using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class userProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["role"] is "user" || Session["role"] is "admin")
                {
                    FillAllTheFields();
                }
                else
                {
                    Response.Write("<script>alert('The session has time out. You have to log in again')</script>");
                    Response.Redirect("userlogin.aspx");
                }
            }
        }
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            UpdateUserData();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["role"] is "user" || Session["role"] is "admin")
            {
                UpdateUserData();
            }
            else
            {
                Response.Write("<script>alert('The session has time out. You have to log in again')</script>");
                Response.Redirect("userlogin.aspx");
            }
        }
        void FillAllTheFields()
        {
            try
            {
                string query = "SELECT * FROM member_master_tbl WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                txtFullName.Text = reader["full_name"].ToString().Trim();
                                txtDateOfBirth.Text = reader["dob"].ToString().Trim();
                                txtContactNumber.Text = reader["contact_no"].ToString().Trim();
                                txtEmail.Text = reader["email"].ToString().Trim();
                                dlState.SelectedValue = reader["state"].ToString();
                                txtCity.Text = reader["city"].ToString().Trim();
                                txtPincode.Text = reader["pincode"].ToString().Trim();
                                txtFullAdress.Text = reader["full_address"].ToString().Trim();
                                txtLogin.Text = reader["member_id"].ToString().Trim();
                                txtOldPassword.Text = reader["password"].ToString().Trim();
                                lblAccountStatus.Text = reader["account_status"].ToString().Trim();

                                if (reader["account_status"].ToString().Trim() == "active")
                                {
                                    lblAccountStatus.Attributes.Add("class", "badge rounded-pill text-bg-success");
                                }
                                else if (reader["account_status"].ToString().Trim() == "pending")
                                {
                                    lblAccountStatus.Attributes.Add("class", "badge rounded-pill text-bg-warning");
                                }
                                else
                                {
                                    lblAccountStatus.Attributes.Add("class", "badge rounded-pill text-bg-danger");
                                }
                            }
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        protected void grdIssuedBooksList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime dueDate;
                string cellText = e.Row.Cells[5].Text;
                if (DateTime.TryParseExact(cellText, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out dueDate))
                {
                    if (dueDate < DateTime.Now)
                    {
                        e.Row.CssClass = "table-danger";
                    }
                }
                else
                {
                    Response.Write("<script>alert('A due date could not be parsed')</script>");
                }
            }
        }
        void UpdateUserData()
        {
            try
            {
                string password = txtNewPassword.Text.Trim().Length > 0 ? txtNewPassword.Text : txtOldPassword.Text;

                string query = "UPDATE member_master_tbl SET full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                        cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@dob", txtDateOfBirth.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact_no", txtContactNumber.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@state", dlState.SelectedValue.Trim().ToString());
                        cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
                        cmd.Parameters.AddWithValue("@full_address", txtFullAdress.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@account_status", "pending");

                        int result = cmd.ExecuteNonQuery();
                        txtNewPassword.Text = "";

                        if (result > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The data has been successfully updated');", true);
                            FillAllTheFields();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Failed to update data');", true);
                        }
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('An error occurred while updating data. Please try again later.')</script>");
            }
        }
    }
}