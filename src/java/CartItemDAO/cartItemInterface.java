
package CartItemDAO;

import Model.CartItem;
import java.util.List;


public interface cartItemInterface {
    List<CartItem> getAllCartItems();
    void addCartItem(int cart_id, int product_id, int quantity, String size, int count);
    void updateCartItem(int productid, int quantity, String size, int count, int cartid);
    void deleteCartItem(Integer id);
}
