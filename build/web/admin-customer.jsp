<%@page import="java.util.List"%>
<%@ page import="CustomerDAO.customerDAO" %>
<%@ page import="Model.Customer" %>

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
        <jsp:include page="navbarAdmin.jsp" />
        <!-- Navbar end -->

        <% if (session.getAttribute("adminname1") != null) { %>
        <!--start -->
        <section id="cart" class="section-p1">
            <table width="100">
                <thead>
                    <tr>
                        <td>Remove</td>
                        <td>Customer ID</td>
                        <td>Customer Name</td>
                        <td>Customer PhoneNumber</td>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        customerDAO customer = new customerDAO();
                        List<Customer> allCustomers = customer.getAllCustomers();
                        int id;
                        for(Customer cus: allCustomers){
                            id = cus.getId();
                            String name = cus.getName();
                            String phone = cus.getPhonenumber();
                    %>
                    <tr>
                        <td><a href="removeCustomer?id=<%= id %>"><i class="far fa-times-circle"></i></a></td>
                        <td><%= id %></td>
                        <td><a href="admin_profileUser.jsp?name=<%= name %>"><%= name %></a></td>
                        <td><%= phone %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="function">
                <a href="admin-customer_update.jsp"><button type="submit"><i class="fas fa-plus"></i></button></a>
            </div>

        </section>
        <!-- end  -->
        
        

        <!-- footer start -->
       <jsp:include page="footer.jsp" />
       <!-- footer end -->
       <% } %>
        <script src="js/script.js"></script>
    </body>

</html>

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