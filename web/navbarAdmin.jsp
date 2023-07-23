
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/navbar.css">
    </head>
    <body>
        <section id ="header">
            <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
            <div>
                <ul id="navbar">
                    <%
                    if (session.getAttribute("adminname1") != null) { %>
                    <li><a href="admin.jsp">AdminPage</a></li>
                    <li><a><i class="fas fa-user"></i><%= session.getAttribute("adminname1") %></a></li>
                    <li><a href="logoutAdmin">Logout</a></li>
                    <% } else { %>
                    <li><a href="admin-login.jsp">Login</a></li>
                    <% } %>
                </ul>
            </div>
        </section>
    </body>
</html>
