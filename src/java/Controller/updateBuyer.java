
package Controller;

import CustomerDAO.customerDAO;
import Model.Customer;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateBuyer extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int product_id = Integer.parseInt(request.getParameter("id"));
        String product_size = request.getParameter("selectedSize");
        int product_numberof = Integer.parseInt(request.getParameter("numberof"));
        BigDecimal cartSubtotal = new BigDecimal(request.getParameter("cartTotal"));
        
        HttpSession session = request.getSession();
        customerDAO manageCustomer = new customerDAO();
        
        String user_name =  (String) session.getAttribute("username1");
        int id = 0;
        for(Customer customer : manageCustomer.getAllCustomers()){
            if(user_name.equals(customer.getName())){
                id = customer.getId();
                break;
            }
        }
            
        String action = request.getParameter("action");
        
        if(action != null){
            if(action.equals("updateBuyer")){
                String username_update = request.getParameter("username");
                String email_update = request.getParameter("email");
                String password_update = request.getParameter("password");
                String phone_update = request.getParameter("phonenumber");
                String country_update = request.getParameter("country");
                String city_update = request.getParameter("city");
                String district_update = request.getParameter("district");
                String town_update = request.getParameter("town");
                String addressDetail_update = request.getParameter("addressdetail");
                
                for(Customer customer : manageCustomer.getAllCustomers()){
                    if(customer.getName().equals(username_update)){
                        if(!username_update.equals(user_name)){
                            username_update = user_name;
                            request.setAttribute("errorUser", "Username existed!");
                            request.getRequestDispatcher("profile.jsp").forward(request, response);
                            break;
                        }
                    }
                }
                
                manageCustomer.updateCustomer(username_update, email_update, password_update,
                phone_update,country_update, city_update, district_update,
                town_update, addressDetail_update, id);
                
                request.getSession().setAttribute("username1", username_update);

                response.sendRedirect("paymentBuyNow.jsp?id="+product_id + "&numberof="+product_numberof+"&selectedSize="+product_size+"&cartTotal="+cartSubtotal);

            }else if(action.equals("exitBuyer")){
                response.sendRedirect("paymentBuyNow.jsp?id="+product_id + "&numberof="+product_numberof+"&selectedSize="+product_size+"&cartTotal="+cartSubtotal);

            }
        }
    }

    
}
