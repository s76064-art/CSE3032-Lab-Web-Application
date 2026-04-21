<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 4 Task-5</title>
        <link rel="stylesheet" href="static/style.css">
        <%
            String icno = request.getParameter("ic");
            String name = request.getParameter("name");
            String coverage = request.getParameter("coverageType");
            String ncdStr = request.getParameter("ncdType");

            double price = 0;
            double ncd = 0;

            try {
                price = Double.parseDouble(request.getParameter("marketPrice"));
                ncd = Double.parseDouble(ncdStr);
                System.out.println("success");
            } catch (Exception e) {
                System.out.println(e);
                price = 0;
                ncd = 0;
            }

            double rate = 0;
            String coverageDisplay = "";

            if ("1".equals(coverage)) {
                rate = .03;
                coverageDisplay = "Third Party";
            } else {
                rate = .05;
                coverageDisplay = "Comprehensive";
            }

            double insurance = price * rate;

            double discount = insurance * ncd;
            double afterNCD = insurance - discount;

            double sst = afterNCD * .08;
            double finalAmount = afterNCD + sst;
        %>
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation Result </h1>
            <div class="card">

                <div class="result-grid">

                    <div class="result-box">
                        <h3>Info</h3>

                        <div class="result-group">
                            <label>IC No</label>
                            <p><%=icno%></p>
                        </div>

                        <div class="result-group">
                            <label>Name</label>
                            <p><%=name%></p>
                        </div>

                        <div class="result-group">
                            <label>Market Price (RM)</label>
                            <p><%=String.format("%.2f", price)%></p>
                        </div>

                        <div class="result-group">
                            <label>Coverage Type</label>
                            <p><%=coverageDisplay%></p>
                        </div>

                        <div class="result-group">
                            <label>NCD</label>
                            <p><%= String.format("%d%%",(int) (ncd * 100))%></p>
                        </div>

                    </div>

                    <div class="result-box">
                        <h3>Result</h3>

                        <div class="result-group">
                            <label>Base Insurance</label>
                            <p><%= insurance%></p>
                        </div>

                        <div class="result-group">
                            <label>NCD Discount</label>
                            <p><%= discount%></p>
                        </div>

                        <div class="result-group">
                            <label>After NCD</label>
                            <p><%= afterNCD%></p>
                        </div>


                        <div class="result-group">
                            <label>SST (8%)</label>
                            <p><%= sst%></p>
                        </div>

                        <div class="result-group">
                            <label>Final Insurance Amount</label>
                            <p><%= String.format("RM %.2f", finalAmount)%></p>
                        </div>

                    </div>
                </div>

                <button class="btn-back" onclick="history.back()">&#8592; Back</button>
            </div>
        </div>
    </body>
</html>
