<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Login</h1>
            <form action="doLogin.jsp" method="post">
                <label>Username</label>
                <input name="username" type="text" placeholder="@Username" required>

                <label>Password</label>
                <input name="password" type="password" placeholder="@Password" required>

                <div class="btn-group">
                    <button type="submit">Login</button>
                </div>
            </form>
            <%
                String errorMessage = request.getParameter("error");
                if (errorMessage != null) {
                    if ("1".equals(errorMessage)) {
                        errorMessage = "Invalid username or password";
                    } else if ("2".equals(errorMessage)) {
                        errorMessage = "Invalid Profile";
                    }
                    out.println("<div class='error'>" + errorMessage + "</div>");
                }
            %>
        </div>
    </body>
</html>
