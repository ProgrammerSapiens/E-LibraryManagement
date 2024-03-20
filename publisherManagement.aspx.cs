using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class publisherManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text;

            SqlDataSource1.SelectCommand = "SELECT * FROM [publisher_master_tbl] WHERE publisher_name LIKE '%" + searchKeyword + "%'";
        }

        protected void btnAddPublisher_Click(object sender, EventArgs e)
        {
            if (PublisherExists())
            {
                Response.Write("<script>alert('The publisher with this ID already exists!')</script>");
            }
            else
            {
                AddNewPublisher();
                Clear();
                grdPublisherList.DataBind();
            }
        }

        protected void btnUpdatePublisher_Click(object sender, EventArgs e)
        {
            if (PublisherExists())
            {
                UpdatePublisher();
                Clear();
                grdPublisherList.DataBind();
            }
            else
            {
                Response.Write("<script>alert('The ID does not exist')</script>");
            }
        }

        protected void btnDeletePublisher_Click(object sender, EventArgs e)
        {
            if (PublisherExists())
            {
                DeletePublisher();
                Clear();
                grdPublisherList.DataBind();
            }
            else
            {
                Response.Write("<script>alert('The ID does not exist')</script>");
            }
        }

        protected void btnGoToPublisherId_Click(object sender, EventArgs e)
        {
            getPublisherById();
        }
        bool PublisherExists()
        {
            try
            {
                string query = "SELECT * FROM publisher_master_tbl WHERE publisher_id=@publisher_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());

                        if (cmd.ExecuteScalar() == null)
                            return false;
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
        void AddNewPublisher()
        {
            try
            {
                string query = "INSERT INTO publisher_master_tbl (publisher_id, publisher_name) VALUES(@publisher_id, @publisher_name)";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());
                        cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The publisher was successfuly added')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void UpdatePublisher()
        {
            try
            {
                string query = "UPDATE publisher_master_tbl SET publisher_name=@publisher_name WHERE publisher_id=@publisher_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());
                        cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The author was successfuly updated')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void DeletePublisher()
        {
            try
            {
                string query = "DELETE FROM publisher_master_tbl WHERE publisher_id=@publisher_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The publisher was successfuly deleted')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getPublisherById()
        {
            try
            {
                string query = "SELECT publisher_name FROM publisher_master_tbl WHERE publisher_id=@publisher_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());

                        var result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            txtPublisherName.Text = result.ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Author not found')</script>");
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
        void Clear()
        {
            txtPublisherId.Text = string.Empty;
            txtPublisherName.Text = string.Empty;
        }
    }
}