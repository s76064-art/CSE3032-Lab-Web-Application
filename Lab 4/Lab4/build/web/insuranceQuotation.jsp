<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 4 Task-5</title>
        <link rel="stylesheet" href="static/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation</h1>
            <form class="card" action="processInsuranceQuo.jsp">
                <h2 class="form-title">Insurance Calculation</h2>

                <div class="form-group">
                    <label for="ic-input">IC No.*</label>
                    <input id="ic-input" name="ic" type="text" required pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" placeholder="Eg. 232321-02-2345">
                </div>

                <div class="form-group">
                    <label for="name-input">Name*</label>
                    <input id="name-input" name="name" type="text" required placeholder="Enter name">
                </div>

                <div class="form-group">
                    <label for="market-price-input">Market Price*</label>
                    <input id="market-price-input" name="marketPrice" type="number" step=".01" required placeholder="Price">
                </div>

                <div class="form-group">
                    <label for="coverage-type">Coverage Type</label>
                    <select id="coverage-type" name="coverageType">
                        <option value="1">Third Party</option>
                        <option value="2">Comprehensive</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="ncd-type">No Claims Discounts(NCD)</label>
                    <select id="ncd-type" name="ncdType">
                        <option value=".1">10%</option>
                        <option value=".2">20%</option>
                        <option value=".3">30%</option>
                    </select>
                </div>


                <div class="button-group">
                    <button type="submit" class="btn btn-submit" >Submit</button>
                    <button type="reset" class="btn btn-cancel" >Cancel</button>
                </div>

            </form>
    </body>
</html>
