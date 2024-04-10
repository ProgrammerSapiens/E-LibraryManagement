using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace E_LibraryManagement
{
    public partial class bookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValues();
            }

            grdBookInventoryList.DataBind();
        }
        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                Response.Write("<script>alert('The book with this ID already exists!')</script>");
            }
            else
            {
                AddNewBook();
            }
        }
        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                UpdateBook();
            }
            else
            {
                Response.Write("<script>alert('The book with this ID does not exist!')</script>");
            }
        }
        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                DeleteBook();
            }
            else
            {
                Response.Write("<script>alert('The book with this ID does not exist!')</script>");
            }
        }
        protected void btnGoToBookId_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                getBookById();
            }
            else
            {
                Response.Write("<script>alert('The book with this ID does not exist!')</script>");
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text;

            SqlDataSource1.SelectCommand = "SELECT * FROM [book_master_tbl] WHERE " +
                "book_name LIKE '%" + searchKeyword + "%' OR " +
                "genre LIKE '%" + searchKeyword + "%' OR " +
                "book_id LIKE '%" + searchKeyword + "%' OR " +
                "author_name LIKE '%" + searchKeyword + "%' OR " +
                "publisher_name LIKE '%" + searchKeyword + "%' OR " +
                "language LIKE '%" + searchKeyword + "%'";
        }
        void FillAuthorPublisherValues()
        {
            try
            {
                var authorQuery = "SELECT author_name FROM author_master_tbl";
                var publisherQuery = "SELECT publisher_name FROM publisher_master_tbl";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(authorQuery, con))
                    {
                        List<string> authorName = new List<string>() { "Select" };
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                authorName.Add(reader["author_name"].ToString());
                            }
                        }
                        dlAuthorName.DataSource = authorName;
                    }

                    using (SqlCommand cmd = new SqlCommand(publisherQuery, con))
                    {
                        List<string> publisherName = new List<string>() { "Select" };
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                publisherName.Add(reader["publisher_name"].ToString());
                            }
                        }
                        dlPublisherName.DataSource = publisherName;
                    }
                    con.Close();
                    dlAuthorName.DataBind();
                    dlPublisherName.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        bool BookExists()
        {
            try
            {
                string query = "SELECT COUNT(*) FROM book_master_tbl WHERE book_id=@book_id OR book_name=@book_name";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());

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
        void AddNewBook()
        {
            try
            {
                string query = "INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) VALUES(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", GetGenres());
                        cmd.Parameters.AddWithValue("@author_name", dlAuthorName.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publisher_name", dlPublisherName.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text.Trim());
                        cmd.Parameters.AddWithValue("@language", dlLanguage.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", txtBookDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", txtActualStock.Text.Trim());
                        cmd.Parameters.AddWithValue("@current_stock", txtActualStock.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_img_link", GetFilePath());

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();

                    Response.Write("<script>('The book was added successfully')</script>");
                    grdBookInventoryList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void UpdateBook()
        {
            try
            {
                string query = "UPDATE book_master_tbl SET book_name=@book_name,genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", GetGenres());
                        cmd.Parameters.AddWithValue("@author_name", dlAuthorName.SelectedValue.Trim().ToString());
                        cmd.Parameters.AddWithValue("@publisher_name", dlPublisherName.SelectedValue.Trim().ToString());
                        cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text.Trim());
                        cmd.Parameters.AddWithValue("@language", dlLanguage.SelectedValue.Trim().ToString());
                        cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", txtBookDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_img_link", GetFilePath());

                        GetStocks();
                        cmd.Parameters.AddWithValue("@actual_stock", txtActualStock.Text.Trim());
                        cmd.Parameters.AddWithValue("@current_stock", txtCurrentStock.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        grdBookInventoryList.DataBind();
                        Clear();

                        Response.Write("<script>alert('The book was successfuly updated')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void DeleteBook()
        {
            try
            {
                string query = "DELETE FROM book_master_tbl WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        cmd.ExecuteNonQuery();

                        con.Close();

                        grdBookInventoryList.DataBind();
                        Clear();

                        Response.Write("<script>alert('The book was successfuly deleted')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void GetStocks()
        {
            int actual_stock = Convert.ToInt32(txtActualStock.Text.Trim());
            int current_stock;

            if (actual_stock < global_issued_books)
            {
                Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
            }
            else
            {
                current_stock = actual_stock - global_issued_books;
                txtCurrentStock.Text = current_stock.ToString();
            }
        }
        string GetGenres()
        {
            string genres = "";
            foreach (int i in lbGenre.GetSelectedIndices())
            {
                genres = genres + lbGenre.Items[i] + ", ";
            }
            return genres.Remove(genres.Length - 2);
        }

        string GetFilePath()
        {
            string filename = Path.GetFileName(updBookImage.PostedFile.FileName);
            if (filename == "" || filename == null)
            {
                return global_filepath;
            }
            else
            {
                updBookImage.SaveAs(Server.MapPath("book_inventory/" + filename));
                return "~/book_inventory/" + filename;
            }
        }
        void getBookById()
        {
            try
            {
                string query = "SELECT * FROM book_master_tbl WHERE book_id=@book_id";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();

                                txtBookName.Text = reader["book_name"].ToString();
                                dlAuthorName.SelectedValue = reader["author_name"].ToString();
                                dlPublisherName.SelectedValue = reader["publisher_name"].ToString();
                                txtPublishDate.Text = reader["publish_date"].ToString();
                                dlLanguage.SelectedValue = reader["language"].ToString();
                                txtEdition.Text = reader["edition"].ToString();
                                txtBookCost.Text = reader["book_cost"].ToString().Trim();
                                txtPages.Text = reader["no_of_pages"].ToString().Trim();
                                txtBookDescription.Text = reader["book_description"].ToString();
                                txtActualStock.Text = reader["actual_stock"].ToString().Trim();
                                txtCurrentStock.Text = reader["current_stock"].ToString().Trim();
                                txtIssuedBooks.Text = "" + (Convert.ToInt32(reader["actual_stock"].ToString()) - Convert.ToInt32(reader["current_stock"].ToString()));

                                lbGenre.ClearSelection();
                                string[] genre = reader["genre"].ToString().Trim().Split(',');
                                for (int i = 0; i < genre.Length; i++)
                                {
                                    for (int j = 0; j < lbGenre.Items.Count; j++)
                                    {
                                        if (lbGenre.Items[j].ToString() == genre[i].Trim())
                                        {
                                            lbGenre.Items[j].Selected = true;
                                        }
                                    }
                                }
                                global_actual_stock = Convert.ToInt32(reader["actual_stock"].ToString().Trim());
                                global_current_stock = Convert.ToInt32(reader["current_stock"].ToString().Trim());
                                global_issued_books = global_actual_stock - global_current_stock;
                                global_filepath = reader["book_img_link"].ToString();
                            }

                            con.Close();
                        }
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
            txtBookId.Text = string.Empty;
            txtBookName.Text = string.Empty;
            lbGenre.ClearSelection();
            dlAuthorName.ClearSelection();
            dlPublisherName.ClearSelection();
            txtPublishDate.Text = string.Empty;
            dlLanguage.ClearSelection();
            txtEdition.Text = string.Empty;
            txtBookCost.Text = string.Empty;
            txtPages.Text = string.Empty;
            txtBookDescription.Text = string.Empty;
            txtActualStock.Text = string.Empty;
            txtCurrentStock.Text = string.Empty;
        }
    }
}