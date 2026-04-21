<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 4 Task-1</title>
        <link rel="stylesheet" href="static/style.css">

        <%
            final double price = 10.0;

            String custNo = request.getParameter("customerCode");
            String custType = request.getParameter("customerType");

            int quantity = 0;

            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (Exception e) {
                quantity = 0;
            }

            String message = "You're not entitled to any discount";
            double rate = 1;

            if (custType.equals("1") && quantity > 100) {
                message = "You're entitled to 10% discount";
                rate = .9;
            } else if (custType.equals("2") && quantity > 100) {
                message = "You're entitled to 25% discount";
                rate = .75;
            }

            double total = quantity * price * rate;
            String custTypeDisplay = custType.equals("1") ? "Normal Customer" : "Privilege Customer";
        %>
    </head>
    <body>
        <div class="container">
            <h1>Customer Discount Result</h1>

            <div class="card">
                <h2 class="form-title">Transaction Summary</h2>

                <div class="result-grid">

                    <!-- Left Box: Customer Info -->
                    <div class="result-box">
                        <h3>Customer Info</h3>

                        <div class="result-group">
                            <label>Customer Code:</label>
                            <p><%= custNo %></p>
                        </div>

                        <div class="result-group">
                            <label>Customer Type:</label>
                            <p><%= custTypeDisplay %></p>
                        </div>

                        <div class="result-group">
                            <label>Quantity:</label>
                            <p><%= quantity %> units</p>
                        </div>
                    </div>

                    <!-- Right Box: Discount & Total -->
                    <div class="result-box">
                        <h3>Discount Details</h3>

                        <div class="result-group">
                            <label>Unit Price:</label>
                            <p>RM <%= String.format("%.2f", price) %></p>
                        </div>

                        <div class="result-group">
                            <label>Status:</label>
                            <p><%= message %></p>
                        </div>

                        <div class="result-group">
                            <label>Total Amount:</label>
                            <p><strong>RM <%= String.format("%.2f", total) %></strong></p>
                        </div>
                    </div>

                </div>

                <button class="btn-back" onclick="history.back()">&#8592; Back</button>
            </div>
        </div>
    </body>
</html>
