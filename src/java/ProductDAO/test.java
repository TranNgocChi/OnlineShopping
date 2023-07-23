
package ProductDAO;

import Model.Product;
import java.math.BigDecimal;
import java.util.List;


public class test {

    public static void main(String[] args) {
        productDAO manage = new productDAO();

        
//
//        List<Product> arr = manage.getAllProducts();
//        for(Product product: arr){
//            System.out.println(product.toString());
//        }
//        
        System.out.println(manage.findProduct(p -> p.getId() == 5).toString());
    }
    
}
