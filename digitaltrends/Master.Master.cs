using System;
using System.Web.UI;

namespace allure_bliss_shop
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is called when the page is loaded

            if (!IsPostBack)
            {
                // Check if the page is being loaded for the first time (not a postback)

                if (Session["Login"] != null)
                {
                    // Check if the "Login" session variable is set (user is logged in)

                    LogoutLink.Visible = true;
                    // Make the Logout link visible
                    SignupLink.Visible = false;
                    // Hide the Signup link
                    LoginLink.Visible = false;
                    // Hide the Login link
                    CartLink.Visible = true;
                    // Make the Cart link visible
                }
                else
                {
                    // User is not logged in

                    LogoutLink.Visible = false;
                    // Hide the Logout link
                    SignupLink.Visible = true;
                    // Make the Signup link visible
                    LoginLink.Visible = true;
                    // Make the Login link visible
                    CartLink.Visible = false;
                    // Hide the Cart link
                }
            }
        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            // This method is called when the Logout link is clicked

            // Clear login and cart session
            Session["Login"] = null;
            // Remove the "Login" session variable (log out the user)
            Response.Redirect("Home.aspx");
            // Redirect the user to the Home page
        }
    }
}
