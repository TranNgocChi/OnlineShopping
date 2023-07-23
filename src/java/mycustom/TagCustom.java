
package mycustom.tag;


import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import Model.Customer;
import CustomerDAO.customerDAO;
import Model.Cart;
import CartDAO.cartDAO;
import CartItemDAO.cartItemDAO;
import java.io.IOException;
import java.util.ArrayList;


public class TagCustom extends SimpleTagSupport {


    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();

        customerDAO customerdao = new customerDAO();
        cartDAO cartdao = new cartDAO();
        cartItemDAO cartitemdao =new cartItemDAO();
        ArrayList<Integer> countCus = new ArrayList<>();
        ArrayList<Integer> countProduct = new ArrayList<>();
        int count = 0;
        
        for (Customer cus : customerdao.getAllCustomers()) {
            for (Cart cart : cartdao.getAllCarts()) {
                if (cus.getId() == cart.getCustomerId()) {
                      count++;
                }
            }
           
        }
        if(count != 0){
        out.println("<thead>\n" +
"                    <tr>\n" +
"                        <td>Remove</td>\n" +
"                        <td>Image</td>\n" +
"                        <td>Product</td>\n" +
"                        <td>Price</td>\n" +
"                        <td>Quantity</td>\n" +
"                        <td>Size</td>\n" +
"                        <td>Subtotal</td>\n" +
"                    </tr>\n" +
"                </thead>");
        } else out.println("<h2 class=\"center\">No products selected yet</h2>"
                + "<h3 class=\"center1\">Please choose a product</h3>");
               
    }

}