<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<%@taglib uri="jakarta.tags.sql" prefix="sql"%>
<%@taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab Exercise</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                display: flex;
                justify-content: center;
                padding: 40px;
            }

            table {
                border-collapse: collapse;
                background-color: #ffffff;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
                width: 700px;
            }

            thead tr {
                background-color: #4a90d9;
                color: white;
            }

            th, td {
                padding: 12px 16px;
                text-align: left;
                border: 1px solid #ddd;
            }

            tbody tr:nth-child(even) {
                background-color: #f0f4f8;
            }

            tbody tr:hover {
                background-color: #dce8f5;
            }
        </style>
    </head>
    <body>
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Salary</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employees}" varStatus="status">
                    <tr>
                        <td><c:out value="${employee.empId}" /></td>
                        <td><c:out value="${employee.name}" /></td>
                        <td><c:out value="${employee.department}" /></td>
                        <td><fmt:formatNumber value="${employee.basicSalary}" minFractionDigits="2" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.basicSalary >= 3000}">Senior</c:when>
                                <c:otherwise>Junior</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
