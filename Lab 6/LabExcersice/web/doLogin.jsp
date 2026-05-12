<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.LabExcersice.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab Exercise 6</title>
    </head>
    <body>
        <jsp:useBean id="profile" class="com.LabExcersice.Profile" scope="request"/>
        <jsp:setProperty name="profile" property="*"/>
        
        <%
            ProfileDAO profileDAO = new ProfileDAO();
            Profile newProfile = profileDAO.getProfileByUsername(profile.getUsername());
       
            
            if (newProfile != null && newProfile.getPassword().equals(profile.getPassword())) {
                session.setAttribute("profile", newProfile);
                response.sendRedirect("main.jsp");

            }else{
                 response.sendRedirect("login.jsp?error=1");

            }
        %>
    </body>
</html>
