<%@page import="java.util.Objects"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add new Customer</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f1f1f1;
    }

    .container {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group select {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-group input[type="submit"] {
      width: auto;
      padding: 8px 20px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-group input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
    <% if (session.getAttribute("adminname1") != null) { %>
  <div class="container">
    <h2>Add Customer</h2>
    <% if (Objects.nonNull(request.getAttribute("errorUser"))) { %>
        <div class="error-user">
            <%= request.getAttribute("errorUser") %>
        </div>
        <style>
        .error-user {
            color: red;
            margin-top: 10px;
            margin-left: 10px;
            }
        </style>
    <% } %>
    <form method="POST" action="addCustomer">
        <br>
        <div class="form-group">
        <label for="name">UserID:</label>
        <input type="text" id="userid" name="id" value="" required>
      </div>
      <div class="form-group">
        <label for="name">Username:</label>
        <input type="text" id="name" name="name" value="" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="" required>
      </div>
      <div class="form-group">
        <label for="phonenumber">Phone Number:</label>
        <input type="text" id="phonenumber" name="phonenumber" value="" required>
      </div>
      <div class="form-group">
        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="" required>
      </div>
      <div class="form-group">
        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="" required>
      </div>
        <div class="form-group">
        <label for="district">District:</label>
        <input type="text" id="district" name="district" value="" required>
      </div>
        <div class="form-group">
        <label for="town">Town:</label>
        <input type="text" id="town" name="town" value="" required>
      </div>
        <div class="form-group">
        <label for="addressdetail">Address Detail:</label>
        <input type="text" id="addressdetail" name="addressdetail" value="" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Add customer">
      </div>
    </form>
  </div>
    <% } %>
</body>
</html>