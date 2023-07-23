
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import PaymentDAO.paymentDAO;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;



@WebServlet(name = "orderByCartSuccess", urlPatterns = {"/orderByCartSuccess"})
public class orderByCartSuccess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        UniqueRandomGenerator generate = new UniqueRandomGenerator();
        
        Date date = null;
        int payment_id = generate.generateUniqueRandomNumber(1, 100000);
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        BigDecimal total = new BigDecimal(request.getParameter("total"));
        String currentdate = request.getParameter("currentdate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       
        try {
            date = dateFormat.parse(currentdate);
        } catch (java.text.ParseException e) {
            System.out.println(e);
        }
        
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    
        paymentDAO managePayment = new paymentDAO();
        managePayment.addPayment(payment_id, 1, customer_id, total, sqlDate);
        
        response.sendRedirect("orderSuccess.jsp");
    }

}
