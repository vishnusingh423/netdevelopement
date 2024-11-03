using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace allure_bliss_shop
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method runs when the page is loaded.
        }

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // Ensure all validators pass
            {
                // Retrieve user input from text boxes
                string name = NameTextBox.Text;
                string email = EmailTextBox.Text;
                string password = PasswordTextBox.Text;
                string address = AddressTextBox.Text;

                // Validate if the email is not already registered
                if (!IsEmailAlreadyRegistered(email))
                {
                    // Insert user into the database
                    if (InsertUserIntoDatabase(name, email, password, address))
                    {
                        // Display success message
                        InfoLabel.Text = "Signup successful! You can now <a href='Login.aspx'>login here</a>.";
                        InfoLabel.CssClass = "alert alert-success";
                    }
                    else
                    {
                        // Display error message
                        InfoLabel.Text = "Error occurred. Please try again later.";
                        InfoLabel.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    // Display error message if email is already registered
                    InfoLabel.Text = "Email is already registered.";
                    InfoLabel.CssClass = "alert alert-danger";
                }
            }
        }

        private bool IsEmailAlreadyRegistered(string email)
        {
            // Check if the email already exists in the database
            string connectionString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            string query = "SELECT COUNT(*) FROM [User] WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add email parameter to the SQL query
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    // Execute the query and get the result
                    int count = (int)command.ExecuteScalar();
                    // Return true if count is greater than 0 (email exists)
                    return count > 0;
                }
            }
        }

        private bool InsertUserIntoDatabase(string name, string email, string password, string address)
        {
            // Insert user details into the database
            string connectionString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            string query = "INSERT INTO [User] (UserName, Email, Password, Address) VALUES (@Name, @Email, @Password, @Address)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SQL query
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Address", address);
                    connection.Open();
                    // Execute the query and get the number of rows affected
                    int rowsAffected = command.ExecuteNonQuery();
                    // Return true if one or more rows were inserted
                    return rowsAffected > 0;
                }
            }
        }
    }
}
