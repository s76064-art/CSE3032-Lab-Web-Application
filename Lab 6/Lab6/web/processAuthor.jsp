<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-2</title>
        
        
    </head>
    <body>
        <h1>Lab 6-Task-2 Perform crating and retrieving records via JSP page</h1>
        <jsp:useBean id="myAuthor" class="lab6.com.Author"/>
        <jsp:setProperty name="myAuthor" property="*"/>

        <%
            int result;
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/csa3203";
            Connection connection = DriverManager.getConnection(url, "root", "");

            String sql = "INSERT INTO author VALUE (?,?,?,?,?,?)";
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, myAuthor.getAuthNo());
            pstmt.setString(2, myAuthor.getName());
            pstmt.setString(3, myAuthor.getAddress());
            pstmt.setString(4, myAuthor.getCity());
            pstmt.setString(5, myAuthor.getState());
            pstmt.setString(6, myAuthor.getZip());
            
            result = pstmt.executeUpdate();
            
            if(result > 0 ){
                out.println("\tRecord successfully added into Author table...!");
                out.println("<p> Record with auhtor no"+myAuthor.getAuthNo()+" succesfully created..!</p>");
                out.println("<p>Details of record are;</p>");
                out.println("<p>Name: "+myAuthor.getName()+"</p>");
                out.println("<p>Address: "+myAuthor.getAddress()+"</p>");
                out.println("<p>City: "+myAuthor.getCity()+"</p>");
                out.println("<p>State "+myAuthor.getState()+"</p>");
                out.println("<p>Zip: "+myAuthor.getZip()+"</p>");
            }
            
            connection.close();

        %>
    </body>
</html>
