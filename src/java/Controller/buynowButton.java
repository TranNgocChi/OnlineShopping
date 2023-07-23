
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Product;
import ProductDAO.productDAO;
import java.math.BigDecimal;


public class buynowButton extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String img = "";
        String name = "";
        BigDecimal price = new BigDecimal(0);
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("numberof"));
        productDAO manageProduct = new productDAO();
        for(Product product : manageProduct.getAllProducts()){
            if(id == product.getId()){
                img = product.getImg();
                name = product.getName();
                price = product.getPrice();
            }
        }
        BigDecimal subtotal = new BigDecimal(quantity).multiply(price);
        request.setAttribute("id", id);
        request.setAttribute("img", img);
        request.setAttribute("name", name);
        request.setAttribute("price", price);
        request.setAttribute("size", size);
        request.setAttribute("quantity", quantity);
        request.setAttribute("subtotal", subtotal);
        
        request.getRequestDispatcher("sproduct.jsp").forward(request, response);
        
    }

   
}
