
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import AdminDAO.adminDAO;
import Model.Admin;


public class loginAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adminDAO manageAdmin = new adminDAO();
        
        String adminname = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean isUsernameCorrect = false;
        boolean isPasswordCorrect = false;
        
        for (Admin admin : manageAdmin.getAllAdmins()) {
            
            if (admin.getName().equals(adminname)) {
                isUsernameCorrect = true;
                if (admin.getPassword().equals(password)) {
                    isPasswordCorrect = true;
                    break;
                }
            }
        }

        if (!isUsernameCorrect) {
            request.setAttribute("error-adminname", "Wrong Adminname");
        } else if (!isPasswordCorrect) {
            request.setAttribute("error-password", "Wrong Password");
        }else {
            request.getSession().setAttribute("adminname1", adminname);
            response.sendRedirect("admin.jsp");
            return;
        }
        request.getRequestDispatcher("admin-login.jsp").forward(request, response);
        }

}
