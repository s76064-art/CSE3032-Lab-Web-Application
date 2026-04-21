<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Information</title>
        <link rel="stylesheet" href="static/style.css">
        
    </head>
    <body>
        <p>Code: <%= request.getParameter("code")%> </p>
        <p>Subject <%= request.getParameter("subject")%> </p>
        <p>Credit <%= request.getParameter("credit")%> </p>
    </body>
</html>
