package com.lab.dao;

import java.sql.*;
import com.lab.model.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    //MySQL information
    private String jdbcURL = "jdbc:mysql://localhost:3307/CSE3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    //Get connection
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            return conn;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    //Add product to MySQL
    public void addProduct(Product product) {
        String sql = "INSERT INTO product (name, category, price, quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //Prepare sql
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());

            //Add product
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Get product based on ID
    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM product WHERE id =  ?";

        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            //Get query result
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                //Extract query result
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                //Return product
                return new Product(id, name, category, price, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    
    //Retrieve all products from MySQL
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            
            //Iterate through every record
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                //Add every product into a list
                products.add(new Product(id, name, category, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    //Update exisiting record into MySQL
    public boolean updateProduct(Product product) {
        boolean rowUpdated = false;
        String sql = "UPDATE product SET name = ?, category = ?, price = ?, quantity = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());
            pstmt.setInt(5, product.getId());
            
            //Update existing record and return true if succesfully update MySQL
            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return rowUpdated;
    }
    
    //Remove record from MySQL
    public boolean deleteProduct(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM product WHERE id = ?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            
            //Delete record and return true if success
            rowDeleted = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

}
