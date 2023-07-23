
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ProductDAO.productDAO;

public class removeProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int product_id = Integer.parseInt(id);
        
        productDAO manageProduct = new productDAO();
        
        manageProduct.deleteProduct(product_id);
        
        response.sendRedirect("admin-product.jsp");
    }

   
}
