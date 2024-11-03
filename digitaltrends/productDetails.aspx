<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="allure_bliss_shop.productDetails" %>

<%-- The Page directive sets up page-specific properties --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Content placeholder for the master page --%>

    <h1 class="title details"> Product Details </h1>
    <%-- Main title for the product details page --%>

    <section class="product-details">
        <%-- Section containing product detail elements --%>

        <asp:Label ID="MessageLabel" runat="server" CssClass="message"></asp:Label>
        <%-- Label to display messages, such as error or success messages --%>

        <div class="img">
            <asp:Image runat="server" id="ProductDetailImage" />
            <%-- Image control to display the product image --%>
        </div>

        <div class="details">
            <%-- Div containing product details --%>

            <h2 runat="server" class="p_name" id="ProductDetailName"></h2>
            <%-- Heading for the product name --%>

            <h4 runat="server" class="price" id="ProductDetailPrice"></h4>
            <%-- Heading for the product price --%>

            <p runat="server" class="desc" id="ProductDetailDesc"></p>
            <%-- Paragraph for the product description --%>

            <asp:Button ID="AddToCartButton" runat="server" Text="Add to cart" OnClick="AddToCartButton_Click" CssClass="btn" />
            <%-- Button to add the product to the cart, triggers AddToCartButton_Click event --%>
        </div>
    </section>
</asp:Content>
