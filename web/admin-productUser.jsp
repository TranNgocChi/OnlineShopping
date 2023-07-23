
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="ProductDAO.productDAO" %>
<%@ page import="Model.Product" %>

<link rel="stylesheet" href="css/signup.css">
<html>
    <head>
        <title>User-Product</title>
    </head>
    <body>
    <div class="login">
        <a href="../Ecommerce/profile.jsp">
          <h2 class="active">All of Products</h2>
        </a>
        
        <%     
    productDAO manageProduct = new productDAO();
    int id =  Integer.parseInt(request.getParameter("id"));
    String type = "";
    String name = "";
    BigDecimal price = new BigDecimal("0");
    int numberof = 0;
    int available = 0;
    String detail = "";
    String imgLink = "";
    String brand = "";
    int review = 0;
    
    
    
    for(Product product : manageProduct.getAllProducts()){
        if(product.getId() == id){
            type = product.getType();
            name = product.getName();
            price = product.getPrice();
            numberof = product.getNumberOf();
            available = product.getAvailable();
            detail = product.getDetail();
            imgLink = product.getImg();
            brand = product.getBrand();
            review = product.getReview();
        }
    }
      
 %>

  <form method="POST" action="updateProduct">
     <input type="hidden" name="id" value="<%= id %>">
    <input type="text" class="text" name="producttype" value="<%= type %>">
     <span>Type</span>
    <br><br>
    <input type="text" class="text" name="productname" value="<%= name %>" >
     <span>Name</span>
    <br><br>
    <input type="text" class="text" name="producprice" value="<%= price %>">
    <span>Price</span>
    <br><br>
    <input type="text" class="text" name="productnumber" value="<%= numberof %>">
    <span>Bought Products</span>
    <br><br>
    <input type="text" class="text" name="productavailable" value="<%= available %>">
    <span>Available Of Products</span>
    <br><br>
    <input type="text" class="text" name="productdetail" value="<%= detail %>" maxlength="1000000">
    <span>Product Detail</span>
    <br><br>
    <input type="text" class="text" name="productimg" value="<%= imgLink %>">
    <span>Product Image Link</span>
    <br><br>
    <input type="text" class="text" name="productbrand" value="<%= brand %>">
    <span>Product Brand</span>
    <br><br>
    <input type="text" class="text" name="productreview" value="<%= review %>">
    <span>Product Review</span>
    <br><br><br><br>
    
    <button class="signin" type="submit" name="action" value="update">
      Update
    </button>
    <button class="signin" type="submit" name="action" value="exit">
      Exit
    </button>
    
  </form>

</div>


    </body>
</html>