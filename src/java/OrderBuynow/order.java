
package OrderBuynow;

import Model.Order;
import java.math.BigDecimal;
import java.util.List;


public interface order {
    List<Order> getAllOrderBuynow();
    void addOrder(int orderid, int customerid, int productid, String size, int quantity, BigDecimal total);
    void deleteOrder(Integer id);
}
