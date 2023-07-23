<%@page import="Model.Product"%>
<%@page import="ProductDAO.productDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ecommerce </title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/firstMainHome.css">
        <link rel="stylesheet" href="css/feature.css">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/sm-banner.css">    
        <link rel="stylesheet" href="css/banner3.css">
        <link rel="stylesheet" href="css/footer.css">
    </head>

    <body>
        
        <!-- Navbar start -->
        <jsp:include page="navbar.jsp" />
        <!-- Navbar end -->

        <!-- First main home start-->
        <section id="hero">
            <h4>Trade-in-offer</h4>
            <h2>Super value deals</h2>
            <h1>On all products</h1>
            <p>Save more with coupons & up to 70% off!</p>
            <a href="ShopController"><button>Shop now</button></a>
        </section>
        <!-- First main home end-->

        <!-- Feature start -->
        <section id="feature" class="section-p1">
            <div class="fe-box">
                <img src="img/features/f1.png" alt="">
                <h6>Free Shipping</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f2.png" alt="">
                <h6>Online Order</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f3.png" alt="">
                <h6>Save Money</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f4.png" alt="">
                <h6>Promotions</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f5.png" alt="">
                <h6>Happy Sell</h6>
            </div>

        </section>
        <!-- Feature end -->

        <!-- Product start -->
        <section id="product1" class="section-p1">
            <h2>Featured Products</h2>
            <p>Summer Collection New Mordern Design</p>
            <div class="pro-container" >
                <% 
                    int id1 = 0;
                    String imgLink = "";
                    String brand = "";
                    String name = "";
                    int review = 0;
                    BigDecimal price = new BigDecimal(0);
                    productDAO manageProduct = new productDAO();
                    for(Product product: manageProduct.getAllProducts()){
                    
                    if(product.getId() > 2 && product.getId() < 11 && product.getId() != 1){
                        id1 = product.getId();
                       imgLink = product.getImg();
                       brand = product.getBrand();
                       name = product.getName();
                       review = product.getReview();
                       price = product.getPrice();
                %>
                <div class="pro" onclick="window.location.href='sproduct.jsp?id=<%= id1 %>';">
                    <a><img src="<%= imgLink %>"></a>
                    <div class="des">
                        <span><%= brand %></span>
                        <h5><%= name %></h5>
                        <div class="star">
                            <% for (int i = 0; i < review; i++){%>
                            <i class="fas fa-star"></i>
                            <% } %>
                        </div>
                        <h4><%= price %> VND</h4>
                    </div>
                    <a href="#" class="cart"><i class="fas fa-shopping-cart "></i></a>
                </div>
                <% }} %>
            </div>
        </section>
        <!-- Product end -->

        <!-- Banner start -->
        <section id="banner" class="section-m1">
            <h4>Repair Services</h4>
            <h2>Up to <span>70% Off</span>- All t-Shirts & Accessories</h2>
            <button class="normal">Explore More</button>
        </section>
        <!-- Banner end -->

        <!-- New Arrival start -->
        <section id="product1" class="section-p1">
            <h2>New Arrival</h2>
            <p>Summer Collection New Mordern Design</p>
            <div class="pro-container">
                <%
                    int id2 = 0;
                    for(Product product: manageProduct.getAllProducts()){
                    
                    if(product.getId() > 16 && product.getId() < 21 && product.getId() != 1){
                       id2 = product.getId();
                       imgLink = product.getImg();
                       brand = product.getBrand();
                       name = product.getName();
                       review = product.getReview();
                       price = product.getPrice();
                %>
                <div class="pro"  onclick="window.location.href='sproduct.jsp?id=<%= id2 %>';">
                    <a><img src="<%= imgLink %>"></a>
                    <div class="des">
                        <span><%= brand %></span>
                        <h5><%= name %></h5>
                        <div class="star">
                            <% for (int i = 0; i < review; i++){%>
                            <i class="fas fa-star"></i>
                            <% } %>
                        </div>
                        <h4><%= price %> VND</h4>
                    </div>
                    <a href="#" class="cart"><i class="fas fa-shopping-cart "></i></a>
                </div>
                <%}}%>
                
            </div>
        </section>
        <!-- New Arrival end -->

        <!-- Banner 2 start -->
        <section id="sm-banner" class="section-p1">
            <div class="banner-box">
                <h4>Crazy deals</h4>
                <h2>buy 1 get 1 free</h2>
                <span>The best classic dress is on sale</span>
                <button class="white">Learn More</button>
            </div>

            <div class="banner-box banner-box2">
                <h4>spring/summer</h4>
                <h2>upcomming season</h2>
                <span>The best classic dress is on sale</span>
                <button class="white">Collection</button>
            </div>
        </section>
        <!-- Banner 2 end -->

        <!-- Banner 3 start -->
        <section id="banner3">
            <div class="banner-box">
                <h2>SEASONAL SALE</h2>
                <h3>Winter Collection 50%- OFF</h3>
            </div>
            <div class="banner-box banner-box2">
                <h2>NEW FOOTWEAR COLLECTION</h2>
                <h3>SPPRING/SUMMER 2022</h3>
            </div>
            <div class="banner-box banner-box3">
                <h2>T-SHIRTS</h2>
                <h3>New Trendy</h3>
            </div>

        </section>
        <!-- Banner 3 end -->
        
        <!-- footer start -->
       <jsp:include page="footer.jsp" />
       <!-- footer end -->
       
        <script src="js/script.js"></script>
    </body>

</html>