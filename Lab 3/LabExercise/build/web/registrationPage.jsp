<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="headerPage.jsp" />
        <h1>Confirm</h1>
        
        <form method="post" action="processRegistration.jsp">
            <div class="form-group">
                <label>Name: </label>
                <input name="studentName" type="text" required placeholder="Student Name"> 
            </div>
            
            <div class="form-group">
                <label>Matric No: </label>
                <input name="matricNo" type="text" required placeholder="Matric No"> 
            </div>
            
              <div class="form-group">
                <label>Club: </label>
                <select name="club">
                    <option value="Java Warriors">Java Warriors</option>
                    <option value="Explicit Python">Explicit Python</option>
                    <option value="Lua Club">Lua Club</option>
                </select>
            </div>
            
            <button type="submit">Proceed</button>
        </form>
        
        <jsp:include page="footerPage.jsp" />
    </body>
</html>
