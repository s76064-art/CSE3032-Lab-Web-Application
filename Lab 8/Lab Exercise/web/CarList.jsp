<%@ page language="java" contentType="text/html;
         charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList, com.model.Car" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Car</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <%
            ArrayList<Car> cars = (ArrayList<Car>) request.getAttribute("cars");
            if (cars == null) {
                response.sendRedirect(request.getContextPath() + "/CarServlet?action=display");
            }

        %>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark"
                 style="background-color: tomato">
                <div>
                    <a href="" class="navbar-brand"> Car </a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/CarList.jsp"
                           class="nav-link">Cars</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Employees</h3>
                <hr>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/AddCar.jsp" class="btn btn-success">Add Cars</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cylinder</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car"
                                   items="${cars}">
                            <tr>
                                <td><c:out value="${car.carId}"
                                       /></td>
                                <td><c:out value="${car.brand}"
                                       /></td>
                                <td><c:out value="${car.model}"
                                       /></td>
                                <td><c:out value="${car.cylinder}"
                                       /></td>
                                <td><c:out value="${car.price}"
                                       /></td>

                                <td>
                                    <form action="<%=request.getContextPath()%>/CarServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="showEdit">
                                        <input type="hidden" name="carId" value="${car.carId}">
                                        <button type="submit">Edit</button>
                                    </form>

                                    <form action="<%=request.getContextPath()%>/CarServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="carId" value="${car.carId}">
                                        <button type="submit">Delete</button>
                                    </form>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
