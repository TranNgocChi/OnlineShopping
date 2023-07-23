<%@ page import="Model.Customer" %>
<%@ page import="CustomerDAO.customerDAO" %>
<%@ page import="java.util.Objects" %>

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
    <% if (Objects.nonNull(request.getAttribute("errorUser"))) { %>
        <div class="error-user">
            <%= request.getAttribute("errorUser") %>
        </div>
        <style>
        .error-user {
            color: red;
            margin-top: 20px;
            margin-left: 10px;
            }
        </style>
    <% } %>
    
    <%
        String email = "";
        String password = "";
        String phoneNumber = "";
        String country = "";
        String city = "";
        String district = "";
        String town = "";
        String addressDetail="";
        
        customerDAO customerList = new customerDAO();
        String username =  (String) session.getAttribute("username1");
        
        for(Customer customer : customerList.getAllCustomers()){
            if(username.equals(customer.getName())){
                email = customer.getEmail();
                password = customer.getPassword();
                phoneNumber = customer.getPhonenumber();
                country = customer.getCountry();
                city = customer.getCity();
                district = customer.getDistrict();
                town = customer.getWard();
                addressDetail = customer.getDetailaddress();
                break;
            }

        }


        
    %>
  
 

  <form method="POST" action="updateUser">
     
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
    <button class="signin" type="submit" name="action" value="update">
      Update
    </button>
    <button class="signin" type="submit" name="action" value="exit">
      Return home page
    </button>
    <button class="signin" type="submit" name="action" value="cart">
      Return cart
    </button>
  </form>

</div>


    </body>
</html>

