
package CartItemDAO;


import Model.CartItem;
import connectPostgre.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class cartItemDAO implements cartItemInterface{
    List<CartItem> listOfCartItems = new ArrayList<>();
    
    @Override
    public List<CartItem> getAllCartItems() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            String sql = "select * from cartitem";
            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer cartid = res.getInt("cart_id");
                Integer productid = res.getInt("product_id");
                Integer quantity = res.getInt("quantity");
                String size = res.getString("product_size");
                Integer count = res.getInt("product_count");
                
                CartItem cartitem = new CartItem(cartid, productid, quantity, size, count);
                listOfCartItems.add(cartitem);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(cartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfCartItems;
    }

    @Override
    public void addCartItem(int cart_id, int product_id, int quantity, String product_size, int product_count) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO cartitem (cart_id, product_id, quantity, product_size, product_count) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cart_id);
            stmt.setInt(2, product_id);
            stmt.setInt(3, quantity);
            stmt.setString(4, product_size);
            stmt.setInt(5, product_count);

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
    public void updateCartItem(int productid, int quantity, String size, int count, int cartid) {
        Connection cnt = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE cartitem SET product_id = ?, quantity = ?, product_size = ?, product_count = ? WHERE cart_id = ?";

            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);
            stm.setInt(1, productid);
            stm.setInt(2, quantity);
            stm.setString(3, size);
            stm.setInt(4, count);
            stm.setInt(5, cartid);

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
    
    public void editCartItem(int quantity, int productid) {
        Connection cnt = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE cartitem SET quantity = ? WHERE product_id = ?";

            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, productid);

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
    public void deleteCartItem(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from cartitem where cart_id = ?";
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
