using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Xml.Schema;

namespace E_LibraryManagement
{
    public partial class bookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            FillAuthorPublisherValues();
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

        }
        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {

        }
        protected void btnGoToBookId_Click(object sender, EventArgs e)
        {

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
                        List<string> authorName = new List<string>();
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
                        List<string> publisherName = new List<string>();
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
                string query = "SELECT * FROM book_master_tbl WHERE book_id=@book_id OR book_name=@book_name";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());

                        int count = Convert.ToInt32(cmd.ExecuteScalar());
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
                string genres = "";
                foreach (int i in lbGenre.GetSelectedIndices())
                {
                    genres = genres + lbGenre.Items[i] + ", ";
                }
                genres = genres.Remove(genres.Length - 2);

                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(updBookImage.PostedFile.FileName);
                updBookImage.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                string query = "INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) VALUES(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)";
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", txtBookId.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
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
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

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
    }
}