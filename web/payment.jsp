<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="Model.Product" %>
<%@page import="ProductDAO.productDAO" %>
<%@page import="Model.Customer" %>
<%@page import="CustomerDAO.customerDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordering </title>
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
    
    <!-- Cart start -->
    <%
        String cartIDs = request.getParameter("listCartID");
        ArrayList<Integer> listCartID = new ArrayList<>();

        if (cartIDs != null && !cartIDs.isEmpty()) {
            String[] idStrings = cartIDs.split(",");
            for (String idString : idStrings) {
                try {
                    int id = Integer.parseInt(idString.trim());
                    listCartID.add(id);
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
            }
        }
        
        int shipping = 10;
        int discountOfCara = 10;
        
        int customer_id = 0;
        String customer_name = "";
        String customer_email = "";
        String customer_phonenumber = "";
        String customer_country = "";
        String customer_city = "";
        String customer_district = "";
        String customer_town = "";
        String customer_addressdetail = "";
        
        String product_name = "";
        
        BigDecimal product_price = new BigDecimal("0");
        BigDecimal cartTotal= new BigDecimal(request.getParameter("total"));
        BigDecimal total = new BigDecimal("0");
        
        
        if(session.getAttribute("username1") != null){
            customerDAO manageCustomer = new customerDAO();
            productDAO manageProduct = new productDAO();
            
            for(Customer customer : manageCustomer.getAllCustomers()){
                if(customer.getName().equals(session.getAttribute("username1"))){
                    customer_id = customer.getId();
                    customer_name = customer.getName();
                    customer_email = customer.getEmail();
                    customer_phonenumber = customer.getPhonenumber();
                    customer_country = customer.getCountry();
                    customer_city = customer.getCity();
                    customer_district = customer.getDistrict();
                    customer_town = customer.getWard();
                    customer_addressdetail = customer.getDetailaddress();
                    break;
                }
            }
        }
        total = cartTotal.add(new BigDecimal(shipping)).subtract(new BigDecimal(discountOfCara));
    %>
    <section id="cart" class="section-p1">
        <table width="100">
            <thead>
                <tr>
                    <td>Country</td>
                    <td>City</td>
                    <td>District</td>
                    <td>Town </td>
                    <td>Detail</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= customer_country %></td>
                    <td><%= customer_city %></td>
                    <td><%= customer_district %></td>
                    <td><%= customer_town %></td>
                    <td><%= customer_addressdetail %></td>
                    
                </tr>
            </tbody>
        </table>
        
    </section>
    <!-- Cart end  -->
<%
   Date currentDate = new Date();
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
   String formattedDate = dateFormat.format(currentDate);
%>
    
    <form method="POST" action="orderByCartSuccess">
        <input type="hidden" name="customer_id" value="<%= customer_id %>" />
        <input type="hidden" name="total" value="<%= total %>" />
        <input type="hidden" name="currentdate" value="<%= formattedDate %>">
        <section id="cart-add" class="section-p1">
            <div id="subtotal">
                <h3>Payment </h3>
                <table>
                    <tr>
                        <td>Customer Name</td>
                        <td><%= customer_name %></td>
                    </tr>
                    <tr>
                        <td>Customer Email</td>
                        <td><%= customer_email %></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><%= customer_phonenumber %></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><%= request.getParameter("count") %></td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td><%= shipping %></td>
                    </tr>
                    <tr>
                        <td>Discount Of Cara</td>
                        <td><%= discountOfCara %></td>
                    </tr>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td><%= cartTotal %></td>
                    </tr>

                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong><%= total  %></strong></td>
                    </tr>
                </table>
                <button class="normal" type="submit" name="order">Order</button>
            </div>
        </section>
    </form>
    <a href="cart.jsp" class="cancel-button">Cancel</a>
    <br><br>
    <div class="function">
        <h4 style="color: #36A2EB; margin-right: 10px;">Edit your information</h4>
        <a href="profile.jsp"><button><i class="fas fa-edit"></i></button></a>
    </div>
    <br>
    
    

    <!-- Footer start -->
    <jsp:include page="footer.jsp" />
    <!-- Footer end -->
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
        margin-right: 150px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .function button:hover {
        background-color: #065c5c;
    }
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