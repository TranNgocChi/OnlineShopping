<%@page import="java.util.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@ page import="PaymentDAO.paymentDAO" %>
<%@ page import="Model.Payment" %>


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
                        <td>Payment ID</td>
                        <td>Payment Customer</td>
                        <td>Payment Date</td>
                        <td>Payment Detail</td>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        paymentDAO payments = new paymentDAO();
                        List<Payment> allPayments = payments.getAllPayments();
                        int paymentid, customerid;
                        Date date;
                        BigDecimal total;
                        for(Payment payment : allPayments){
                            paymentid = payment.getId();
                            customerid = payment.getCustomerId();
                            date = payment.getPaymentDate();
                            total = payment.getPaymentAmount();
                            
                    %>
                    <tr>
                        <td><a href="removePayment?id=<%= paymentid %>"><i class="far fa-times-circle"></i></a></td>
                        <td><%= paymentid %></td>
                        <td><%= customerid %></td>
                        <td><%= date %></td>
                        <td><a href="orderFromCart.jsp?customerid=<%= customerid %>&total=<%= total %>&date=<%= date %>">Detail</a></td>
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