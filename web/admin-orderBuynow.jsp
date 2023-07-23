<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@ page import="OrderBuynow.orderBuynow" %>
<%@ page import="Model.Order" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ordered </title>
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
        <jsp:include page="navbarAdmin.jsp" />
        <!-- Navbar end -->
        
        <% if (session.getAttribute("adminname1") != null) { %>
        <!--start -->
        <section id="cart" class="section-p1">
            <table width="100">
                <thead>
                    <tr>
                        <td>Remove</td>
                        <td>Order ID</td>
                        <td>Order Customer</td>
                        <td>Order Product</td>
                        <td>Order Detail</td>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        orderBuynow orders = new orderBuynow();
                        List<Order> allOrders = orders.getAllOrderBuynow();
                        int orderid, customerid, productid;
                        String size;
                        int quantity;
                        BigDecimal total;
                        for(Order order : allOrders){
                            orderid = order.getOrderId();
                            customerid = order.getCustomerId();
                            productid = order.getProductId();
                            size = order.getSize();
                            quantity = order.getQuantity();
                            total = order.getTotal();
                    %>
                    <tr>
                        <td><a href="removeOrder?id=<%= orderid %>"><i class="far fa-times-circle"></i></a></td>
                        <td><%= orderid %></td>
                        <td><%= customerid %></td>
                        <td><%= productid %></td>
                        <td><a href="ordered.jsp?orderid=<%= orderid %>&customerid=<%= customerid %>&productid=<%= productid %>&size=<%= size %>&quantity=<%= quantity %>&total=<%= total %>">Detail</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <style>
            .function {
        display: flex;
        justify-content:right;
        align-items: center;
        padding: 10px;
        border-radius: 5px;
        margin-top: 10px
        }

        .function button {
            background-color: #088178;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .function button:hover {
            background-color: #065c5c;
        }
        </style>
        </section>
        <!-- Cart end  -->
        <br><br>

        <!-- footer start -->
       <jsp:include page="footer.jsp" />
       <!-- footer end -->
       <% } %>
        <script src="js/script.js"></script>
    </body>

</html>