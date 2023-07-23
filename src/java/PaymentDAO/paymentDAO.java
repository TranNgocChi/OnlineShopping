
package PaymentDAO;

import AdminDAO.adminDAO;
import Model.Payment;
import connectPostgre.DatabaseConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class paymentDAO implements paymentInterface{
    List<Payment> listOfPayments = new ArrayList<>();

    @Override
    public List<Payment> getAllPayments() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            String sql = "select * from payment";
            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer paymentid = res.getInt("payment_id");
                Integer cartid = res.getInt("cart_id");
                Integer customerid = res.getInt("customer_id");
                BigDecimal paymentamount = res.getBigDecimal("payment_amount");
                Date paymentdate = res.getDate("payment_date");
                
                Payment payment = new Payment(paymentid, cartid, customerid,
                        paymentamount, paymentdate);
                listOfPayments.add(payment);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(adminDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfPayments;
    }

    @Override
    public void addPayment(int payment_id, int cart_id, int customer_id, BigDecimal payment_amount, java.sql.Date payment_date) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO payment (payment_id, cart_id, customer_id,"
                    + " payment_amount, payment_date) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, payment_id);
            stmt.setInt(2, cart_id);
            stmt.setInt(3, customer_id);
            stmt.setBigDecimal(4, payment_amount);
            stmt.setDate(5, (java.sql.Date) payment_date);
            
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
    public void updatePayment(int cartid, int customerid, BigDecimal paymentamount, Date paymentdate, int paymentid) {
        Connection cnt = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE payment SET cart_id = ?, customer_id = ?, payment_amount = ?, "
                    + "payment_date = ? WHERE payment_id = ?";

            cnt = DatabaseConnection.getConnection();
            stm = cnt.prepareStatement(sql);
            stm.setInt(1, cartid);
            stm.setInt(2, customerid);
            stm.setBigDecimal(3, paymentamount);
            stm.setDate(4, (java.sql.Date) paymentdate);
            stm.setInt(5, paymentid);

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
    public void deletePayment(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from payment where payment_id = ?";
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
