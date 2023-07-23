
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import CustomerDAO.customerDAO;


public class removeCustomer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int user_id = Integer.parseInt(id);
        
        customerDAO manageCustomer = new customerDAO();
        
        manageCustomer.deleteCustomer(user_id);
        
        response.sendRedirect("admin-customer.jsp");
    }

}
