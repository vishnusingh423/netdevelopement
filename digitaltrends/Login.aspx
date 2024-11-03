<%@ Page Title="Login" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="allure_bliss_shop.Login" %>
<%-- Page directive to set the title, use C# as the programming language, specify the master page, enable auto event wireup, link to the code-behind file, and specify the class that this page inherits from. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- Content control to define the content to be placed in the ContentPlaceHolder1 section of the master page, with an ID of Content2. --%>

    <section class="login-sec">
    <%-- HTML section element with a class "login-sec" for styling the login section. --%>

        <div class="form-box">
        <%-- Div element with a class "form-box" to style the container for the login form. --%>

            <asp:Label ID="InfoLabel" runat="server" CssClass="info"></asp:Label>
            <%-- ASP.NET Label control to display information messages, with a class "info" for styling. --%>

            <asp:Panel runat="server">
            <%-- ASP.NET Panel control to group form elements together. --%>

                <div class="form-row">
                <%-- Div element with a class "form-row" to style each row of the form. --%>

                    <asp:Label ID="EmailLabel" runat="server" Text="Email:" AssociatedControlID="EmailTextBox"></asp:Label>
                    <%-- ASP.NET Label control for the email field, associated with the EmailTextBox control. --%>

                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="input" Placeholder="someone@xyz.com" />
                    <%-- ASP.NET TextBox control for the user to enter their email, with a class "input" for styling and a placeholder text. --%>

                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" Display="Dynamic" ControlToValidate="EmailTextBox" ErrorMessage="Email is required." CssClass="alert alert-danger" />
                    <%-- ASP.NET RequiredFieldValidator to ensure the email field is not left empty, with a class "alert alert-danger" for error styling. --%>

                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" Display="Dynamic" ControlToValidate="EmailTextBox" ErrorMessage="Invalid email format." CssClass="alert alert-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <%-- ASP.NET RegularExpressionValidator to ensure the email format is valid, with a class "alert alert-danger" for error styling. --%>
                </div>

                <div class="form-row">
                <%-- Div element with a class "form-row" to style each row of the form. --%>

                    <asp:Label ID="PasswordLabel" runat="server" Text="Password:" AssociatedControlID="PasswordTextBox"></asp:Label>
                    <%-- ASP.NET Label control for the password field, associated with the PasswordTextBox control. --%>

                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="input" Placeholder="********" />
                    <%-- ASP.NET TextBox control for the user to enter their password, with a class "input" for styling, and the TextMode set to "Password" to obscure the input. --%>

                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" Display="Dynamic" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." CssClass="alert alert-danger" />
                    <%-- ASP.NET RequiredFieldValidator to ensure the password field is not left empty, with a class "alert alert-danger" for error styling. --%>
                </div>

                <div class="form-row text-center">
                <%-- Div element with a class "form-row text-center" to center-align the login button. --%>

                    <asp:Button ID="LoginButton" runat="server" CssClass="btn" Text="Login" OnClick="LoginButton_Click" />
                    <%-- ASP.NET Button control for submitting the login form, with a class "btn" for styling and an OnClick event handler "LoginButton_Click". --%>
                </div>
            </asp:Panel>

            <div class="form-row center">
            <%-- Div element with a class "form-row center" to center-align the signup link. --%>

                Don't have an account? <a href="createAccount.aspx">Signup Here!</a>
                <%-- Link to the signup page for users who don't have an account. --%>
            </div>
        </div>
    </section>
</asp:Content>
