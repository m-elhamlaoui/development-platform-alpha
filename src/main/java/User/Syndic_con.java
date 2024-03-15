package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Syndic_con {
    private static Connection conn;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/syndic_db?useSSL=false", "root", "Asmae2003KARMOUCHI");
            System.out.println("Connection successfully...");
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            throw e;
        }
    }
}
