

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 4 Task-2</title>
        <link rel="stylesheet" href="static/style.css">

        <%!
            final double USD = .25;
            final double EURO = .21;
            final double JPY = 40;
            final double SGD = .32;

            private double calculateRate(String currency, int amount) {
                double currencyChange = .0;

                if (currency == null) {
                    return currencyChange;
                }

                switch (currency) {
                    case "1":
                        currencyChange = amount * USD;
                        break;
                    case "2":
                        currencyChange = amount * EURO;
                        break;
                    case "3":
                        currencyChange = amount * JPY;
                        break;
                    default:
                        currencyChange = amount * SGD;
                }

                return currencyChange;
            }
        %>

        <%
            String currencyType = request.getParameter("currencyType");
            String amountRaw = request.getParameter("amount");

            int amount = 0;
            double total = 0;

            try {
                if (amountRaw != null) {
                    amount = Integer.parseInt(amountRaw);
                    total = calculateRate(currencyType, amount);
                }
            } catch (Exception e) {
                amount = 0;
            }

            String currencyName = "N/A";
            switch (currencyType) {
                case "1":
                    currencyName = "USD";
                    break;
                case "2":
                    currencyName = "EURO";
                    break;
                case "3":
                    currencyName = "JPY";
                    break;
                default:
                    currencyName = "SGD";
            }
        %>
    </head>
    <body>
        <div class="container">
            <h1>JSP Application Result</h1>

            <div class="card">
                <h2 class="form-title">Currency Conversion Result</h2>

                <div class="result-grid">

                    <!-- Left Box: Customer Info -->
                    <div class="result-box">
                        <h3>Amount in Ringgit Malaysia (RM)</h3>

                        <div class="result-group">
                            <p><%= "RM "+ amount%></p>
                        </div>
                    </div>

                    <!-- Right Box: Discount & Total -->
                    <div class="result-box">
                        <h3>Converted to (<%=currencyName%>)</h3>

                        <div class="result-group">
                            <p><%=total%></p>
                        </div>
                    </div>

                </div>

                <button class="btn-back" onclick="history.back()">&#8592; Back</button>
            </div>
        </div>
    </body>
</html>
