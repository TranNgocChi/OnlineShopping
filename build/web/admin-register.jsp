<%-- 
    Document   : admin-register
    Created on : Jun 19, 2023, 2:25:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>

<div class="login">
  <a href="../Ecommerce/admin-register.jsp">
    <h2 class="active">Admin Sign up</h2>
  </a>
    
    <% if (Objects.nonNull(request.getAttribute("errorUser"))) { %>
        <div class="error-user">
            <%= request.getAttribute("errorUser") %>
        </div>
    <% } %>
    
    <% if (Objects.nonNull(request.getAttribute("errorPass"))) { %>
        <div class="error-pass">
            <%= request.getAttribute("errorPass") %>
        </div>
    <% } %>
    
     <% if (Objects.nonNull(request.getAttribute("errorCode"))) { %>
        <div class="error-code">
            <%= request.getAttribute("errorCode") %>
        </div>
    <% } %>
        <style>
        .error-user {
            color: red;
            margin-top: 20px;
            margin-left: 10px;
            }
            .error-pass {
            color: red;
            margin-top: 20px;
            margin-left: 10px;
            }
            .error-code {
            color: red;
            margin-top: 20px;
            margin-left: 10px;
            }
        </style>
    
  
  <form method="POST" action="registerAdmin">
    <input type="text" class="text" name="adminname" required>
     <span>admin name</span>
    <br><br>
    <input type="password" class="text" name="adminpassword" required>
    <span>password</span>
    <br><br>
    <input type="password" class="text" name="adminpassword2" required>
    <span>repeat password</span>
    <br><br>
    <input type="email" class="text" name="adminemail" style="color: white" required>
    <span>email</span>
    <br><br>
    <input type="password" class="text" name="admincode" required>
    <span>admin code</span>
    <br>
    
    <button class="signin">
      Sign up
    </button>
    <br>
    <div class="dangki">
      <h5>If you had an account|<a href="../Ecommerce/admin-login.jsp">Login now</a></h5>
      <br>
          <h5><a href="../Ecommerce/index.jsp" style="color: #4caf50; margin-left: -30px">Return home page</a></h5>
    </div>
    
    
  </form>

</div>


<!-- CSS -->
<style>
    

.dangki{
color: black;
margin-top: -20px;
margin-left: 50px;
font-size: 20px;
}
.dangki a{
color: rgba(17, 97, 237, 1);
margin-top: -141px;
margin-left:  168px;

}
.login a h2{
margin-top: -141px;
}
body,
.signin {
background-color: #d3d3d3;
font-family: 'Montserrat', sans-serif;
color: #fff;
font-size: 19px;
letter-spacing: 1px;
justify-content: space-between;
}



.login {
  position: relative;
  height: 630px;
  width: 405px;
  margin: auto;
  padding: 60px 60px;
  background: url(https://picsum.photos/id/1004/5616/3744) no-repeat center center #505050;   
  background-size: cover;
  box-shadow: 0px 30px 60px -5px #000;
}

form {
padding-top: 80px;
}

.active{
margin-top: -10px;
color:rgba(17, 97, 237, 1);
}

.nonactive {
color: rgba(255, 255, 255, 0.2);
}

.login a h2 {
padding-left: 12px;
font-size: 28px;
text-transform: uppercase;
padding-bottom: 5px;
letter-spacing: 2px;
display: inline-block;
font-weight: 100;
}

.login a h2:first-child {
padding-left: 0px;
}

span {
text-transform: uppercase;
font-size: 12px;
opacity: 0.4; 
display: inline-block;
position: relative;
top: -65px;
transition: all 0.5s ease-in-out;
}

.text {
border: none;
width: 100%;
padding: 20px 20px;
display: block;
height: 15px;
border-radius: 20px;
background: rgba(255, 255, 255, 0.1);
border: 2px solid rgba(255, 255, 255, 0);
overflow: hidden;
margin-top: -10px;
transition: all 0.5s ease-in-out;
}

.text:focus {
outline: 0;
border: 2px solid rgba(255, 255, 255, 0.5);
border-radius: 20px;
background: rgba(0, 0, 0, 0);
}

.text:focus + span {
opacity: 0.6;
}

input[type="text"],
input[type="password"] {
font-family: 'Montserrat', sans-serif;
color: #fff!important;
}




input {
display: inline-block;
padding-top: 20px;
font-size: 14px;
}

.login a h2,
span,
.custom-checkbox {
margin-left: 20px;

}

.custom-checkbox {
-webkit-appearance: none;
background-color: rgba(255, 255, 255, 0.1);
padding: 8px;
border-radius: 2px;
display: inline-block;
position: relative;
top: 6px;
}

.custom-checkbox:checked {
background-color: rgba(17, 97, 237, 1);
}

.custom-checkbox:checked:after {
content: '\2714';
font-size: 10px;
position: absolute;
top: 1px;
left: 4px;
color: #fff;
}

.custom-checkbox:focus {
outline: none;
}

.signin {
background-color: #1161ed;
color: #FFF;
width: 100%;
padding: 20px 20px;
display: block;
height: auto;
border-radius: 20px;
margin-top: 30px;
transition: all 0.5s ease-in-out;
border: none;
text-transform: uppercase;
}

.signin:hover {
background: #4082f5;
box-shadow: 0px 4px 35px -5px #4082f5;
cursor: pointer;
}

.signin:focus {
outline: none;
}

hr {
border: 1px solid rgba(255, 255, 255, 0.1);
top: 85px;
position: relative;
}

a {
text-align: center;
display: block;
top: 120px;
position: relative;
text-decoration: none;
color: rgba(255, 255, 255, 0.2);
}


</style>