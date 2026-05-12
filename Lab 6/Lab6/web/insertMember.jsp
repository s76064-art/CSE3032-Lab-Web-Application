<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-5</title>
    </head>
    <body>
        <h1>Marathon Registration</h1>
        <form action="processMarathon.jsp" method="post">
            <label>IC No</label>
            <input type="text" name="icNo" required> 
            <br><br>

            <label>Name</label>
            <input type="text" name="name" required> 
            <br><br>

            <label>Category</label>
            <select name="category">
                <option value="5 KM">5 KM</option>
                <option value="7 KM">7 KM</option>
                <option value="10 KM">10 KM</option>
            </select>
            <br></br>

            <button type="submit">Submit</button>
            <button type="reset">Cancel</button>
        </form>
    </body>
</html>
