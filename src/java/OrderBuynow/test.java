
package OrderBuynow;

import Model.Order;
import java.math.BigDecimal;
import java.util.List;


public class test {
    public static void main(String[] args) {
        orderBuynow manage = new orderBuynow();
        List<Order> full = manage.getAllOrderBuynow();
        for(Order order : full){
            System.out.println(order.toString());
        }
//        manage.addOrder(10, 1243, 6, "X", 2, new BigDecimal(2));
//        manage.deleteOrder(10);
        
        

    }
    
    
}
