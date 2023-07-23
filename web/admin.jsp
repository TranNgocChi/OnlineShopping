
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin</title>
  <link rel="stylesheet" href="css/admin.css">
  <link rel="stylesheet" href="css/navbar.css">
</head>
<body>
    
    <section id ="header">
        <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
        <div>
            <ul id="navbar">
                <%
                if (session.getAttribute("adminname1") != null) { %>
                <li><a href="admin.jsp">AdminPage</a></li>
                <li><a><i class="fas fa-user"></i><%= session.getAttribute("adminname1") %></a></li>
                <li><a href="logoutAdmin">Logout</a></li>

            </ul>
        </div>
    </section>
<!-- Navbar end -->

<div class="container">
    <div class="box">
      <a href="admin-product.jsp">Product</a>
    </div>
    <div class="box">
      <a href="admin-orderBuynow.jsp">Ordered Buynow</a>
    </div>
    <div class="box">
      <a href="admin-customer.jsp">Customer</a>
    </div>
    <div class="box">
      <a href="admin-payment.jsp">Ordered Cart</a>
    </div>
</div>
<% } else { %>
<li><a href="admin-login.jsp">Login</a></li>
<% } %>
   
    
</body>


</html>


<style>
        body {
    background-color: #222;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .box {
    width: 200px;
    height: 200px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
  }

  .box:nth-child(1) {
    background-color: #FF6384;
  }

  .box:nth-child(2) {
    background-color: #36A2EB;
  }

  .box:nth-child(3) {
    background-color: #FFCE56;
  }

  .box:nth-child(4) {
    background-color: red;
  }

  .box:nth-child(5) {
    background-color: green;
  }

  .box a {
    text-decoration: none;
    color: black;
    font-size: 24px;
  }

  .box:hover {
    transform: scale(1.05);
    cursor: pointer;
  }</style>