package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import OrderBuynow.orderBuynow;
import java.math.BigDecimal;
import ProductDAO.productDAO;
import Model.Product;

public class orderBuynowSuccess extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String order = request.getParameter("order");
        if(order != null){
            UniqueRandomGenerator generate = new UniqueRandomGenerator();
            orderBuynow manageOrder = new orderBuynow();
            
            int product_numberof = Integer.parseInt(request.getParameter("product_numberof"));
            String product_size = request.getParameter("product_size");
            BigDecimal total = new BigDecimal(request.getParameter("total"));
            int orderid = generate.generateUniqueRandomNumber(1, 100000);
            int customerid = Integer.parseInt(request.getParameter("customer_id"));
            int productid = Integer.parseInt(request.getParameter("product_id"));
            
             // Update the available quantity
            productDAO productDAO = new productDAO();
            for(Product product: productDAO.getAllProducts()){
                if(productid == product.getId()){
                    int updatedAvailable = product.getAvailable() - product_numberof;
                    product.setAvailable(updatedAvailable);
                    productDAO.updateProduct(product.getType(), product.getName(),
                    product.getPrice(), product.getNumberOf(), updatedAvailable, product.getDetail(),
                    product.getImg(), product.getBrand(), product.getReview(), productid);
                    break;
                }
            }
            
            manageOrder.addOrder(orderid, customerid, productid, product_size, product_numberof, total);
            
            // Redirect browser to "orderSuccess.jsp"
            response.sendRedirect("orderSuccess.jsp");
        }
    }
}