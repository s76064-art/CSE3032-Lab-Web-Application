<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
        <link rel="stylesheet" href="static/style.css">

        <%
            String name = request.getParameter("uname");
            String email = request.getParameter("email");
            String nationality = request.getParameter("nationality");
            String background = request.getParameter("background");
        %>
    </head>
    <body>
        <div class="container">
            <h1>using jsp:forward to display user info</h1>
            <div class="card">
                <h2 class="form-title">Forwared Info</h2>
                <div class="result-grid">
                    <div class="result-box">
                        <p>Name: <%= name%></p>
                        <p>Email: <%= email%></p>
                        <p>Nationality: <%= nationality%></p>
                        <p>Background: <%= background%></p>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
