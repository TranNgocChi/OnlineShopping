
package CartItemDAO;

import Model.CartItem;
import java.util.List;


public class test {
    public static void main(String[] args) {
        cartItemDAO manage = new cartItemDAO();
        List<CartItem> full = manage.getAllCartItems();
        for(CartItem cartitem : full){
            System.out.println(cartitem.toString());
        }
        manage.updateCartItem(6, 3, "V", 0, 1);

        
    }
}