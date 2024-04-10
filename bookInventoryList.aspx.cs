using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grdBookInventoryList.DataBind();
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
    }
}