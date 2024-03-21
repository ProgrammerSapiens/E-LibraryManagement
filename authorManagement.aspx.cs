using System;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LibraryManagement
{
    public partial class authorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddAuthor_Click(object sender, EventArgs e)
        {
            if (AuthorExists())
            {
                Response.Write("<script>alert('The author with this ID already exists!')</script>");
            }
            else
            {
                AddNewAuthor();
                Clear();
                grdAuthorList.DataBind();
            }
        }
        protected void btnUpdateAuthor_Click(object sender, EventArgs e)
        {
            if (AuthorExists())
            {
                UpdateAuthor();
                Clear();
                grdAuthorList.DataBind();
            }
            else
            {
                Response.Write("<script>alert('The ID does not exist')</script>");
            }
        }
        protected void btnDeleteAuthor_Click(object sender, EventArgs e)
        {
            if (AuthorExists())
            {
                DeleteAuthor();
                Clear();
                grdAuthorList.DataBind();
            }
            else
            {
                Response.Write("<script>alert('The ID does not exist')</script>");
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text;

            SqlDataSource1.SelectCommand = "SELECT * FROM [author_master_tbl] WHERE " +
                "author_name LIKE '%" + searchKeyword + "%' OR " +
                "author_id LIKE '%" + searchKeyword + "%'";
        }
        protected void btnGoToAuthorId_Click(object sender, EventArgs e)
        {
            getAuthorById();
        }
        bool AuthorExists()
        {
            try
            {
                string query = "SELECT * FROM author_master_tbl WHERE author_id=@author_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());

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
        void AddNewAuthor()
        {
            try
            {
                string query = "INSERT INTO author_master_tbl (author_id, author_name) VALUES(@author_id, @author_name)";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());
                        cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The author was successfuly added')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void UpdateAuthor()
        {
            try
            {
                string query = "UPDATE author_master_tbl SET author_name=@author_name WHERE author_id=@author_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());
                        cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());

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
        void DeleteAuthor()
        {
            try
            {
                string query = "DELETE FROM author_master_tbl WHERE author_id=@author_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('The author was successfuly deleted')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getAuthorById()
        {
            try
            {
                string query = "SELECT author_name FROM author_master_tbl WHERE author_id=@author_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());

                        var result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            txtAuthorName.Text = result.ToString();
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
            txtAuthorId.Text = string.Empty;
            txtAuthorName.Text = string.Empty;
        }
    }
}