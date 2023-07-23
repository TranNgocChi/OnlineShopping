<%@ page import="java.util.Objects" %>

<link rel="stylesheet" href="css/login.css">

<div class="login">
  <a href="../Ecommerce/login.jsp">
    <h2 class="active"> Log in</h2>
  </a>

    <% if (Objects.nonNull(request.getAttribute("error-username"))) { %>
        <div class="error-username">
            <%= request.getAttribute("error-username") %>
        </div>
        <style>
        .error-username {
            color: red;
            margin-top: 30px;
            margin-left: 10px;
            }
        </style>
    <% } %>
    <% if (Objects.nonNull(request.getAttribute("error-password"))) { %>
        <div class="error-password">
            <%= request.getAttribute("error-password") %>
        </div>
        <style>
        .error-password {
            color: red;
            margin-top: 30px;
            margin-left: 10px;
            }
        </style>
    <% } %>
 
  <br>
  <form method="POST" action="loginUser">
    <input type="text" class="text" name="username" required>
     <span>username</span>

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
      <h5>Haven't had an account|<a href="../Ecommerce/signup.jsp">Signup now</a></h5>
      <br>
    <h5><a href="../Ecommerce/index.jsp" style="color: #4caf50; margin-left: -30px">Return home page</a></h5>
    </div>
    
  </form>

</div>


