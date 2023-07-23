
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Product;
import Model.Cart;
import Model.Customer;
import Model.CartItem;
import ProductDAO.productDAO;
import CustomerDAO.customerDAO;
import CartItemDAO.cartItemDAO;
import CartDAO.cartDAO;
import java.util.List;
import javax.servlet.http.HttpSession;

public class addToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UniqueRandomGenerator generate = new UniqueRandomGenerator();
        HttpSession session = request.getSession();
        customerDAO manageCustomer = new customerDAO();
        cartDAO manageCart = new cartDAO();
        cartItemDAO cartitemDAO = new cartItemDAO();

        Integer cart_id = generate.generateUniqueRandomNumber(1, 100000);
        int cartid = 0;
        int customer_id = 0;
        for(Customer customer : manageCustomer.getAllCustomers()){
            if(session.getAttribute("username1").equals(customer.getName())){
                customer_id = customer.getId();
                break;
            }
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productSize = request.getParameter("productSize");

        productDAO manageProduct = new productDAO();
        for(Product product:manageProduct.getAllProducts()){
            if(product.getAvailable() < productQuantity){
                response.sendRedirect("error.jsp");
                return;
            }
        }   

        boolean cartExistsForCustomer = false;
        for (Cart cart : manageCart.getAllCarts()) {
            if (cart_id == cart.getCartId() && customer_id == cart.getCustomerId()) {
                cartExistsForCustomer = true;
                break;
            }
        }

        if (!cartExistsForCustomer) {
            manageCart.addCart(cart_id, customer_id);
        }
        
        
        boolean isProductExist = false; // Biến đánh dấu sản phẩm đã tồn tại
        
        List<CartItem> cartitemList = cartitemDAO.getAllCartItems();
        for (CartItem cartitems : cartitemList ) {

            if (cartitems.getProductId() == productId && productSize.equals(cartitems.getSize())) {
                int newQuantity = cartitems.getQuantity() + productQuantity;
                cartitemDAO.updateCartItem(productId, newQuantity, productSize, cartitems.getCount(), cartitems.getCartId());
                if(cart_id != cartitems.getCartId()){
                    manageCart.deleteCart(cart_id);
                }   
                isProductExist = true; // Đánh dấu sản phẩm đã tồn tại
                break;
            }
        }   
        
        
        if (!isProductExist) {
            cartitemDAO.addCartItem(cart_id, productId, productQuantity,productSize,0);
        }
        response.sendRedirect("sproduct.jsp?id="+productId);
        
    }

}
