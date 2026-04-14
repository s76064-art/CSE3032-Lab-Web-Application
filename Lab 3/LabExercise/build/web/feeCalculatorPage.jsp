<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="headerPage.jsp" />
        <h1>Fee Calculator</h1>

        <form method="get">
            <div class="form-group">
                <label>Number Of Activities </label>
                <input name="numActivities" type="number" required> 
            </div>
            
            <button type="submit">Calculate</button>        
        </form>
        
        <%
            String numActivities = request.getParameter("numActivities");
            if(numActivities != null){
                int num = Integer.parseInt(numActivities);
                double fee = num*10;
                String formatedText = String.format("%.2f", fee);
                out.println("Total Fee: RM "+formatedText);
            }
        %>

        <jsp:include page="footerPage.jsp" />
    </body>
</html>
