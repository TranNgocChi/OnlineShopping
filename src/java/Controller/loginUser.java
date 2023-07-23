
package Controller;

import Model.Customer;
import CustomerDAO.customerDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class loginUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        customerDAO customerdao = new customerDAO();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean isUsernameCorrect = false;
        boolean isPasswordCorrect = false;

        for (Customer customer : customerdao.getAllCustomers()) {
            if (customer.getName().equals(username)) {
                isUsernameCorrect = true;
                if (customer.getPassword().equals(password)) {
                    isPasswordCorrect = true;
                    break;
                }
            }
        }

        if (!isUsernameCorrect) {
            request.setAttribute("error-username", "Wrong Username");
        } else if (!isPasswordCorrect) {
            request.setAttribute("error-password", "Wrong Password");
        } else {
            request.getSession().setAttribute("username1", username);
            response.sendRedirect("index.jsp");
            return;
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
        }


}
