<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.InforBMI" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator Web Application</title>
        <link rel="stylesheet" href="static/style.css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                background: #ffffff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            thead {
                background-color: #6f42c1;
                color: white;
            }
            thead th {
                padding: 14px 20px;
                text-align: left;
                font-size: 0.95rem;
                font-weight: 600;
                color: white;
            }
            tbody tr {
                border-bottom: 1px dashed #e0e0e0;
            }
            tbody tr:last-child {
                border-bottom: none;
            }
            tbody tr:hover {
                background-color: #f9f9fb;
            }
            tbody td {
                padding: 12px 20px;
                color: #333;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container">
            <div class="card">
                <h2 class="form-title">BMI Records</h2>

                <%
                    ArrayList<InforBMI> list = (ArrayList<InforBMI>) session.getAttribute("bmiList");
                    if (list == null) {
                        out.print("<p style='color:#555;'>No data available.</p>");
                        return;
                    }
                %>

                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Weight (kg)</th>
                            <th>Height (m)</th>
                            <th>BMI</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 1;
                            for (InforBMI info : list) {
                        %>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%= info.getWeight() %></td>
                            <td><%= info.getHeight() %></td>
                            <td><%= info.getBMI() %></td>
                            <td><%= info.getCategory() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <div class="button-group">
                    <button class="btn-back" onclick="history.back()">Back</button>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp"%>
    </body>
</html>
