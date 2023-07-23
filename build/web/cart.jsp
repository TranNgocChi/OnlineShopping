<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="Model.Cart" %>
<%@ page import="Model.CartItem" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>
<%@ page import="CartItemDAO.cartItemDAO" %>
<%@ page import="CartDAO.cartDAO" %>
<%@ page import="ProductDAO.productDAO" %>
<%@ page import="CustomerDAO.customerDAO" %>
<%@taglib uri="/WEB-INF/tlds/TagCustom.tld" prefix="tag" %>


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
            boolean checkCustomerOfCart = false;
            int discountofshop  = 10;
            int count = 0;
            int customerid = 0;
            int cartid = 0;
            customerDAO manageCustomer = new customerDAO();
            for(Customer customer : manageCustomer.getAllCustomers()){
                if(customer.getName().equals(session.getAttribute("username1"))){
                    customerid = customer.getId();
                    break;
                }
            }
            ArrayList<Integer> listCartID = new ArrayList<>();
            cartDAO manageCart = new cartDAO();
            for (Cart cart : manageCart.getAllCarts()){
                if(customerid == cart.getCustomerId()){
                    listCartID.add(cart.getCartId());
                    checkCustomerOfCart = true;
                }
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < listCartID.size(); i++) {
                if (i > 0) {
                    sb.append(",");
                }
                sb.append(listCartID.get(i));
            }

            String encodedListCartID = sb.toString();
        %>

        <%
            int productid = 0;
            int cartitem_id = 0;
            cartItemDAO manageCartitem = new cartItemDAO();
            productDAO manageProduct  = new productDAO();
            
            String productSize = "";
            
            String productImage = "";
            String productName = "";
            BigDecimal productPrice = new BigDecimal(0);
            int productQuantity = 0;
            BigDecimal subtotal = new BigDecimal(0); 
            BigDecimal total = new BigDecimal(0); 
            
        %>
        
        
        <!-- Cart start -->
        <section id="cart" class="section-p1">
            <table width="100">
                <tag:TagCustom/>
                <style>
                    .center {
                        padding-top: 100px;
                        margin-bottom: -80px;
                        text-align: center;
                        color: orange;
                    .center1 {
                        padding-top: 0px;
                        padding-bottom: 1px;
                        text-align: center;
                        color: orange;
                    }
                </style>
               
                
                    <tbody>
    <% 
    for(CartItem cartitem : manageCartitem.getAllCartItems()){
        for(Integer cart_id : listCartID){     
            if(cart_id == cartitem.getCartId()){
                cartitem_id = cart_id;
                productSize = cartitem.getSize();
                productQuantity = cartitem.getQuantity();
                Product product = manageProduct.findProduct(p -> p.getId() == cartitem.getProductId());
                if(product != null){
                    count ++;
                   productid = product.getId();
                   productImage = product.getImg();
                   productName = product.getName();
                   productPrice = product.getPrice();
                   subtotal = productPrice.multiply(new BigDecimal(productQuantity));
                   total = total.add(subtotal);
                }
                
                if (cartitem_id != 0 && checkCustomerOfCart==true){      
%>

<tr>
    <td><a href="removeProductInCart?productid=<%= productid %>&cartid=<%= cartitem_id %>"><i class="far fa-times-circle"></i></a></td>
    <td><img src="<%= productImage %>" alt=""></td>
    <td><%= productName %></td>
    <td><%= productPrice %></td>
    <td><%= productQuantity %></td>
    <td><%= productSize %></td>
    <td><%= subtotal %></td>
</tr>
<% }else{ manageCartitem.deleteCartItem(cartitem_id);}
}}} %>
</tbody>
            </table>
        </section>
        <!-- Cart end  -->

        <% if (cartitem_id != 0 && checkCustomerOfCart==true){   %>
        <!-- Cart add start -->
        <form method="POST" action="paymentFromCart?count=<%= count %>&total=<%= total %>">
        <section id="cart-add" class="section-p1">
            <div id="subtotal">
                <h3>Cart Totals</h3>
                <table>
                    <tr>
                        <td>Product </td>
                        <td><%= count %></td>
                    </tr>
                    <tr>
                        <td>Subtotal</td>
                        <td><%= total %></td>
                    </tr>
                    <tr>
                        <td>Discount of shop</td>
                        <td><%= discountofshop %></td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong><%= total.subtract(new BigDecimal(discountofshop)) %></strong></td>
                    </tr>
                </table>
                <button class="normal" >Buy now</button>
            </div>
        </section>
        </form>
        <a href="index.jsp" class="cancel-button">Return home page</a>
        <!-- Cart add end -->
        <% } %>
        
        <br><br><br><br><br><br><

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