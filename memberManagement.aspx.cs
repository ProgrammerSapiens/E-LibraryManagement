using System;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LibraryManagement
{
    public partial class memberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdUserList.DataBind();
        }
        protected void btnGoToUserId_Click(object sender, EventArgs e)
        {
            if (MemberExists())
            {
                GetMemberById();
            }
        }
        protected void lkbtnActiveStatus_Click(object sender, EventArgs e)
        {
            if (MemberExists())
            {
                UpdateMemberStatus("active");
            }
        }
        protected void lkbtnPendingStatus_Click(object sender, EventArgs e)
        {
            if (MemberExists())
            {
                UpdateMemberStatus("pending");
            }
        }
        protected void lkbtnDiactivateStatus_Click(object sender, EventArgs e)
        {
            if (MemberExists())
            {
                UpdateMemberStatus("diactivate");
            }
        }
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            if (MemberExists())
            {
                DeleteMember();
                grdUserList.DataBind();
                Clear();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text;

            SqlDataSource1.SelectCommand = "SELECT * FROM [member_master_tbl] WHERE " +
        "full_name LIKE '%" + searchKeyword + "%' OR " +
        "account_status LIKE '%" + searchKeyword + "%' OR " +
        "contact_no LIKE '%" + searchKeyword + "%' OR " +
        "email LIKE '%" + searchKeyword + "%' OR " +
        "state LIKE '%" + searchKeyword + "%' OR " +
        "city LIKE '%" + searchKeyword + "%' OR " +
        "member_id LIKE '%" + searchKeyword + "%'";
        }
        bool MemberExists()
        {
            try
            {
                string query = "SELECT * FROM member_master_tbl WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtUserId.Text.Trim());

                        if (cmd.ExecuteScalar() == null)
                        {
                            Response.Write("<script>alert('The ID does not exist')</script>");
                            return false;
                        }
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return true;
            }
        }
        void GetMemberById()
        {
            try
            {
                string query = "SELECT * FROM member_master_tbl WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtUserId.Text.Trim());

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();

                                txtUserName.Text = reader["full_name"].ToString();
                                txtUserDateOfBirth.Text = reader["dob"].ToString();
                                txtUserContactNumber.Text = reader["contact_no"].ToString();
                                txtUserEmail.Text = reader["email"].ToString();
                                txtUserState.Text = reader["state"].ToString();
                                txtUserCity.Text = reader["city"].ToString();
                                txtUserPincode.Text = reader["pincode"].ToString();
                                txtUserFullAdress.Text = reader["full_address"].ToString();
                                txtAccountStatus.Text = reader["account_status"].ToString();
                            }
                            else
                            {
                                Response.Write("<script>alert('The ID does not exist')</script>");
                            }
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
        void UpdateMemberStatus(string status)
        {
            try
            {
                string query = "UPDATE member_master_tbl SET account_status=@account_status WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@account_status", status);
                        cmd.Parameters.AddWithValue("@member_id", txtUserId.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('Member Status Updated')</script>");
                        grdUserList.DataBind();
                        txtAccountStatus.Text = status;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void DeleteMember()
        {
            try
            {
                string query = "DELETE FROM member_master_tbl WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtUserId.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The member has been successfully deleted')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void Clear()
        {
            txtUserId.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtUserDateOfBirth.Text = string.Empty;
            txtAccountStatus.Text = string.Empty;
            txtUserContactNumber.Text = string.Empty;
            txtUserEmail.Text = string.Empty;
            txtUserState.Text = string.Empty;
            txtUserCity.Text = string.Empty;
            txtUserPincode.Text = string.Empty;
            txtUserFullAdress.Text = string.Empty;
        }
    }
}