<%@ page import="java.sql.*" %>   
<%@ page import="java.util.Objects" %>

<link rel="stylesheet" href="css/signup.css">
    <div class="login">
    <a href="../Ecommerce/signup.jsp">
        <h2 class="active"> Sign up</h2>
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
    
    <!-- Xu li loi khi password not match-->
    <div class="error-message" id="password-match-error"></div>
    <style>
        .error-message {
            color: red;
            margin-top: 25px;
            margin-left: 10px;
        }
    </style>
    <script>
        function validateForm() {
          var password = document.forms["signupForm"]["password"].value;
          var confirmPassword = document.forms["signupForm"]["password2"].value;
          var passwordMatchError = document.getElementById("password-match-error");

          
          if (password !== confirmPassword) {
            passwordMatchError.innerText = "Password does not match";
            return false; 
          } else {
            passwordMatchError.innerText = ""; 
            return true; 
          }
        }
      </script>
    <!-- Xu li loi khi password not match-->
    
    <form name="signupForm" method="POST" action="registerUser" onsubmit="return validateForm()">
        <input type="text" class="text" name="username" required>
         <span>username</span>
        <br> <br>
        <input type="email" class="text" name="email" style="color:#fff; " required>
         <span>email</span>
        <br><br>
        <input type="password" class="text" name="password" required>
        <span>password</span>
        <br><br>
        <input type="password" class="text" name="password2" required>
        <span>repeat password</span>
        <br><br>
        <input type="text" class="text" name="phonenumber" required>
        <span>phone number</span>
        <br><br>
        <input type="text" class="text" name="country" required>
        <span>Country</span>
        <br><br>
        <input type="text" class="text" name="city" required>
        <span>City</span>
        <br><br>
        <input type="text" class="text" name="district" required>
        <span>District</span>
        <br><br>
        <input type="text" class="text" name="town" required>
        <span>Town</span>
        <br><br>
        <input type="text" class="text" name="addressdetail" required>
        <span>Address Detail</span>
        <br><br>


        <button class="signin">
          Sign up
        </button>
        <br>
        <div class="dangki">
          <h5>If you had an account|<a href="../Ecommerce/login.jsp">Login now</a></h5>
          <br>
          <h5><a href="../Ecommerce/index.jsp" style="color: #4caf50; margin-left: -30px">Return home page</a></h5>
        </div>
        
    </form>

    </div>

