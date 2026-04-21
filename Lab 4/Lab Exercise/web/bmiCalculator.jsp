<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator Web Application</title>
        <link rel="stylesheet" href="static/style.css">
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container">
            <h1>BMI Calculator</h1>
            <form class="card" action="processBMI.jsp">
               
                <div class="form-group">
                    <label for="weight-input">Weight (kg)</label>
                    <input id="weight-input" name="weight" type="number" step=".01" min="0"  required placeholder="[in kg]">
                </div>
                
                <div class="form-group">
                    <label for="height-input">Height (m)</label>
                    <input id="height-input" name="height" type="number" step=".01" min="0"  required placeholder="[in m]">
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-submit" >Submit</button>
                    <button type="reset" class="btn btn-cancel" >Cancel</button>
                </div>

            </form>
        </div>

        <%@include file="footer.jsp"%>
    </body>
</html>
