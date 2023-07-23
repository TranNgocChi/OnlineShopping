package PaymentDAO;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;


public class test {

    public static void main(String[] args) {
        String dateString = "2023-07-10"; // Example date string
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = null;

        try {
            date = dateFormat.parse(dateString);
        } catch (java.text.ParseException e) {
            System.out.println(e);
        }

        paymentDAO managePayment = new paymentDAO();
        System.out.println(""+ new java.sql.Date(date.getTime()));
        managePayment.addPayment(3, 124, 1, new BigDecimal(3), new java.sql.Date(date.getTime()));
    }

}