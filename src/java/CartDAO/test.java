package CartDAO;

import Model.Cart;
import java.util.List;


public class test {
    public static void main(String[] args) {
        cartDAO manage = new cartDAO();
        List<Cart> full = manage.getAllCarts();
//        for(Cart cart : full){
//            System.out.println(cart.toString());
//        }
        manage.deleteCart(14522);

        
    }
}