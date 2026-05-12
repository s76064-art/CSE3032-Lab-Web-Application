<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-3</title>
    </head>
    <body>
        <jsp:useBean id="student" class="lab6.com.Student"/>
        <jsp:setProperty name="student" property="*"/>

        <%
            int result;
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/csa3203";
            Connection connection = DriverManager.getConnection(url, "root", "");

            String sql = "INSERT INTO student VALUE (?,?,?)";

            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, student.getStuNo());
            pstmt.setString(2, student.getName());
            pstmt.setString(3, student.getProgram());

            result = pstmt.executeUpdate();

            if (result > 0) {
               out.println("\tRecord successfully added into Student table...!");
                out.println("<p> Record with auhtor no"+student.getStuNo()+" succesfully created..!</p>");
                out.println("<p>Details of record are;</p>");
                out.println("<p>Studen ID: "+student.getStuNo()+"</p>");
                out.println("<p>Name "+student.getName()+"</p>");
                out.println("<p>Program: "+student.getProgram()+"</p>");
            }
            
            connection.close();
        %>
    </body>
</html>
