<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="shopCart.aspx.cs" Inherits="allure_bliss_shop.Cart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="products-sec">
        <h1 class="title c-title"> Cart </h1>
        <div class="cart-box">
            <div class="cart">
                <%-- Label for displaying messages or errors --%>
                <asp:Label ID="MessageLabel" runat="server" CssClass="info"></asp:Label>
                
                <%-- Table displaying cart items --%>
                <table class="table w-75 mx-auto">
                    <thead>
                        <tr>
                            <%-- Table headers for the cart items --%>
                            <th></th> <%-- Empty header for images --%>
                            <th class="cart-h">Name</th> <%-- Column header for product names --%>
                            <th class="cart-h">Price</th> <%-- Column header for product prices --%>
                            <th class="cart-h">Quantity</th> <%-- Column header for product quantities --%>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Repeater control to dynamically display cart items --%>
                        <asp:Repeater ID="CartRepeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%-- Hidden fields for storing price and quantity --%>
                                        <asp:HiddenField ID="PriceHidden" runat="server" Value='<%# Eval("Price") %>' />
                                        <%-- Product image --%>
                                        <img src='product_images/<%# Eval("Image") %>' alt="Product Image" class="img-fluid" />
                                        <asp:HiddenField ID="QuantityHidden" runat="server" Value='1' />
                                    </td>
                                    <%-- Product details --%>
                                    <td><%# Eval("ProductName") %></td>
                                    <td>$<%# Eval("Price") %></td>
                                    <td>1</td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <%-- Row for displaying total price --%>
                            <th colspan="2">Total </th>
                            <td colspan="1">$<asp:Label ID="TotalLabel" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <%-- Footer with buttons for emptying the cart and placing the order --%>
                            <th colspan="2"><asp:Button ID="EmptyCartButton" runat="server" CssClass="btn" OnClick="EmptyCartButton_Click" Text="Empty Cart" /></th>
                            <th colspan="1"><asp:Button ID="PlaceOrderButton" runat="server" CssClass="btn" Text="Place Order" OnClick="PlaceOrderButton_Click" /></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
</asp:Content>
