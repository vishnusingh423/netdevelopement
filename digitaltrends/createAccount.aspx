<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="createAccount.aspx.cs" Inherits="allure_bliss_shop.Signup" %>
<%-- Page directive to set the title to "Signup", use C# as the programming language, specify the master page, enable auto event wireup, link to the code-behind file, and specify the class that this page inherits from. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- Content control to define the content to be placed in the ContentPlaceHolder1 section of the master page. --%>

    <section class="products-sec">
    <%-- HTML section element with a class "products-sec" for styling the section. --%>

        <div class="form-box">
        <%-- Div element with a class "form-box" to style the form container. --%>

            <asp:Label ID="InfoLabel" runat="server" CssClass="info"></asp:Label>
            <%-- ASP.NET Label control for displaying information messages, styled with the "info" CSS class. --%>

            <div class="form-row">
            <%-- Div element to group form elements in a row. --%>

                <asp:Label ID="NameLabel" runat="server" Text="Name:" AssociatedControlID="NameTextBox"></asp:Label>
                <%-- ASP.NET Label control for the "Name" field, associated with the "NameTextBox" for accessibility. --%>

                <asp:TextBox ID="NameTextBox" runat="server" CssClass="input" Placeholder="Hugh Doe" />
                <%-- ASP.NET TextBox control for user input for the name, styled with the "input" CSS class and a placeholder text. --%>

                <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="Name is required." CssClass="alert alert-danger" />
                <%-- ASP.NET RequiredFieldValidator to ensure the "NameTextBox" is not empty, with a dynamic display and an error message styled with CSS classes "alert" and "alert-danger". --%>
            </div>

            <div class="form-row">
            <%-- Another form row for the email field. --%>

                <asp:Label ID="EmailLabel" runat="server" Text="Email:" AssociatedControlID="EmailTextBox"></asp:Label>
                <%-- Label for the "Email" field. --%>

                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="input" Placeholder="someone@xyz.com" />
                <%-- TextBox for user email input, styled with the "input" CSS class and a placeholder text. --%>

                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is required." CssClass="alert alert-danger" />
                <%-- Validator to ensure the email field is not empty, with an error message styled with CSS classes "alert" and "alert-danger". --%>

                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Invalid email format." CssClass="alert alert-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                <%-- Validator to ensure the email input matches a specific format using a regular expression, with an error message styled with CSS classes "alert" and "alert-danger". --%>
            </div>

            <div class="form-row">
            <%-- Form row for the password field. --%>

                <asp:Label ID="PasswordLabel" runat="server" Text="Password:" AssociatedControlID="PasswordTextBox"></asp:Label>
                <%-- Label for the password field. --%>

                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="input" Placeholder="********" />
                <%-- Password TextBox to hide user input, styled with the "input" CSS class and a placeholder text. --%>

                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Password is required." CssClass="alert alert-danger" />
                <%-- Validator to ensure the password field is not empty, with an error message styled with CSS classes "alert" and "alert-danger". --%>
            </div>

            <div class="form-row">
            <%-- Form row for the confirm password field. --%>

                <asp:Label ID="ConfirmPasswordLabel" runat="server" Text="Confirm Password:" AssociatedControlID="ConfirmPasswordTextBox"></asp:Label>
                <%-- Label for the confirm password field. --%>

                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" CssClass="input" Placeholder="********" />
                <%-- Password TextBox for confirming the password, styled with the "input" CSS class and a placeholder text. --%>

                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" ErrorMessage="Confirm Password is required." CssClass="alert alert-danger" />
                <%-- Validator to ensure the confirm password field is not empty, with an error message styled with CSS classes "alert" and "alert-danger". --%>

                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" ErrorMessage="Passwords do not match." CssClass="alert alert-danger" />
                <%-- Validator to ensure the password and confirm password fields match, with an error message styled with CSS classes "alert" and "alert-danger". --%>
            </div>

            <div class="form-row">
            <%-- Form row for the address field. --%>

                <asp:Label ID="AddressLabel" runat="server" Text="Address:" AssociatedControlID="AddressTextBox"></asp:Label>
                <%-- Label for the address field. --%>

                <asp:TextBox ID="AddressTextBox" runat="server" TextMode="MultiLine" CssClass="input" />
                <%-- Multi-line TextBox for user address input, styled with the "input" CSS class. --%>

                <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="Address is required." CssClass="alert alert-danger" />
                <%-- Validator to ensure the address field is not empty, with an error message styled with CSS classes "alert" and "alert-danger". --%>
            </div>

            <div class="form-row center"> Already have an account? <a href="Login.aspx">Login Here!</a></div>
            <%-- Form row with a link to the login page for existing users. --%>

            <div class="form-row center">
            <%-- Form row for the signup button. --%>

                <asp:Button ID="SignupButton" runat="server" CssClass="btn" Text="Signup" OnClick="SignupButton_Click" />
                <%-- ASP.NET Button control for submitting the signup form, styled with the "btn" CSS class and an event handler for the click event. --%>
            </div>
        </div>
    </section>
</asp:Content>
