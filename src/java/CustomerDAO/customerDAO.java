
package CustomerDAO;

import Model.Customer;
import connectPostgre.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class customerDAO implements customerInterface{
    List<Customer> listofCustomers = new ArrayList<>();
    
    @Override
    public List<Customer> getAllCustomers() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            String sql = "select * from customer";
            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("customer_id");
                String username = res.getString("customer_username");
                String email = res.getString("customer_email");
                String password = res.getString("customer_password");
                String phonenumber = res.getString("customer_phonenumber");
                String country = res.getString("customer_country");
                String city = res.getString("customer_city");
                String district = res.getString("customer_district");
                String town = res.getString("customer_town");
                String detailaddress = res.getString("customer_detailaddress");
                Customer customer = new Customer(id, username, email, password,
                phonenumber, country, city, district, town, detailaddress);
                listofCustomers.add(customer);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listofCustomers;
    }

    @Override
    public void addCustomer(int customer_id, String customer_username, String customer_email,
        String customer_password, String customer_phonenumber, String customer_country,
        String customer_city, String customer_district, String customer_town, 
        String customer_detailaddress) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO customer (customer_id, customer_username, customer_email,"
                    + " customer_password, customer_phonenumber, customer_country,"
                    + "customer_city, customer_district, customer_town, customer_detailaddress)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, customer_id);
            stmt.setString(2, customer_username);
            stmt.setString(3, customer_email);
            stmt.setString(4, customer_password);
            stmt.setString(5, customer_phonenumber);
            stmt.setString(6, customer_country);
            stmt.setString(7, customer_city);
            stmt.setString(8, customer_district);
            stmt.setString(9, customer_town);
            stmt.setString(10, customer_detailaddress);
            stmt.executeUpdate();
            System.out.println("Inserted successfully!");

        } catch (SQLException e) {
            System.out.println("Error occurred while inserting: " + e.getMessage());
        } finally {
            try {
                
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }

            } catch (SQLException e) {
                System.out.println("Error occurred while closing database resources: " + e.getMessage());
            }
        }
    }

    @Override
    public void updateCustomer(String username, String email, String password, String phonenumber, 
    String country, String city, String district, String town, String detailaddress, int id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE customer SET customer_username = ?, customer_email = ?,"
                    + " customer_password = ?, customer_phonenumber = ?,"
                    + "customer_country = ?, customer_city = ?,"
                    + "customer_district = ?, customer_town = ?,"
                    + "customer_detailaddress = ? WHERE customer_id = ?";

            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, email);
            stm.setString(3, password);
            stm.setString(4, phonenumber);
            stm.setString(5, country);
            stm.setString(6, city);
            stm.setString(7, district);
            stm.setString(8, town);
            stm.setString(9, detailaddress);
            stm.setInt(10, id);

            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Updated successfully.");
            } else {
                System.out.println("Not found with the provided ID.");
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while updating: " + e.getMessage());
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (cnt != null) {
                    cnt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteCustomer(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from customer where customer_id = ?";
            cnt = DatabaseConnection.getConnection();
            cnt.setAutoCommit(false);
            stm = cnt.prepareStatement(sql);
            stm.setInt(1,id);
            stm.executeUpdate();
            cnt.commit();
            System.err.println("Delete!");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            try{
                cnt.rollback();
            }catch(SQLException e1){
                e1.printStackTrace();
            }
        }finally{
            try{
                if (cnt != null){
                   cnt.close();
               }
               if (stm != null){
                   stm.close();
               }
            }catch(Exception e2){
                e2.printStackTrace();
            }
        }
    }
    
}
