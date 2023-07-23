
package AdminDAO;

import Model.Admin;
import java.util.List;


public class test {


    public static void main(String[] args) {
        adminDAO manage = new adminDAO();
        List<Admin> listAdmin = manage.getAllAdmins();
        for(Admin admin:listAdmin){
            System.out.println(admin.toString());
        }
//        manage.addAdmin(2, "SADfsdaf", "ÁDfsadf", "SADfasdf");
//
//        manage.updateAdmin("ASDf", "SAdfsad", "QWeqwe", 1);

                
    }
    
}
