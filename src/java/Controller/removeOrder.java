
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import OrderBuynow.orderBuynow;


public class removeOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int order_id = Integer.parseInt(id);
        
        orderBuynow manageOrder = new orderBuynow();
        
        manageOrder.deleteOrder(order_id);
        
        response.sendRedirect("admin-orderBuynow.jsp");
    }
}
