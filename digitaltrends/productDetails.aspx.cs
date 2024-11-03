using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace allure_bliss_shop
{
    public partial class productDetails : System.Web.UI.Page
    {
        // Establish a connection to the database using the connection string from Web.config
        SqlConnection DB = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Only execute this block on the first page load, not on postbacks
            {
                // Check if ProductId is present in the query string
                if (Request.QueryString["ProductId"] != null)
                {
                    string ProductId = Request.QueryString["ProductId"].ToString();

                    // Set up a SQL data adapter to select the product details from the database
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand("SELECT * FROM Product WHERE ProductId = @ProductId", DB);
                    da.SelectCommand.Parameters.AddWithValue("@ProductId", ProductId);

                    DataTable dt = new DataTable(); // Create a DataTable to hold the product details
                    da.Fill(dt); // Fill the DataTable with data from the database

                    // If product details are found, set the UI controls with the product information
                    if (dt.Rows.Count > 0)
                    {
                        ProductDetailImage.ImageUrl = "product_images/" + dt.Rows[0]["Image"].ToString(); // Set the product image URL
                        ProductDetailName.InnerText = dt.Rows[0]["ProductName"].ToString(); // Set the product name
                        ProductDetailPrice.InnerText = "$" + dt.Rows[0]["Price"].ToString(); // Set the product price
                        ProductDetailDesc.InnerText = dt.Rows[0]["Description"].ToString(); // Set the product description
                        ViewState["ProductId"] = ProductId; // Store the ProductId in ViewState for later use
                    }
                }
                else
                {
                    Response.Redirect("Home.aspx"); // Redirect to home if ProductId is not in the query string
                }
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Login"] != null)
            {
                if (ViewState["ProductId"] != null)
                {
                    int userId = Convert.ToInt32(Session["UserId"]); // Retrieve the logged-in user's ID from the session
                    int productId = Convert.ToInt32(ViewState["ProductId"]); // Retrieve the product ID from ViewState

                    // Check if the product is already in the cart
                    if (IsProductInCart(userId, productId))
                    {
                        MessageLabel.Text = "Product is already in your cart."; // Display message if the product is already in the cart
                        MessageLabel.CssClass = "alert alert-danger"; // Apply error styling
                    }
                    else
                    {
                        // Add the product to the cart
                        if (AddProductToCart(userId, productId))
                        {
                            MessageLabel.Text = "Product added to your cart successfully!"; // Display success message
                            MessageLabel.CssClass = "alert alert-success"; // Apply success styling
                        }
                        else
                        {
                            MessageLabel.Text = "Product could not be added to the cart."; // Display message if adding to cart failed
                            MessageLabel.CssClass = "alert alert-danger"; // Apply error styling
                        }
                    }
                }
                else
                {
                    MessageLabel.Text = "Product could not be added to the cart."; // Display error message if ProductId is missing
                    MessageLabel.CssClass = "alert alert-danger"; // Apply error styling
                }
            }
            else
            {
                MessageLabel.Text = "You need to log in first to add products to your cart."; // Prompt the user to log in
                MessageLabel.CssClass = "alert alert-danger"; // Apply error styling
            }
        }

        // Check if the product is already in the cart
        private bool IsProductInCart(int userId, int productId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Cart WHERE UserId = @UserId AND ProductId = @ProductId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    connection.Open();
                    int count = (int)command.ExecuteScalar(); // Execute the query and get the count of matching records
                    return count > 0; // Return true if the product is already in the cart
                }
            }
        }

        // Add the product to the cart
        private bool AddProductToCart(int userId, int productId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            string query = "INSERT INTO Cart (UserId, ProductId) VALUES (@UserId, @ProductId)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery(); // Execute the query and get the number of rows affected
                    return rowsAffected > 0; // Return true if the product was successfully added to the cart
                }
            }
        }
    }
}
