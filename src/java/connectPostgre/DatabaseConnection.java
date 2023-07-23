package connectPostgre;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseConnection {

    private static final String URL = "jdbc:postgresql://localhost:5432/ecommerce";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "231103";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Connected to PostgreSQL!");
            return connection;
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to connect to PostgreSQL!");
            e.printStackTrace();
        }
        return null;
    }
    
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs)
            throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    public static void main(String[] args) {
        DatabaseConnection.getConnection();
    }
}