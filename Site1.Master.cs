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
            try
            {
                if (Session["role"].Equals(""))
                {
                    lkbtnUserLogin.Visible = true;
                    lkbtnSignUp.Visible = true;

                    lkbtnLogout.Visible = false;
                    lkbtn.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void lkbtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void lkbtnAuthorManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("authorManagement.aspx");
        }

        protected void lkbtnPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("publisherManagement.aspx");
        }

        protected void lkbtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookInventory.aspx");
        }

        protected void lkbtnBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookIssuing.aspx");
        }

        protected void lkbtnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void lkbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void lkbtnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookInventoryList.aspx");
        }

        protected void lkbtnMemberManagement_Click1(object sender, EventArgs e)
        {
            Response.Redirect("memberManagement.aspx");
        }

        protected void lkbtnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void lkbtnHelloUser_Click(object sender, EventArgs e)
        {

        }
    }
}