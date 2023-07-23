
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import PaymentDAO.paymentDAO;


public class removePayment extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int paymentid = Integer.parseInt(id);
        
        paymentDAO managePayment = new paymentDAO();
        
        managePayment.deletePayment(paymentid);
        
        response.sendRedirect("admin-payment.jsp");
    }

}
