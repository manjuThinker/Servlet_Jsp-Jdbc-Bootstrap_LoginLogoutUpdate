package blog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/jdbc";
                String user = "root";
                String password = "root";
                con = DriverManager.getConnection(url, user, password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }

}
