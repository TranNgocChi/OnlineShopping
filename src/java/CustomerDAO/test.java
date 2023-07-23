
package CustomerDAO;

import Model.Customer;
import java.util.List;


public class test {

    
    public static void main(String[] args) {
        customerDAO manage = new customerDAO();
        List<Customer> listCustomer = manage.getAllCustomers();

      manage.updateCustomer("ĂDf", "sadfsadf",
             "ĂDf", "ÁDFasdf", "ÁDFasdf",
               "SADfsadf", "SADf", "SADf", "SADf", 1);

//        for(Customer customer : listCustomer ){
//            System.out.println(customer.toString());
//        }
//        
    }
    
}
