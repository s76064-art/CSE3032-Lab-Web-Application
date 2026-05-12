<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab-6-Task-3</title>
    </head>
    <body>
        <h1>Student Registration</h1>
        <form method="post" action="processStudent.jsp">
            <label>Student No</label>
            <input type="text" name="stuNo" required> 
            <br><br>

            <label>Name</label>
            <input type="text" name="name" required> 
            <br><br>

            <label>Program</label>
            <select name="program">
                <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                <option value="BSc. with IM">BSc. with IM</option>
                <option value="BSc. in Networking">BSc. in Networking</option>
                <option value="BSc. in Robotics">BSc. in Robotics</option>
            </select>
            <br></br>


            <button type="submit">Submit</button>
            <button type="reset">Cancel</button>
        </form>
    </body>
</html>
