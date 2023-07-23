<%-- 
    Document   : admin-login
    Created on : Jun 19, 2023, 2:24:50 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>

<html>
    <head>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="login">
            <a href="../Ecommerce/admin-login.jsp">
              <h2 class="active">Admin Log in</h2>
            </a>
            
        <% if (Objects.nonNull(request.getAttribute("error-adminname"))) { %>
        <div class="error-adminname">
            <%= request.getAttribute("error-adminname") %>
        </div>
        <% } %>
        <% if (Objects.nonNull(request.getAttribute("error-role"))) { %>
        <div class="error-role">
            <%= request.getAttribute("error-role") %>
        </div>
        <% } %>
        <% if (Objects.nonNull(request.getAttribute("error-password"))) { %>
            <div class="error-password">
                <%= request.getAttribute("error-password") %>
            </div>
         <% } %>
        <style>
            .error-adminname {
            color: red;
            margin-top: 30px;
            margin-left: 10px;
            }
            .error-role{
                color: red;
            margin-top: 30px;
            margin-left: 10px;
            }
        .error-password {
            color: red;
            margin-top: 30px;
            margin-left: 10px;
            }
            
        </style>
        

            <br>
            <form method="POST" action="loginAdmin">
              <input type="text" class="text" name="username" required>
               <span>admin name</span>

              <br>

              <br>

              <input type="password" class="text" name="password" required>
              <span>password</span>
              <br>

              <button class="signin">
              Log in
              </button>
              <br>
              <div class="dangki">
                <h5>Haven't had an account|<a href="../Ecommerce/admin-register.jsp">Signup now</a></h5>
                <br>
                <h5><a href="../Ecommerce/index.jsp" style="color: #4caf50; margin-left: -30px">Return home page</a></h5>
              </div>


            </form>

      </div>
</body>

</html>




