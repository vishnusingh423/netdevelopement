using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace allure_bliss_shop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is called when the page is loaded.
            // Currently, it does not perform any actions.
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // This method is called when the Login button is clicked.

            if (Page.IsValid) // Ensure all validators pass
            {
                // Retrieve email and password from text boxes
                string email = EmailTextBox.Text;
                string password = PasswordTextBox.Text;

                // Validate user credentials
                var user = ValidateUser(email, password);
                if (user != null)
                {
                    // Create user session
                    Session["Login"] = true;
                    Session["UserId"] = user.UserId;
                    Session["Name"] = user.Name;
                    Session["Email"] = user.Email;

                    // Redirect to the Home page
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    // Display error message if credentials are invalid
                    InfoLabel.Text = "Invalid email or password.";
                    InfoLabel.CssClass = "alert alert-danger";
                }
            }
        }

        private User ValidateUser(string email, string password)
        {
            // This method checks if the provided email and password exist in the database.

            // Retrieve the connection string from the configuration file
            string connectionString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            // SQL query to select user details based on email and password
            string query = "SELECT UserId, UserName, Email FROM [User] WHERE Email = @Email AND Password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a command to execute the SQL query
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SQL query
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    // Open the database connection
                    connection.Open();
                    // Execute the query and read the result
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Return user details if a record is found
                            return new User
                            {
                                UserId = reader.GetInt32(0),
                                Name = reader.GetString(1),
                                Email = reader.GetString(2)
                            };
                        }
                    }
                }
            }
            // Return null if no matching user is found
            return null;
        }

        // User class to represent user information
        public class User
        {
            public int UserId { get; set; }  // User's unique identifier
            public string Name { get; set; } // User's name
            public string Email { get; set; } // User's email address
        }
    }
}
