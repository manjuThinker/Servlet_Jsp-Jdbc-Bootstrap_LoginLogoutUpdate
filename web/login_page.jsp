<%@page import="blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <br>
        <div class="container">
            <form action="loginServlet" method="post">
                <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                %>
                <div class="alert <%= m.getCssClass() %>" role="alert">
                    <%= m.getContent() %>
                </div> 


                <%        
                        session.removeAttribute("msg");
                    }
                %>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" required class="form-control" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" required class="form-control" id="password" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
