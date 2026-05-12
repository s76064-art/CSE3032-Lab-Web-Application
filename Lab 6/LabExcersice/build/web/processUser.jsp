<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.LabExcersice.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab Exercise 6</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="profile" class="com.LabExcersice.Profile" scope="request"/>
        <jsp:setProperty name="profile" property="*"/>
        
        <%
            ProfileDAO profileDAO = new ProfileDAO();
            boolean success = profileDAO.insertProfile(profile);
        %>
        
        <div class="container">
            <h1><%= success ? "Registration Successful" : "Registration Failed" %></h1>
            
            <% if (success) { %>
                <div class="profile-field">
                    <div class="profile-label">Username</div>
                    <div class="profile-value"><%= profile.getUsername() %></div>
                </div>
                <div class="profile-field">
                    <div class="profile-label">First Name</div>
                    <div class="profile-value"><%= profile.getFirstName() %></div>
                </div>
                <div class="profile-field">
                    <div class="profile-label">Last Name</div>
                    <div class="profile-value"><%= profile.getLastName() %></div>
                </div>
                <a href="login.jsp" class="logout">Proceed to Login</a>
            <% } else { %>
                <div class="error">Unable to register user. Please try again.</div>
                <a href="insertUser.html" class="logout">Go Back</a>
            <% } %>
        </div>
    </body>
</html>
