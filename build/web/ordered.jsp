
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="OrderBuynow.orderBuynow" %>
<%@ page import="CustomerDAO.customerDAO" %>
<%@ page import="ProductDAO.productDAO" %>
<%@ page import="Model.Order" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>



<link rel="stylesheet" href="css/signup.css">
<html>
    <head>
        <title>Ordered</title>
    </head>
    <body>
    <div class="login">
        <a href="../Ecommerce/profile.jsp">
          <h2 class="active">Ordered Information</h2>
        </a>

        <%     
        orderBuynow manageOrer = new orderBuynow();
        productDAO manageProduct = new productDAO();
        customerDAO manageCustomer = new customerDAO();


        HttpSession sessions = request.getSession(); 

        String product_size = "";
        int product_numberof = 0;
        BigDecimal total = new BigDecimal(0);

        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int customerid = Integer.parseInt(request.getParameter("customerid"));
        int productid = Integer.parseInt(request.getParameter("productid"));

        String product_type = "";
        String product_name = "";
        String product_brand = "";

        String customer_name = "";
        String customer_phonenumber = "";
        String customer_country = "";
        String customer_city = "";
        String customer_district = "";
        String customer_town = "";
        String customer_addressdetail = "";

    for(Order order : manageOrer.getAllOrderBuynow()){
        if(order.getOrderId() == orderid){
            customerid = order.getCustomerId();
            productid = order.getProductId();
            product_size = order.getSize();
            product_numberof = order.getQuantity();
            total = order.getTotal();
            break;
        }
    }

    for(Product product : manageProduct.getAllProducts()){
        if(productid == product.getId()){
            product_type = product.getType();
            product_name = product.getName();
            product_brand = product.getBrand();
            break;
        }
    }

    for(Customer customer : manageCustomer.getAllCustomers()){
        if(customerid == customer.getId()){
            customer_name = customer.getName();
            customer_phonenumber = customer.getPhonenumber();
            customer_country = customer.getCountry();
            customer_city = customer.getCity();
            customer_district = customer.getDistrict();
            customer_town = customer.getWard();
            customer_addressdetail = customer.getDetailaddress();
            break;
        }
    }
 %>

  <form method="POST" action="admin-orderBuynow.jsp">
     <input type="hidden" name="id" value="<%= orderid %>">
    <input type="text" class="text" name="customername" value="<%= customer_name %>">
     <span>Customer name</span>
    <br><br>
    <input type="text" class="text" name="customerphonenumber" value="<%= customer_phonenumber %>" >
     <span>Customer Phonenumber</span>
    <br><br>
    <input type="text" class="text" name="producttype" value="<%= product_type %>">
    <span>Product Type</span>
    <br><br>
    <input type="text" class="text" name="productname" value="<%= product_name %>">
    <span>Product Name</span>
    <br><br>
    <input type="text" class="text" name="productbrand" value="<%= product_brand %>">
    <span>Product Brand</span>
    <br><br>
    <input type="text" class="text" name="productsize" value="<%= product_size %>">
    <span>Product Size</span>
    <br><br>
    <input type="text" class="text" name="productbrand" value="<%= product_numberof %>">
    <span>Product Quantity</span>
    <br><br>
    <input type="text" class="text" name="total" value="<%= total %>">
    <span>Total</span>
    <br><br>
    <input type="text" class="text" name="customeraddressdetail" value="<%= customer_country %>,<%= customer_city %>, <%= customer_district %>, <%= customer_town %>,<%= customer_addressdetail %>" maxlength="1000000">
    <span>Customer Addressdetail</span>
    <br><br>

    <br><br><br><br>

    <button class="signin" type="submit" name="action" value="exit">
      Exit
    </button>

  </form>

</div>


    </body>
</html>