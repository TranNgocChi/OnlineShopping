
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import CustomerDAO.customerDAO;
import Model.Customer;

public class addCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password= request.getParameter("password");
        String phone = request.getParameter("phonenumber");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String addressDetail = request.getParameter("addressdetail");
        
        boolean run = true;
        customerDAO manageCustomer = new customerDAO();
        
        for(Customer customer : manageCustomer.getAllCustomers()){
            if(customer.getName().equals(username) || customer.getId() == id){
                request.setAttribute("errorUser", "User name or id existed!");
                request.getRequestDispatcher("admin-customer_update.jsp").forward(request, response);
                run = false;
                break;
            }
        }
        
        if(run == true){
            manageCustomer.addCustomer(id, username, email, password, phone, country,
            city, district, town, addressDetail);
            
            response.sendRedirect("admin-customer.jsp");
            return;
        }
        request.getRequestDispatcher("admin-customer_update.jsp").forward(request, response);
    }
}
