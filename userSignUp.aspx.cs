using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace E_LibraryManagement
{
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('This username is already in use');</script>");
            }
            else
                signUpNewUser();
        }

        void signUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name,dob,contact_no," +
                    "email,state,city,pincode,full_address,member_id,password,account_status) values(@full_name," +
                    "@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDateOfBirth.Text);
                cmd.Parameters.AddWithValue("@contact_no", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", dlState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtFullAdress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txtLogin.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM member_master_tbl where member_id='" + txtLogin.Text.Trim() + "';", con);
                var result = cmd.ExecuteScalar();
                con.Close();

                if (result == null)
                    return false;
                return true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
    }
}