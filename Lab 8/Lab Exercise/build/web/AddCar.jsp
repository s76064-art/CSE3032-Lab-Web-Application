<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.model.Car" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Car Management</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <%
            Car car = (Car) request.getAttribute("car");
            String action = "insert";
            if (car != null) {
                action = "update";
            }
        %>
    </head>

    <body>

        <header>
            <nav class="navbar navbar-dark" style="background-color: tomato;">
                <a class="navbar-brand" href="#">Car Management</a>
                <a class="nav-link text-white"
                   href="<%=request.getContextPath()%>/CarServlet?action=display">
                    Cars
                </a>
            </nav>
        </header>

        <br>

        <div class="container col-md-5">

            <div class="card">
                <div class="card-body">

                    <form action="<%=request.getContextPath()%>/CarServlet?action=<%=action%>" method="post">
                        
                        <input type="hidden" value="${car.carId}" name="carId">
                        
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text" name="brand" value="${car.brand != null ? car.brand : ''}">
                        </div>

                        <div class="form-group">
                            <label>Model</label>
                            <input type="text" name="model" value="${car.model != null ? car.model : ''}">
                        </div>

                        <div class="form-group">
                            <label>Cylinder</label>
                            <input type="number" name="cylinder" value="${car != null && car.cylinder != null ? car.cylinder : 0}">
                        </div>

                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" step="0.01" name="price" value="${car != null && car.price != null ? car.price : 0}">
                        </div>

                        <button type="submit"
                                class="btn btn-success">Save
                        </button>

                    </form>

                </div>
            </div>

        </div>

    </body>
</html>