<%@page import="Model.Product"%>
<%@page import="ProductDAO.productDAO"%>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping </title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/firstMainHome.css">
        <link rel="stylesheet" href="css/feature.css">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/sm-banner.css">    
        <link rel="stylesheet" href="css/banner3.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/shop.css">
        <link rel="stylesheet" href="css/cart.css">
    </head>

    <body>
        
        <!-- Navbar start -->
        <jsp:include page="navbar.jsp" />
        <!-- Navbar end -->
        
        <%
            int discountOfShop = 10;
            int id = Integer.parseInt(request.getParameter("id"));
            String img = "";
            String name = "";
            BigDecimal price = new BigDecimal(0);
            String size = request.getParameter("selectedSize");
            int numberof = Integer.parseInt(request.getParameter("numberof"));
        
            productDAO manageProduct = new productDAO();
            for(Product product : manageProduct.getAllProducts()){
                if(id == product.getId()){
                    img = product.getImg();
                    name = product.getName();
                    price = product.getPrice();
                }
            }
            BigDecimal subtotal = new BigDecimal(numberof) .multiply(price).subtract(new BigDecimal(discountOfShop));
        %>

        <!-- Cart start -->
        <section id="cart" class="section-p1">
            <table width="100">
                <thead>
                    <tr>
                        <td>Product ID</td>
                        <td>Image</td>
                        <td>Product</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Size</td>
                        <td>Subtotal</td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= id %></td>
                        <td><img src="<%= img %>" alt=""></td>
                        <td><%= name %></td>
                        <td><%= price %></td>
                        <td><%= numberof %></td>
                        <td><%= size %></td>
                        <td><%= new BigDecimal(numberof) .multiply(price) %></td>
                    </tr>

                </tbody>
            </table>
        </section>
        <!-- Cart end  -->

        <!-- Cart add start -->
        <form method="POST" action="paymentBuyNow.jsp?id=<%= id %>&numberof=<%= numberof%>&selectedSize=<%= size %>&cartTotal=<%= subtotal %>">
            <section id="cart-add" class="section-p1">
                <div id="subtotal">
                    <h3>Cart Totals</h3>
                    <table>
                        <tr>
                            <td>Product</td>
                            <td><%= name %></td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><%= numberof %></td>
                        </tr>
                        <tr>
                            <td>Size</td>
                            <td><%= size %></td>
                        </tr>
                        <tr>
                            <td>Total Of Product</td>
                            <td><%= new BigDecimal(numberof) .multiply(price) %></td>
                        </tr>
                        <tr>
                            <td>Discount Of Shop</td>
                            <td><%= discountOfShop %></td>
                        </tr>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td><strong><%= subtotal %></strong></td>
                        </tr>
                    </table>
                    <button class="normal">Buy now</button>
                </div>        
            </section>
        </form>            
        <a href="sproduct.jsp?id=<%= id %>" class="cancel-button">Cancel</a>
        <br><br>
        <!-- Cart add end -->
        

        <!-- footer start -->
       <jsp:include page="footer.jsp" />
       <!-- footer end -->

        <script src="js/script.js"></script>
    </body>

</html>

<style>
    .cancel-button {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 500px;
        height: 50px;
        background-color: #36A2EB;
        color: #ffffff;
        font-size: 16px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
        margin-left: 365px;
        margin-top: -70px;
    }

    .cancel-button:hover {
        background-color: #cc0000;
    }
</style>