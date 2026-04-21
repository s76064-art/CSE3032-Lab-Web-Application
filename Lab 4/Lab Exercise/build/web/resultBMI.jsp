<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.InforBMI" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator Web Application</title>
        <link rel="stylesheet" href="static/style.css">

        <%
            String weight = request.getParameter("weight");
            String height = request.getParameter("height");
            String bmi = request.getParameter("bmi");
            String category = request.getParameter("category");

            if (weight == null) {
                weight = "0";
                height = "0";
                bmi = "0";
                category = "Underweight";
            } else {
                //Save session
                ArrayList<InforBMI> bmiList = (ArrayList<InforBMI>) session.getAttribute("bmiList");
                if (bmiList == null) {
                    bmiList = new ArrayList<InforBMI>();
                }

                InforBMI info = new InforBMI(weight, height, bmi, category);
                bmiList.add(info);

                session.setAttribute("bmiList", bmiList);
            }

        %>


    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container">
            <h1>Result </h1>
            <div class="card">

                <div class="result-grid">

                    <div class="result-box">
                        <h3>Info</h3>

                        <div class="result-group">
                            <label>Weight</label>
                            <p><%=weight%></p>
                        </div>

                        <div class="result-group">
                            <label>Height</label>
                            <p><%=height%></p>
                        </div>

                    </div>

                    <div class="result-box">
                        <h3>Result</h3>

                        <div class="result-group">
                            <label>BMI</label>
                            <p><%= bmi%></p>
                        </div>

                        <div class="result-group">
                            <label>Category</label>
                            <p><%= category%></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <%@include file="footer.jsp"%>
    </body>
</html>
