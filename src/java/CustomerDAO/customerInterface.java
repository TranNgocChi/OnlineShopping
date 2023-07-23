
package CustomerDAO;

import Model.Customer;
import java.util.List;


public interface customerInterface {
    List<Customer> getAllCustomers();
    void addCustomer(int customer_id, String customer_username, String customer_email,
    String customer_password, String customer_phonenumber, String customer_country,
    String customer_city, String customer_district, String customer_town, String customer_detailaddress);
    void updateCustomer(String username, String email, String password, String phonenumber, 
    String country, String city, String district, String town, String detailaddress, int id);
    void deleteCustomer(Integer id);
}
