
package PaymentDAO;

import Model.Payment;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public interface paymentInterface {
    List<Payment> getAllPayments();
    void addPayment(int payment_id, int cart_id, int customer_id, BigDecimal payment_amount,
            java.sql.Date payment_date);
    void updatePayment(int cartid, int customerid, BigDecimal paymentamount,
            Date paymentdate, int paymentid);
    void deletePayment(Integer id);
}
