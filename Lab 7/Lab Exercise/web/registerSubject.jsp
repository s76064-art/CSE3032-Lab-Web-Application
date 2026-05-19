<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Subject</title>
        <link rel="stylesheet" href="style.css">
        <%
            StudentBean student = (StudentBean) session.getAttribute("loggedUser");
            if (student == null) {
                response.sendRedirect("login.html");
            }
        %>
    </head>
    <body>
        <div class="card">
            <h1>Register Subject</h1>
            <p class="card-subtitle">Enroll in a new subject.</p>
            <span class="badge"><%=student.getMatricNo()%></span>
            <form action="SubjectServlet" method="post">
                <input type="hidden" value="enroll" name="action">
                <div class="field">
                    <label>Subject Name</label>
                    <input type="text" name="subjectName" placeholder="e.g. Web Technology" required>
                </div>
                <button type="submit" class="btn-primary">Enroll</button>
            </form>
        </div>
    </body>
</html>
