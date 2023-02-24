<%-- 
    Document   : error_page
    Created on : Feb 16, 2023, 5:46:21 AM
    Author     : smanjuna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 404 - Page not found</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f2f2f2;
            }
            .error-container {
                max-width: 800px;
                margin: auto;
                padding: 50px 15px;
                text-align: center;
            }
            h1 {
                font-size: 3em;
                color: #333;
            }

            p {
                font-size: 1.2em;
                color: #777;
                margin-bottom: 50px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="error-container">
                <h1>Sorry!! Something went wrong</h1>
                <p>error</p>
                <br>
                <div class="container">
                     <a href="index.jsp" class="btn btn-primary">Home</a>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
                integrity="sha384-HjJwLVFBN5xt5yFrYuxS5SxZnm1cM6FYgO+JGFvm6fzzmXmzG6vcFZ6vAqa7/Sc"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>
