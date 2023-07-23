
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Order;
import OrderBuynow.orderBuynow;


public class orderDetail extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         orderBuynow manageOrder = new orderBuynow();

        String action = request.getParameter("action");
        
        String customername = request.getParameter("customername");
        String customerphonenumber = request.getParameter("customerphonenumber");
        String producttype = request.getParameter("producttype");
        String productname = request.getParameter("productname");
        String productbrand = request.getParameter("productbrand");
        String customercountry = request.getParameter("customercountry");
        String customercity = request.getParameter("customercity");
        String customerdistrict = request.getParameter("customerdistrict");
        String customertown = request.getParameter("customertown");
        String customeraddressdetail = request.getParameter("customeraddressdetail");
        
        if(action != null){
            if(action.equals("exit")){

                response.sendRedirect("admin-orderBuynow.jsp");
            }
        }
    }

}
