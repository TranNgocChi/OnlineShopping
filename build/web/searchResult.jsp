<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/feature.css">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/sm-banner.css">    
        <link rel="stylesheet" href="css/banner3.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/shop.css">
    </head>

    <body>
        
        <!-- Navbar start -->
        <jsp:include page="navbar.jsp" />
        <!-- Navbar end -->

        <!-- First main home start-->
        <section id="shop" >
            <form action="SearchController?index=1" method="post">
            <div class="search-bar">
                
                <div class="input-group">
                    <input value="${save}" type="text" class="form-control" name="txtSearch" placeholder="Search by your product name">
                    <div class="input-group-append">
                        <button class="btn btn-secondary" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                    
                </div>
            </div>
            </form>

            <style>
                .search-bar {
                width: 600px;
                height: 39px;
                margin-left: 250px;
                }

                .input-group {
                    position: relative;
                    height: 100%;
                    width: 100%;
                }

                .form-control {
                    height: 100%;
                    border-radius: 0;
                    border-color: #f26522;
                    box-shadow: none;
                    width: calc(100% - 44px); /* Adjust this value to account for the button width */
                }

                .btn-secondary {
                    background-color: #f26522;
                    border-color: #f26522;
                    color: #ffffff;
                    border-radius: 0;
                    height: 100%;
                    width: 44px; /* Adjust this value to set the button width */
                }

                .btn-secondary:hover {
                    background-color: #e44e0e;
                    border-color: #e44e0e;
                }

                .fa-search {
                    color: #ffffff;
                }

                .input-group-append {
                    position: absolute;
                    right: 0;
                    top: 0;
                    height: 100%;
                }
            </style>
            
            <h4>Gau Shopping</h4>
            <h2>Shopping makes happy</h2>
            <h1>Messi is also going shopping</h1>
            <p>Become a handsome boy and a pretty girl</p>
        </section>
        <!-- First main home end-->


        <!-- Product start -->
        <section id="product1" class="section-p1">
            <c:if test="${empty listS}">
                <h2>NOT FOUND PRODUCT</h2>
            </c:if>
                
            <c:if test="${not empty listS}">
                 <h2>PRODUCT FOUND</h2>
            </c:if>
            
            <div class="pro-container">
                <c:forEach var="i" items="${listS}" varStatus="loop">

                    <div class="pro">
                        <a href= "sproduct.jsp?id=${i.getId()}"><img src="${i.getImg()}"></a>
                        <div class="des">
                            <span>${i.getBrand()}</span>
                            <h5>${i.getName()}</h5>
                               <div class="star">
                                <c:forEach var="j" begin="1" step="1" end="${i.getReview()}">   
                                        <i class="fas fa-star"></i>
                                </c:forEach>
                                </div>
                            <h4>${i.getPrice()}</h4>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </section>
        <!-- Product end -->


        <section id="pagination" class="section-p1">
                <c:if test ="${tag > 1}">
                <a href="SearchController?index=${tag-1}&txtSearch=${save}" class="cart"><i class="fas fa-long-arrow-alt-left"></i></a>
                </c:if>
                <c:forEach var="j" begin="1" step="1" end="${endS}">  
                    <a class="${tag == j?"active":""}" href="SearchController?index=${j}&txtSearch=${save}">${j}</a>
                </c:forEach>
                <c:if test ="${tag < endS}">
                <a href="SearchController?index=${tag+1}&txtSearch=${save}" class="cart"><i class="fas fa-long-arrow-alt-right "></i></a>
                </c:if>
        </section>

       <!-- footer start -->
       <jsp:include page="footer.jsp" />
       <!-- footer end -->

        <script src="js/script.js"></script>
    </body>

</html>