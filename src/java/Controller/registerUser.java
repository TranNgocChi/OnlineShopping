/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import CustomerDAO.customerDAO;
import Model.Customer;
import javax.servlet.http.HttpSession;


public class registerUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        customerDAO customerdao = new customerDAO();
        UniqueRandomGenerator generate = new UniqueRandomGenerator();
        
        int id = generate.generateUniqueRandomNumber(1,100000);
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String phonenumber = request.getParameter("phonenumber");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String addressdetail = request.getParameter("addressdetail");
        
        for(Customer customer : customerdao.getAllCustomers()){
            if(customer.getName().equals(username)){
                request.setAttribute("errorUser", "Username existed!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                break;
            }
        }
        
        if(password.equals(password2)){
            
            customerdao.addCustomer(id,username, email,
            password, phonenumber,country, city,
            district, town, addressdetail);
            
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("userid", id);
            session.setAttribute("role", "user");
           
            response.sendRedirect("login.jsp");

        }
    }
}
