
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import AdminDAO.adminDAO;
import Model.Admin;


public class registerAdmin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UniqueRandomGenerator generate = new UniqueRandomGenerator();
        adminDAO manageAdmin = new adminDAO();
        
        String name = request.getParameter("adminname");
        String password = request.getParameter("adminpassword");
        String password2 = request.getParameter("adminpassword2");
        String email = request.getParameter("adminemail");
        String code  = request.getParameter("admincode");
        
        for(Admin admin : manageAdmin.getAllAdmins()){
            if(admin.getName().equals(name)){
                request.setAttribute("errorUser", "Adminname existed!");
                request.getRequestDispatcher("admin-register.jsp").forward(request, response);
                break;
            }
        }
        
        if(!password.equals(password2)){
            request.setAttribute("errorPass", "Password not match");
        }
         else if(!code.equals("admin123")){
            request.setAttribute("errorCode", "Wrong code");
        }else{
            manageAdmin.addAdmin(generate.generateUniqueRandomNumber(1, 10000), 
            name, email, password);
            
            request.setAttribute("adminname", name);
            request.setAttribute("adminpassword", password);
            request.setAttribute("role", "admin");
            
            response.sendRedirect("admin-login.jsp");
            return;
        }
        request.getRequestDispatcher("admin-register.jsp").forward(request, response);
        
    }



}
