package mysql;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
    public static Connection getConnection(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
            String dbID = "user";
            String dbPW = "userpassword";
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
