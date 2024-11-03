using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace allure_bliss_shop
{
    public partial class Home : System.Web.UI.Page
    {
        // Create a connection object to the database using the connection string from the web configuration file
        SqlConnection DB = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Create a command to select ProductId, ProductName, Price, and Image from the Product table
            SqlCommand cmd = new SqlCommand("SELECT ProductId, ProductName, Price, Image FROM [Product]", DB);

            // Open the database connection
            cmd.Connection.Open();

            // Set the data source of the Repeater control to the result of the query execution
            Repeater1.DataSource = cmd.ExecuteReader();

            // Bind the data to the Repeater control to display the products
            Repeater1.DataBind();

            // Close the database connection
            cmd.Connection.Close();

            // Dispose of the command object to release resources
            cmd.Connection.Dispose();
        }
    }
}