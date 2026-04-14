<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
            String name = request.getParameter("studentName");
            String matricNo = request.getParameter("matricNo");
            String club = request.getParameter("club");
            

            ArrayList<String[]> students = (ArrayList<String[]>) session.getAttribute("myList");
            if (students == null){
                students = new ArrayList<String[]>();
            }
            
            String[] student ={
                name, matricNo, club
            };
            students.add(student);
            session.setAttribute("myList", students);
        %>
    </head>
    <body>
        <jsp:include page="headerPage.jsp" />
        <h1>
            Register Complete
        </h1>
        
        <div name="profile">
            <h3>Name: <%=name%></h3>
            <h3>Matric No: <%=matricNo%></h3>
            <h3>Club: <%=club%></h3>
        </div>
        
        <a href="clubMemberDirectoryPage.jsp"> Directory</a>
     
        <jsp:include page="footerPage.jsp" />
    </body>
</html>
