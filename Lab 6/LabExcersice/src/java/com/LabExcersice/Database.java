package com.LabExcersice;

import java.sql.*;

public class Database {

    private Connection connection;
    private String url = "jdbc:mysql://localhost:3307/csa3203";

    public Connection getDatabase() throws ClassNotFoundException {
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
