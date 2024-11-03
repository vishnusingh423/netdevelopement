<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="allure_bliss_shop.Home" %>

<%-- Page directive to set the title, use C# as the programming language, specify the master page, enable auto event wireup, link to the code-behind file, and specify the class that this page inherits from. --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- Content control to define the content to be placed in the ContentPlaceHolder1 section of the master page, with an ID of Content2. --%>

    <section class="hero">
    <%-- HTML section element with a class "hero" for styling the hero section. --%>
    </section>

    <section class="products-sec">
    <%-- HTML section element with a class "products-sec" for styling the products section. --%>

        <h1 class="title">Products</h1>
        <%-- Header element with a class "title" for the products section. --%>

        <div class="item-box">
        <%-- Div element with a class "item-box" to style the container for product items. --%>

            <asp:Repeater runat="server" ID="Repeater1">
            <%-- ASP.NET Repeater control to repeat a block of content for each item in the data source, with an ID of Repeater1. --%>

                <ItemTemplate>
                <%-- Defines the template for each item in the Repeater control. --%>

                    <div class="items">
                    <%-- Div element with a class "items" to style each product item. --%>

                        <a href="productDetails.aspx?ProductId=<%#Eval("ProductId") %>" class="card">
                        <%-- Anchor element to link to the product details page, passing the ProductId as a query string parameter. The class "card" is used for styling. --%>
                            
                            <img src="product_images/<%#Eval("Image") %>" class="card-img" alt="<%#Eval("Image") %>">
                            <%-- Image element to display the product image, using data binding to set the source and alt attributes from the data source. The class "card-img" is used for styling. --%>
                            
                            <h3 class="card-title"><%#Eval("ProductName") %></h3>
                            <%-- Header element to display the product name, using data binding to set the text from the data source. The class "card-title" is used for styling. --%>
                            
                            <h4 class="price">$<%#Eval("Price") %></h4>
                            <%-- Header element to display the product price, using data binding to set the text from the data source. The class "price" is used for styling. --%>
                        </a>

                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
