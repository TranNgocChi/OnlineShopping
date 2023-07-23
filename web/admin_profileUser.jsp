
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="CustomerDAO.customerDAO" %>
<%@ page import="Model.Customer" %>

<link rel="stylesheet" href="css/signup.css">
<html>
    <head>
        <title>User-Profile</title>
    </head>
    <body>
    <div class="login">
        <a href="../Ecommerce/profile.jsp">
          <h2 class="active">Profile</h2>
        </a>
        
        <%     
    customerDAO manageCustomer = new customerDAO();
    String username =  request.getParameter("name");
    String email = "";
    String password = "";
    String phoneNumber = "";
    String country = "";
    String city = "";
    String district = "";
    String town = "";
    String addressDetail = "";
    
    
    for(Customer customer: manageCustomer.getAllCustomers()){
        if(username.equals(customer.getName())){
            email = customer.getEmail();
            password = customer.getPassword();
            phoneNumber = customer.getPhonenumber();
            country = customer.getCountry();
            city = customer.getCity();
            district = customer.getDistrict();
            town = customer.getWard();
            addressDetail = customer.getDetailaddress();
        }
    }
      
 %>

  <form method="POST" action="../Ecommerce/admin-customer.jsp">
     
    <input type="text" class="text" name="username" value="<%= username %>">
     <span>username</span>
    <br><br>
    <input type="text" class="text" name="email" value="<%= email %>" >
     <span>email</span>
    <br><br>
    <input type="password" class="text" name="password" value="<%= password %>">
    <span>password</span>
    <br><br>
    <input type="text" class="text" name="phonenumber" value="<%= phoneNumber %>">
    <span>phone number</span>
    <br><br>
    <input type="text" class="text" name="country" value="<%= country %>">
    <span>Country</span>
    <br><br>
    <input type="text" class="text" name="city" value="<%= city %>">
    <span>City</span>
    <br><br>
    <input type="text" class="text" name="district" value="<%= district %>">
    <span>District</span>
    <br><br>
    <input type="text" class="text" name="town" value="<%= town %>">
    <span>Town</span>
    <br><br>
    <input type="text" class="text" name="addressdetail" value="<%= addressDetail %>">
    <span>Address Detail</span>
    <br><br><br><br>
    <button class="signin" type="submit" name="action" value="exit">
      Exit
    </button>
    
  </form>

</div>


    </body>
</html>