<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
        <link rel="stylesheet" href="static/style.css">
    </head>
    <body>
        <h1>Using jsp:forward to display user information</h1>
        <jsp:forward page="forwardInfo.jsp" >
            <jsp:param name="uname" value="Syamil Bin Md Noor" />
            <jsp:param name="emai;" value="s76064@ocean.umt.edu.my" />
            <jsp:param name="nationality" value="Malaysia" />
            <jsp:param name="background" value="Student" />
        </jsp:forward>
    </body>
</html>
