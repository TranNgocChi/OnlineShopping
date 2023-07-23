
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import CartItemDAO.cartItemDAO;
import CartDAO.cartDAO;
import Model.CartItem;

public class removeProductInCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("productid");
        int product_id = Integer.parseInt(id);
        int cart_id = Integer.parseInt(request.getParameter("cartid"));
        
        cartDAO manageCart = new cartDAO();
        cartItemDAO manageCartItem = new cartItemDAO();
        
        for(CartItem cartitem : manageCartItem.getAllCartItems()){
            if(cartitem.getProductId() == product_id && cartitem.getCartId() == cart_id){
                cart_id = cartitem.getCartId();
                manageCartItem.deleteCartItem(cart_id);
                manageCart.deleteCart(cart_id);
                response.sendRedirect("cart.jsp");
                break;
            }
        }
        
        
    }

    
}
