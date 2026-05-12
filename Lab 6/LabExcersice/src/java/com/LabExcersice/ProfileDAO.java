package com.LabExcersice;

import java.sql.*;

public class ProfileDAO {
    private Connection connection;
    
    public ProfileDAO() throws ClassNotFoundException{
        connection = new Database().getDatabase();
    }
    
    public boolean insertProfile(Profile profile) throws SQLException{
        String sql = "INSERT INTO userprofile(username, password, firstname, lastname) VALUE(?, ?, ?, ?)";
        
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, profile.getUsername());
        pstmt.setString(2, profile.getPassword());
        pstmt.setString(3, profile.getFirstName());
        pstmt.setString(4, profile.getLastName());
        
        return pstmt.executeUpdate() > 0;
    }
    
    public Profile getProfileByUsername(String username) throws SQLException{
        String sql = "SELECT * FROM userprofile WHERE BINARY username = ?";
        
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, username);
        
        ResultSet result = pstmt.executeQuery();
        
        Profile profile = null;
        if(result.next()){
            profile = new Profile(
                    result.getString("id"),
                    result.getString("username"),
                    result.getString("password"),
                    result.getString("firstname"),
                    result.getString("lastname")
            );
        }
        
        return profile;
    }
}
