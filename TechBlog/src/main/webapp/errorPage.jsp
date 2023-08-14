<%-- 
    Document   : errorPage
    Created on : Mar 18, 2023, 8:37:21 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! something went wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                border: none;
                text-decoration: none;
                font-family: 'Poppins',sans-serif;
                scroll-behavior: smooth;
                overflow: none;

            }
            img .imgage{
                margin-top: 20vh;
                margin-left: 50%;
            }
        </style>
    </head>
    <body>
        <div class="image" style="text-align:center;margin-top: 10px;">
            <img src="img/errorp.png" class="img-fluid" />
            <h1>Something ! went wrong..</h1>
            <%= exception %>
            <a href="index.jsp" class="btn btn-primary">Go home</a>
        </div>
    </body>
</html>
