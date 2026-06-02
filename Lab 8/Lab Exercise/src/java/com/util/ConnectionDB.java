package com.util;

import java.sql.*;

public class ConnectionDB {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3307/carshop";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "";

    Connection connection;
    
    public ConnectionDB(){
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Failed to connect to database: " + e.getMessage(), e);
        }
    }
    
    public Connection getConnection(){
        return connection;
    }
}
