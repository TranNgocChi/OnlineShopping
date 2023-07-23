
package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class paymentFromCart extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int count = Integer.parseInt(request.getParameter("count"));
        BigDecimal total = new BigDecimal(request.getParameter("total"));
        response.sendRedirect("payment.jsp?count="+count+ "&total="+total);
    }


}
