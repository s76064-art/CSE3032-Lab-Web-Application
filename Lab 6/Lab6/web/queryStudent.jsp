<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-3</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            
            String url = "jdbc:mysql://localhost:3307/csa3203";
            Connection connection = DriverManager.getConnection(url, "root", "");
           
            String sql = "SELECT * FROM student";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            
            ResultSet result = pstmt.executeQuery();
        %>
        
        
        <table>
            <thead>
                <tr>
                    <th>Matric No</th>
                    <th>Name</th>
                    <th>Program</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while(result.next()){
                        out.println("<tr>");
                        out.println("<td>"+result.getString("stuid")+"</td>");
                        out.println("<td>"+result.getString("stuname")+"</td>");
                        out.println("<td>"+result.getString("stuprogram")+"</td>");
                        out.println("</tr>");
                    }
                    
                    connection.close();
                %>
            </tbody>
        </table>
    </body>
</html>
