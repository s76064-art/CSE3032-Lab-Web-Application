<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
    </head>
    <body>
        <jsp:include page="headerPage.jsp" />
        <h1>Directory</h1>
        
        <table>
            <tr>
                <th>Student Name</th>
                <th>Matric No</th>
                <th>Club</th>
            </tr>
            
            <%
                ArrayList<String[]> students = (ArrayList<String[]>)session.getAttribute("myList");
                for (String[] student: students){
                    out.println("<tr>");
                    for (String value: student){
                        out.println("<td>"+value+"</td>");
                    }
                    out.println("</tr>");
                }
            %>
        </table>
        
        <jsp:include page="footerPage.jsp" />
    </body>
</html>
