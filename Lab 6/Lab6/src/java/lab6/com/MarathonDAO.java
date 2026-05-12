package lab6.com;

import java.sql.*;


public class MarathonDAO {
    private Connection connection;
    private int result = 0;
    
    public MarathonDAO() throws ClassNotFoundException{
        connection = Database.getConnection();
    }
    
    public int addDetails(Marathon marathon){
        try{
            String sql = "INSERT INTO marathon VALUE(?, ?, ?)";
            
            PreparedStatement pstmt = connection.prepareStatement(sql);
            
            pstmt.setString(1, marathon.getIcNo());
            pstmt.setString(2, marathon.getName());
            pstmt.setString(3, marathon.getCategory());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}
