
package Model;

import java.math.BigDecimal;


public class Order {
    private int orderId;
    private int customerId;
    private int productId;
    private String size;
    private int quantity;
    private BigDecimal total;

    public Order() {
    }

    public Order(int orderId, int customerId, int productId, String size, int quantity, BigDecimal total) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
        this.total = total;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customerId=" + customerId + ", productId=" + productId + ", size=" + size + ", quantity=" + quantity + ", total=" + total + '}';
    }
    
    
    
    
    
}
