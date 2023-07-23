
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ProductDAO.productDAO;
import java.math.BigDecimal;


public class updateProduct extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        productDAO manageProduct = new productDAO();

        String action = request.getParameter("action");
        
        if(action != null){
            if(action.equals("update")){
                int id =  Integer.parseInt(request.getParameter("id"));
                String type =  request.getParameter("producttype");
                String name =  request.getParameter("productname");
                BigDecimal price =  new BigDecimal(request.getParameter("producprice"));
                int numberof =  Integer.parseInt(request.getParameter("productnumber"));
                int available =  Integer.parseInt(request.getParameter("productavailable"));
                String detail =  request.getParameter("productdetail");
                String imgLink =  request.getParameter("productimg");
                String brand =  request.getParameter("productbrand");
                int review =  Integer.parseInt(request.getParameter("productreview"));
                
                manageProduct.updateProduct(type, name, price, numberof, available, detail, imgLink, brand, review, id);
                

                response.sendRedirect("admin-productUser.jsp?id="+id);
            }else if(action.equals("exit")){
                response.sendRedirect("admin-product.jsp");
            }
        }
    }


}
