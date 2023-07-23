
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order success</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/navbar.css">
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        
        <h1>Order placed successfully!</h1>
        
        <h1 style="color: #4caf50;">Thank you for trusting and purchasing from us</h1>
        <br><br>
        <a class="return" href="index.jsp">Return home page</a>
        <style>
            h1 {
              color: #36A2EB; /* Màu chữ */
              font-size: 24px; /* Kích thước chữ */
              font-weight: bold; /* Độ đậm chữ */
              text-align: center; /* Căn giữa nội dung */
              margin-top: 20px; /* Khoảng cách từ trên xuống */
            }
            .return{
                color:chocolate;
                text-decoration: none; /* Remove the underline */
                font-weight: bold; 
                font-weight: 700;
                margin-left: 520px;
            }
            .return:hover {
                text-decoration: underline; 
            }
          </style>
          <br><br><br><br><br><br>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
