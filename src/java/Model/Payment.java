
package Model;

import java.math.BigDecimal;
import java.util.Date;


public class Payment {
    private int id;
    private int cartId;
    private int customerId;
    private BigDecimal paymentAmount;
    private Date paymentDate;

    public Payment() {
    }

    public Payment(int id, int cartId, int customerId, BigDecimal paymentAmount, Date paymentDate) {
        this.id = id;
        this.cartId = cartId;
        this.customerId = customerId;
        this.paymentAmount = paymentAmount;
        this.paymentDate = paymentDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public BigDecimal getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(BigDecimal paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Override
    public String toString() {
        return "Payment{" + "id=" + id + ", cartId=" + cartId + ", customerId=" + customerId + ", paymentAmount=" + paymentAmount + ", paymentDate=" + paymentDate + '}';
    }
    
    
}
