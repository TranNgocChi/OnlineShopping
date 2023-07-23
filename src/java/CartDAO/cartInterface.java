
package CartDAO;

import Model.Cart;
import java.util.List;


public interface cartInterface {
    List<Cart> getAllCarts();
    void addCart(int cart_id, int customer_id);
    void updateCart(int customerid, int cartid);
    void deleteCart(Integer id);
}
