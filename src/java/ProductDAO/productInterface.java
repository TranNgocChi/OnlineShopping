
package ProductDAO;

import Model.Product;
import java.math.BigDecimal;
import java.util.List;
import java.util.function.Predicate;

/**
 *
 * @author Admin
 */
public interface productInterface {
    List<Product> getAllProducts();
    void addProduct(int product_id, String product_type, String product_name, 
            BigDecimal product_price, int product_numberof, int product_available,
            String product_detail, String product_img, String product_brand, int product_review);
    void updateProduct(String type, String name, BigDecimal price, int numberof, 
        int available, String detail, String img, String brand, int review, int id);
    void deleteProduct(Integer id);
    Product findProduct(Predicate<Product> p);
}
