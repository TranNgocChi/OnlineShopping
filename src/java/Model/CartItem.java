
package Model;


public class CartItem {
    private int cartId;
    private int productId;
    private int quantity;
    private String size;
    private int count;

    public CartItem() {
    }

    public CartItem(int cartId, int productId, int quantity, String size, int count) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.size = size;
        this.count = count;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "CartItem{" + "cartId=" + cartId + ", productId=" + productId + ", quantity=" + quantity + ", size=" + size + ", count=" + count + '}';
    }

    
    
                   
}
