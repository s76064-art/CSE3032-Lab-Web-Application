<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.lab.bean.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subject List</title>
        <link rel="stylesheet" href="style.css">
        <%
            ArrayList<SubjectBean> subjects = (ArrayList<SubjectBean>) request.getAttribute("subjects");
            if (subjects == null) {
                response.sendRedirect("SubjectServlet?action=view");
                return;
            }
        %>
    </head>
    <body>
        <div class="table-wrapper">
            <div class="table-header">
                <h1>List of Subjects</h1>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Subject Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (SubjectBean sb : subjects) {
                    %>
                    <tr>
                        <td><%=sb.getSubjectName()%></td>
                        <td>
                            <button class="btn-secondary"
                                    onclick="location.href = 'SubjectServlet?action=viewUpdate&subjectId=<%=sb.getId()%>'">
                                Edit
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
