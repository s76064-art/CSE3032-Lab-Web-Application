package lab6.com;

import java.sql.*;

public class Database {

    private static Connection connection;
    private static String url = "jdbc:mysql://localhost:3307/csa3203";

    public static Connection getConnection() throws ClassNotFoundException {
        if (connection != null) {
            return connection;
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, "root", "");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return connection;
    }
    
    public void close() throws ClassNotFoundException{
        try{
            connection.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
