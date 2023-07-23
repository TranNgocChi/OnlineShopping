<%@page import="java.util.Objects"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Product</title>
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
    <h2>Add new product</h2>
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
    <form method="POST" action="addNewProduct">
        <br>
        <div class="form-group">
        <label for="name">Product ID:</label>
        <input type="text" id="userid" name="product_id" value="" required>
      </div>
      <div class="form-group">
        <label for="name">Product Type:</label>
        <input type="text" id="name" name="type" value="" required>
      </div>
      <div class="form-group">
        <label for="email">Product Name:</label>
        <input type="text" id="email" name="name" value="" required>
      </div>
      <div class="form-group">
        <label for="password">Product Price:</label>
        <input type="text" id="password" name="price" value="" required>
      </div>
      <div class="form-group">
        <label for="phonenumber">Number Of Bought Products:</label>
        <input type="text" id="phonenumber" name="numberof" value="" required>
      </div>
      <div class="form-group">
        <label for="country">Available Of Product:</label>
        <input type="text" id="country" name="available" value="" required>
      </div>
      <div class="form-group">
        <label for="city">Product Detail:</label>
        <input type="text" id="city" name="detail" value="" max-length=100000 required>
      </div>
        <div class="form-group">
        <label for="district">Product Image Link:</label>
        <input type="text" id="district" name="image" value="" required>
      </div>
        <div class="form-group">
        <label for="town">Product Brand:</label>
        <input type="text" id="town" name="brand" value="" required>
      </div>
        <div class="form-group">
        <label for="addressdetail">Product Review:</label>
        <input type="text" id="addressdetail" name="review" value="" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Add product">
      </div>
    </form>
  </div>
    <% } %>
</body>
</html>