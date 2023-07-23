
package AdminDAO;

import Model.Admin;
import java.util.List;


public interface adminInterface {
    List<Admin> getAllAdmins();
    void addAdmin(int admin_id, String admin_name, String admin_email, String admin_password);
    void updateAdmin(String name, String email, String password, Integer id);
    void deleteAdmin(Integer id);
}
