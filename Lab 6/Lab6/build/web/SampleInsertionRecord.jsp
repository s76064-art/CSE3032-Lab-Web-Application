<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6</title>
    </head>
    <body>
        <h1>Lab 6 - Task-1 Sample Insertion records into MySql through JSP's page</h1>

        <%
            int result;
            Class.forName("com.mysql.jdbc.Driver");
            out.println("Step 1: MySQL driver loaded...!");
        %>

        <br>

        <%
            String myURL = "jdbc:mysql://localhost:3307/csa3203";
            Connection connection = DriverManager.getConnection(myURL, "root", "");
            out.println("Step 2: Database is connected...!");
        %>

        <br>

        <%
            out.println("Step 3: Prepared statements created...!");
            String sqlInsert = "INSERT INTO FirstTable VALUE(?)";

            PreparedStatement pstmt = connection.prepareStatement(sqlInsert);
        %>

        <%
            out.println("Step 4: Perform insertion of record...!");
            String name = "Max Verstappen";
            pstmt.setString(1, name);

            result = pstmt.executeUpdate();

            if (result > 0) {
        %>
        <br>
        <%
            out.println("Step 5: Close database connection...!");
            out.println(" ");
            out.println("Database connection is closed...!");

            out.println("<p> The record: (" + name + ") is succesfully created...! </p>");
            connection.close();
            }
        %>
    </body>
</html>
