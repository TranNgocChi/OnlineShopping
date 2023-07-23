
package OrderBuynow;

import Model.Order;
import connectPostgre.DatabaseConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class orderBuynow implements order{
    List<Order> listOfOrders = new ArrayList<>();
    @Override
    public List<Order> getAllOrderBuynow() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            String sql = "select * from orderbuynow";
            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer orderid = res.getInt("order_id");
                Integer customerid = res.getInt("customer_id");
                Integer productid = res.getInt("product_id");
                String size = res.getString("size");
                Integer quantity = res.getInt("quantity");
                BigDecimal total = res.getBigDecimal("total");
                Order order = new Order(orderid, customerid, productid, size, quantity, total);
                listOfOrders.add(order);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(orderBuynow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfOrders;
    }

    @Override
    public void addOrder(int orderid, int customerid, int productid, String size, int quantity, BigDecimal total) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO orderbuynow (order_id, customer_id, product_id, size, quantity, total) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderid);
            stmt.setInt(2, customerid);
            stmt.setInt(3, productid);
            stmt.setString(4, size);
            stmt.setInt(5, quantity);
            stmt.setBigDecimal(6, total);
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
    public void deleteOrder(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from orderbuynow where order_id = ?";
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
