<%@page import="Model.Product" %>
<%@page import="ProductDAO.productDAO" %>
<%@page import="java.math.BigDecimal"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping </title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/sm-banner.css">    
        <link rel="stylesheet" href="css/banner3.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/shop.css">
        <link rel="stylesheet" href="css/sproduct.css">
    </head>

    <body>
        
        <!-- Navbar start -->
       <jsp:include page="navbar.jsp" />
        <!-- Navbar end -->
        <%
                int id = Integer.parseInt(request.getParameter("id"));
                String img = "";
                String type = "";
                String name = "";
                BigDecimal price = new BigDecimal(0);
                int available = 0;
                String detail = "";
                productDAO manageProduct = new productDAO();
                for(Product product : manageProduct.getAllProducts()){
                    if(id == product.getId()){
                        img = product.getImg();
                        type = product.getType();
                        name = product.getName();
                        price = product.getPrice();
                        available = product.getAvailable();
                        detail = product.getDetail();
                    }
                }
                
        %>

        <section id="prodetails" class="section-p1">
            <div class="single-pro-image">
                <img src="<%= img %>" width="100%" height="100%" id="MainImg" alt="">
            </div>
            
            <div class="single-pro-details">
                <h6><%= type %></h6>
                <h4><%= name %></h4>
                <h2><%= price %> $</h2>
 
               <%
                    String selectedSize = "S"; 
                    int numberof = 1;

                    if (request.getParameter("size") != null) {
                        selectedSize = request.getParameter("size");
                    }


                    if (request.getParameter("numberof") != null) {
                        try {
                            numberof = Integer.parseInt(request.getParameter("numberof"));
                        } catch (NumberFormatException e) {
                            out.println(e);
                        }
                    }
                %>
                <select onchange="updateH1Value(this)" >
                    <option value="" style="display: none;"></option>
                    <option value="S" selected>S</option>
                    <option value="M">M</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
                    <option value="XXXL">XXXL</option>
                </select>
                <h6 type="hidden" name="size" id="selectedSize" style="display: none;"></h6>
                <h6 type="hidden" id="selectedSizeH2" style="display: none;"></h6>


                <input name="numberof" type="number" value="<%= numberof %>" onblur="updateNumberof()">
                
                <% if(session.getAttribute("username1") != null){ %>
                <a id="buyNowLink" href="cartBuyNow.jsp?id=<%= id %>&selectedSize=<%= selectedSize %>&numberof=<%= numberof %>">
                    <button class="normal">Buy now</button>
                </a>
                    
                <form id="addToCartForm" method="POST" action="addToCart">
                    <input type="hidden" name="productId" value="<%= id %>">
                    <input type="hidden" name="productQuantity" id="productQuantity" value="<%= numberof %>">
                    <input type="hidden" name="productSize" id="productSize" value="<%= selectedSize %>">
                    
                    <button class="normal">Add To Cart</button>
                </form>
                    <style>
                        form {
                            position: relative;
                            top: -47px;
                            left: 200px;
                          }
                    </style>
                <% }else{ %>
                <a href="login.jsp"><button class="normal" name="action" value="buynow">Buy now</button></a>
                <a href="login.jsp"><button class="normal" name="action" value="addToCart">Add To Cart</button></a>
                <% } %>
                <h4>Number of products available: <%= available  %></h4>
                <h4>Product Details</h4>
                <span><%= detail %></span>
            </div>
            
        </section>
   
        
        <!-- Footer start -->
        <jsp:include page="footer.jsp" />
        <!-- Footer end -->
        
        <script src="js/script.js"></script>
    </body>

</html>

<script>
    function updateH1Value(selectElement) {
        var selectedValue = selectElement.value;
        document.getElementById("selectedSize").innerText = selectedValue;
        document.getElementById("selectedSizeH2").innerText = selectedValue;
        document.getElementById("productSize").value = selectedValue;
        updateBuyNowLink(); // G?i hàm ?? c?p nh?t link Buy now
    }

    function updateNumberof() {
        var numberofInput = document.getElementsByName("numberof")[0];
        var selectedSize = document.getElementById("selectedSize").innerText;
        if (selectedSize === "") {
            selectedSize = "S";
            document.getElementById("selectedSize").innerText = selectedSize;
            document.getElementById("selectedSizeH2").innerText = selectedSize;
        }
        document.getElementById("productQuantity").value = numberofInput.value;
        updateBuyNowLink();

    } 

    function updateBuyNowLink() {
        var selectedSize = document.getElementById("selectedSize").innerText;
        var numberofInput = document.getElementsByName("numberof")[0].value;
        var buyNowLink = document.getElementById("buyNowLink");
        var href = "cartBuyNow.jsp?id=<%= id %>&selectedSize=" + selectedSize + "&numberof=" + numberofInput;
        buyNowLink.href = href;
    }     

</script>