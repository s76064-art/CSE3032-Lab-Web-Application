<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Something went wrong</h1>
        <p>Error: <jsp:expression>exception.getCause() != null && exception.getCause().getMessage() != null
                ? exception.getCause().getMessage()
                : exception.getMessage() != null
                ? exception.getMessage()
                : "An unknown error occurred"</jsp:expression></p>
        <a href="insertStudent.jsp">Go back</a>
    </body>
</html>