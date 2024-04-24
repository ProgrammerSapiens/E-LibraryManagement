using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class bookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            grdIssuedBooksList.DataBind();
        }
        protected void btnGoToBookId_Click(object sender, EventArgs e)
        {
            if (BookExist() && MemberExist())
            {
                FillMemberNameAndBookNameFields();
            }
            else
            {
                Response.Write("<script>alert('The book or the Member with this ID does not exist!')</script>");
            }
        }
        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (BookExist() && MemberExist())
            {
                if (IssueEntryExists())
                {
                    Response.Write("<script>alert('The Member already has this book')</script>");
                }
                else
                {
                    IssueBook();
                    Clear();
                }
            }
            else
            {
                Response.Write("<script>alert('The book or the Member with this ID does not exist!')</script>");
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (BookExist() && MemberExist() && !BooksHaveBeenReturned())
            {
                ReturnBook();
                Clear();
            }
            else
            {
                Response.Write("<script>alert('The book or the Member with this ID does not exist or all the books have been returned!')</script>");
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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text;

            SqlDataSource1.SelectCommand = "SELECT * FROM [book_issue_tbl] WHERE " +
                "book_name LIKE '%" + searchKeyword + "%' OR " +
                "book_id LIKE '%" + searchKeyword + "%' OR " +
                "member_name LIKE '%" + searchKeyword + "%' OR " +
                "member_id LIKE '%" + searchKeyword + "%'";
        }
        bool BookExist()
        {
            try
            {
                string query = "SELECT COUNT(*) FROM book_master_tbl WHERE book_id=@book_id AND current_stock>0";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        con.Close();

                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return true;
            }
        }
        bool MemberExist()
        {
            try
            {
                string query = "SELECT COUNT(*) FROM member_master_tbl WHERE member_id=@member_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtMemberId.Text.Trim());

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        con.Close();

                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return true;
            }
        }
        bool IssueEntryExists()
        {
            try
            {
                string query = "SELECT COUNT(*) FROM book_issue_tbl WHERE member_id=@member_id AND book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtMemberId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        con.Close();

                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return true;
            }
        }
        bool BooksHaveBeenReturned()
        {
            try
            {
                string query = "SELECT current_stock,actual_stock FROM book_master_tbl WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        int current_stock = 0, actual_stock = 0;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                current_stock = Convert.ToInt32(reader["current_stock"]);
                                actual_stock = Convert.ToInt32(reader["actual_stock"]);
                            }
                        }

                        con.Close();

                        return current_stock == actual_stock;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return true;
            }
        }
        void FillMemberNameAndBookNameFields()
        {
            try
            {
                string memberQuery = "SELECT full_name FROM member_master_tbl WHERE member_id=@member_id";
                string BookQuery = "SELECT book_name FROM book_master_tbl WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(memberQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", txtMemberId.Text.Trim());

                        txtMemberName.Text = cmd.ExecuteScalar().ToString();
                    }
                    using (SqlCommand cmd = new SqlCommand(BookQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        txtBookName.Text = cmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void IssueBook()
        {
            try
            {
                string issueQuery = "INSERT INTO book_issue_tbl(member_id,book_id,book_name,member_name,issue_date,due_date) VALUES(@member_id,@book_id,@book_name,@member_name,@issue_date,@due_date)";
                string bookQuery = "UPDATE book_master_tbl SET current_stock=current_stock-1 WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(issueQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_id", txtMemberId.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_name", txtMemberName.Text.Trim());
                        cmd.Parameters.AddWithValue("@issue_date", txtStartDate.Text.Trim());
                        cmd.Parameters.AddWithValue("@due_date", txtEndDate.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd = new SqlCommand(bookQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();

                    Response.Write("<script>('The book was issued successfully')</script>");
                    grdIssuedBooksList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void ReturnBook()
        {
            try
            {
                string issueQuery = "DELETE FROM book_issue_tbl WHERE book_id=@book_id AND member_id=@member_id";
                string bookQuery = "UPDATE book_master_tbl SET current_stock=current_stock+1 WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(issueQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_id", txtMemberId.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd = new SqlCommand(bookQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();

                    Response.Write("<script>('The book was returned successfully')</script>");
                    grdIssuedBooksList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void Clear()
        {
            txtMemberName.Text = String.Empty;
            txtBookName.Text = String.Empty;
            txtStartDate.Text = String.Empty;
            txtEndDate.Text = String.Empty;
        }
    }
}