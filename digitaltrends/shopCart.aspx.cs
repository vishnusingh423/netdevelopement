using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace allure_bliss_shop
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection DB = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["Login"] != null)
                {
                    int userId = Convert.ToInt32(Session["UserId"]);
                    LoadCart(userId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadCart(int userId)
        {
            // Query to get cart items and their details
            string query = "SELECT C.ProductId, P.ProductName, P.Price, P.Image FROM Cart C JOIN Product P ON C.ProductId = P.ProductId WHERE C.UserId = @UserId";
            SqlDataAdapter da = new SqlDataAdapter(query, DB);
            da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // Bind the cart items to the Repeater control
                CartRepeater.DataSource = dt;
                CartRepeater.DataBind();

                // Calculate the total price of items in the cart
                decimal total = 0;
                foreach (RepeaterItem item in CartRepeater.Items)
                {
                    HiddenField priceHidden = (HiddenField)item.FindControl("PriceHidden");
                    HiddenField quantityHidden = (HiddenField)item.FindControl("QuantityHidden");

                    decimal price = Convert.ToDecimal(priceHidden.Value);
                    int quantity = Convert.ToInt32(quantityHidden.Value);

                    total += price * quantity;
                }

                TotalLabel.Text = total.ToString("F2");
            }
            else
            {
                // Handle empty cart scenario
                CartRepeater.DataSource = null;
                CartRepeater.DataBind();

                MessageLabel.Text = "Your cart is empty.";
                MessageLabel.CssClass = "alert alert-danger";
                TotalLabel.Text = "0.00";
            }
        }

        protected void EmptyCartButton_Click(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"]);

                // Query to delete all items from the cart
                string query = "DELETE FROM Cart WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, DB);
                cmd.Parameters.AddWithValue("@UserId", userId);

                DB.Open();
                cmd.ExecuteNonQuery();
                DB.Close();

                LoadCart(userId); // Refresh the cart after emptying it
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"]);

                // Query to delete all items from the cart after placing the order
                string queryDeleteCart = "DELETE FROM Cart WHERE UserId = @UserId";
                SqlCommand cmdDeleteCart = new SqlCommand(queryDeleteCart, DB);
                cmdDeleteCart.Parameters.AddWithValue("@UserId", userId);

                DB.Open();
                cmdDeleteCart.ExecuteNonQuery();
                DB.Close();

                LoadCart(userId); // Refresh the cart view after placing the order

                // Show a success message
                MessageLabel.Text = "Order is placed.";
                MessageLabel.CssClass = "alert alert-success";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
