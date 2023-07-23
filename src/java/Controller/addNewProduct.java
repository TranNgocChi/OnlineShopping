package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Product;
import ProductDAO.productDAO;
import java.math.BigDecimal;

public class addNewProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("product_id"));
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            BigDecimal price= new BigDecimal(request.getParameter("price"));
            int numberof = Integer.parseInt(request.getParameter("numberof"));
            int available = Integer.parseInt(request.getParameter("available"));
            String detail = request.getParameter("detail");
            String image = request.getParameter("image");
            String brand = request.getParameter("brand");
            int review = Integer.parseInt(request.getParameter("review"));

            boolean run = true;
            productDAO manageProduct = new productDAO();

            for(Product product : manageProduct.getAllProducts()){
                if(id == product.getId()){
                    request.setAttribute("errorUser", "Product Id existed!");
                    request.getRequestDispatcher("admin-productUpdate.jsp").forward(request, response);
                    run = false;
                    break;
                }
            }

            if(run){
                manageProduct.addProduct(id, type, name, price, numberof, available, detail, image, brand, review);
                response.sendRedirect("admin-product.jsp");
                return;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorUser", "ID existed");
        }

        request.getRequestDispatcher("admin-productUpdate.jsp").forward(request, response);
    }
}