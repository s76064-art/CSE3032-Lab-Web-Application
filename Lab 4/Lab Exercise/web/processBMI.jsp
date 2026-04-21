<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator Web Application</title>
        <link rel="stylesheet" href="static/style.css">


        <%
            String weightStr = (String) request.getParameter("weight");
            String heightStr = (String) request.getParameter("height");

            double weight = 0;
            double height = 0;
            try {
                weight = Double.parseDouble(weightStr);
                height = Double.parseDouble(heightStr);
            } catch (Exception e) {
                System.out.println(e);
            }

            double bmi = 0;
            try {
                bmi = weight / height * height;
            } catch (Exception e) {
                System.out.println(e);
            }

            String category = "Overweigth";
            if (bmi <= 18.5) {
                category = "Underweight";
            } else if (bmi <= 25) {
                category = "Normal";
            }

            String bmiFormatted = String.format("%.2f", bmi);
        %>

        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="weight" value="<%= weight%>" />
            <jsp:param name="height" value="<%= height%>" />
            <jsp:param name="category" value="<%= category%>" />
             <jsp:param name="bmi" value="<%= bmiFormatted %>" />
        </jsp:forward>

    </head>
    <body>
        <h1>If you see this page, then this system is broken.</h1>
    </body>
</html>
