<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-2</title>
    </head>
    <body>
        <h1>Lab 6-Task-2 Perform creating and retrieving records via JSP page</h1>
        <h3>Author Registration</h3>
        <form action="processAuthor.jsp" method="post">
            <label>AuhtorNo</label>
            <input type="text" name="authNo" required minlength="15" maxlength="15"> 
            <br><br>

            <label>Name</label>
            <input type="text" name="name" required> 
            <br><br>

            <label>Address</label>
            <input type="text" name="address" required> 
            <br><br>

            <label>City</label>
            <input type="text" name="city" required> 
            <br><br>

            <label>State</label>
            <input type="text" name="state" required> 
            <br><br>

            <label>Zip</label>
            <input type="text" name="zip" required> 
            <br><br>
            
            <button type="submit">Submit</button>
            <button type="reset">Cancel</button>
        </form>
    </body>
</html>
