using System;

namespace E_LibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] is "admin")
                {
                    lkbtnAuthorManagement.Visible = true;
                    lkbtnPublisherManagement.Visible = true;
                    lkbtnBookInventory.Visible = true;
                    lkbtnBookIssuing.Visible = true;
                    lkbtnMemberManagement.Visible = true;
                    lkbtnLogout.Visible = true;
                    lkbtnHelloUser.Visible = true;

                    lkbtnUserLogin.Visible = false;
                    lkbtnSignUp.Visible = false;

                    lkbtnHelloUser.Text = "Hello Admin";
                }
                else
                {
                    if (Session["role"] is "user")
                    {
                        lkbtnLogout.Visible = true;
                        lkbtnHelloUser.Visible = true;

                        lkbtnUserLogin.Visible = false;
                        lkbtnSignUp.Visible = false;

                        lkbtnHelloUser.Text = "Hello " + Session["full_name"].ToString();
                    }
                    else
                    {
                        lkbtnUserLogin.Visible = true;
                        lkbtnSignUp.Visible = true;

                        lkbtnLogout.Visible = false;
                        lkbtnHelloUser.Visible = false;
                    }

                    lkbtnAuthorManagement.Visible = false;
                    lkbtnPublisherManagement.Visible = false;
                    lkbtnBookInventory.Visible = false;
                    lkbtnBookIssuing.Visible = false;
                    lkbtnMemberManagement.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
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
            Session["username"] = null;
            Session["full_name"] = null;
            Session["role"] = null;
            Response.Redirect("homepage.aspx");
        }

        protected void lkbtnHelloUser_Click(object sender, EventArgs e)
        {

        }
    }
}