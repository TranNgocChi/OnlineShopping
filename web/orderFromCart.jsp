
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>.
<%@ page import="Model.Customer" %>
<%@ page import="CustomerDAO.customerDAO" %>

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
        customerDAO manageCustomer = new customerDAO();

        BigDecimal total = new BigDecimal(request.getParameter("total"));
        int customerid = Integer.parseInt(request.getParameter("customerid"));
    

        String customer_name = "";
        String customer_phonenumber = "";
        String customer_country = "";
        String customer_city = "";
        String customer_district = "";
        String customer_town = "";
        String customer_addressdetail = "";

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

  <form method="POST" action="admin-payment.jsp">
    <input type="text" class="text" name="customername" value="<%= customer_name %>">
     <span>Customer name</span>
    <br><br>
    <input type="text" class="text" name="customerphonenumber" value="<%= customer_phonenumber %>" >
     <span>Customer Phonenumber</span>
    <br><br>
    <input type="text" class="text" name="total" value="<%= total %>">
    <span>Total</span>
    <br><br>
    <input type="text" class="text" name="customeraddressdetail" value="<%= customer_country %>,<%= customer_city %>, <%= customer_district %>, <%= customer_town %>,<%= customer_addressdetail %>" maxlength="1000000">
    <span>Customer Addressdetail</span>
    <br><br>
    <input type="text" class="text" name="date" value="<%= request.getParameter("date") %>">
    <span>Date</span>
    <button class="signin" type="submit" name="action" value="exit">
      Exit
    </button>

  </form>

</div>


    </body>
</html>