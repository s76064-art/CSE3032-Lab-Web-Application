<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.lab.bean.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Subject</title>
        <link rel="stylesheet" href="style.css">
        <%
            SubjectBean subject = (SubjectBean) request.getAttribute("subject");
        %>
    </head>
    <body>
        <div class="card">
            <h1>Edit Subject</h1>
            <p class="card-subtitle">Update or remove this subject.</p>
            <form action="SubjectServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%=subject.getId()%>">
                <div class="field">
                    <label>Subject Name</label>
                    <input type="text" name="subjectName" value="<%=subject.getSubjectName()%>">
                </div>
                <button type="submit" class="btn-primary">Update</button>
            </form>
            <form action="SubjectServlet" method="post" style="margin-top: 10px;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="subjectId" value="<%=subject.getId()%>">
                <button type="submit" class="btn-danger" style="width:100%">Delete Subject</button>
            </form>
        </div>
    </body>
</html>
