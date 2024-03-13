using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void btnAuthorManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("authorManagement.aspx");
        }

        protected void btnPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("publisherManagement.aspx");
        }

        protected void btnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookInventory.aspx");
        }

        protected void btnBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookIssuing.aspx");
        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void btnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookInventoryList.aspx");
        }

        protected void btnMemberManagement_Click1(object sender, EventArgs e)
        {
            Response.Redirect("memberManagement.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }
    }
}