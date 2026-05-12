<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.LabExcersice.Profile"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Lab Exercise 6</title>
    </head>
    <body>
        <%
            Profile profile = (Profile) session.getAttribute("profile");
            if (profile == null) {
                response.sendRedirect("login.jsp?error=2");

            } else {
                profile.getFirstName();
            }
        %>
        <div class="container">
            <h1>Profile</h1>
            <div class="profile-field">
                <div class="profile-label">Username</div>
                <div class="profile-value"><%=profile.getUsername()%></div>
            </div>
            <div class="profile-field">
                <div class="profile-label">First Name</div>
                <div class="profile-value"><%=profile.getFirstName()%></div>
            </div>
            <div class="profile-field">
                <div class="profile-label">Last Name</div>
                <div class="profile-value"><%=profile.getLastName()%></div>
            </div>
            <a href="login.jsp" class="logout">Logout</a>
        </div>
    </body>
</html>
