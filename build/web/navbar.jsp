<%@ page import="java.util.Objects" %>
<%@ page import="Model.Cart" %>
<%@ page import="Model.Customer" %>
<%@ page import="CartDAO.cartDAO" %>
<%@ page import="CustomerDAO.customerDAO" %>

<!-- Navbar start -->
<section id="login">
    <% 
        int customerid=0;
        customerDAO manageCustomer = new customerDAO();
        for(Customer customer : manageCustomer.getAllCustomers()){
            if(customer.getName().equals(session.getAttribute("username1"))){
            customerid = customer.getId();
            break;
            }
        }
        int count = 0;
        String link = "";
        cartDAO manageCart = new cartDAO();
        if (session.getAttribute("username1") != null) {
        for(Cart cart : manageCart.getAllCarts()){
            if( cart.getCustomerId() == customerid){
                count ++;
            }
        }
    %>
        
        <h4><a href="profile.jsp"><i class="fas fa-user"></i><%= session.getAttribute("username1") %></a></h4>
        <h4><a href="logoutUser">Logout</a></h4>
    <% link = "admin-login.jsp";} else { %>
        <h4><a href="login.jsp">Login</a></h4>
    <% link = "login.jsp";} %>
</section>
<!-- Navbar end -->

<section id ="header">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
    <div>
        <ul id="navbar">
            <li><a href="index.jsp" <% if (request.getRequestURI().endsWith("index.jsp")) { %>class="active"<% } %>>Home</a></li>
            <li><a href="ShopController" <% if (request.getRequestURI().endsWith("shop.jsp")) { %>class="active"<% } %>>Shop</a></li>
            <li><a href="blog.jsp" <% if (request.getRequestURI().endsWith("blog.jsp")) { %>class="active"<% } %>>Blog</a></li>
            <li><a href="about.jsp" <% if (request.getRequestURI().endsWith("about.jsp")) { %>class="active"<% } %>>About</a></li>
            <% String checklogin_user = ""; if (session.getAttribute("username1") != null){
                checklogin_user = "cart.jsp";
            }else{
                checklogin_user = "login.jsp";
                }

            %>
            <li><a href="<%= checklogin_user %>"<% if (request.getRequestURI().endsWith("cart.jsp")) { %>class="active"<% } %>>
                    <i class="fas fa-shopping-cart"></i>
                    <span class="cart-count"><%= count %></span>
                </a>
            </li>
            
        </ul>
    </div>
</section>
<!-- Navbar end -->

<style>
 .cart-icon {
  position: relative;
  display: inline-block;
}

.cart-count {
  position: absolute;
  top: -12px;
  right: 7px;
  background-color: red;
  color: white;
  border-radius: 50%;
  padding: 4px;
  font-size: 10px;
}

.cart-icon:before {
  content: "";
  position: absolute;
  top: -10px;
  right: -10px;
  width: 10px;
  height: 10px;
  background-color: red;
  border-radius: 50%;
  z-index: -1;
}
</style>