<%-- 
    Document   : check
    Created on : Jul 1, 2023, 5:23:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int numberof = 1; // Default value

    if (request.getParameter("numberof") != null) {
        try {
            numberof = Integer.parseInt(request.getParameter("numberof"));
        } catch (NumberFormatException e) {
            out.println(e);
        }
    }
%>

<input name="numberof" type="number" value="<%= numberof %>" id="quantityInput">

<h1 id="displayNumber"></h1>

<script>
    var quantityInput = document.getElementById("quantityInput");
    var displayNumber = document.getElementById("displayNumber");

    quantityInput.addEventListener("input", function() {
        displayNumber.innerText = quantityInput.value;
    });
</script>