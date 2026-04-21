<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action</title>
        <link rel="stylesheet" href="static/style.css">

        <%
            String sCode = "CSE3023";
            String sSubject = "Web-based Application Development";
            String sCredit = "3(2+!)";
        %>

    </head>
    <body>
        <div class="container">
            <h1>Using jsp:include and jsp:param to display information</h1>
            <div class="card">
                <h2 class="form-title">Calling SubjectInfo.jsp</h2>
                <jsp:include page="subjectInfo.jsp" flush="true">
                    <jsp:param name="code" value="<%= sCode%>"/>
                    <jsp:param name="subject" value="<%= sSubject%>"/>
                    <jsp:param name="credit" value="<%= sCredit%>"/>
                </jsp:include>
            </div>
        </div>





    </body>
</html>
