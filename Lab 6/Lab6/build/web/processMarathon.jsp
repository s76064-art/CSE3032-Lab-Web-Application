<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, lab6.com.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-5</title>
    </head>
    <body>
        <jsp:useBean id="myMarathon" class="lab6.com.Marathon" scope="request"/>
        <jsp:setProperty name="myMarathon" property="*"/>

        <%
            Database db = new Database();
            MarathonDAO marathonDAO = new MarathonDAO();

            int result = marathonDAO.addDetails(myMarathon);
            if (result > 0) {
                System.out.println("\t Record succefully added");
                out.println("<p>Record with IC No" + myMarathon.getIcNo() + "</p>");
                out.println("<h3>Details of the record</h3>");
                out.println("<p>IC No: " + myMarathon.getIcNo() + "</p>");
                out.println("<p>Name: " + myMarathon.getName() + "</p>");
                out.println("<p>Category: " + myMarathon.getCategory() + "</p>");
            }
        %>
    </body>
</html>
