<%-- 
    Document   : login
    Created on : Mar 17, 2023, 9:22:19 PM
    Author     : USER
--%>

<%@page import="com.techBlog.entities.Message" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="css/mycs.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: var(--second-bg-color);
            }
            #login-item{
                background: var(--second-bg-color);
                border: .2rem solid var(--main-color);
                color: var(--text-color);
                margin-top: 2rem;
                box-shadow:  0 0 1rem var(--main-color);
            }
            #login-item .card-header{
                background: #343c4b;
            }
            #login-item .card-body{
                background:  #495469;
                font-size: 1rem;
                font-weight: 600;
            }
            .card-header i{
                font-size: 2rem;

            }
            #sub-btn{
                background: var(--bg-color);
                font-weight: 600;
                border: .1rem solid var(--main-color);
                box-shadow: 0 0 1rem var(--main-color);
                left: 50%;
                margin-top: 1rem;
                margin-left: 40%;
            }
            #sub-btn:hover{
                color: #000;
                font-weight: 600;
                background: var(--main-color);
                box-shadow:none;
            }
            #file{
                color:#fff;
                width: 50%;
                border: var(--main-color);
            }

        </style>
    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center" style="margin-top: 2rem;height:80vh;">
            <div class="container">
                <div class="row">
                    <div  class="col-md-6 offset-3">
                        <div id="login-item" class="card">
                            <div class="card-header center-align" style="text-align:center;">
                                <h3 > Welcome to <span class="" style="color:var(--main-color);">Tech Blog</span></h3>  
                                <i style="color:red;box-shadow:0 0 1rem red;border-radius: 50%; " class='bx bx-user-circle'></i>
                                <br>
                                <h3>Login</h3>
                                <%
                                    Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {


                                %>
                                    <div class="alert <%= m.getCssClass()%>" role="alert">
                                        <%= m.getContent()  %>
                                    </div>
                                <% 
                                    session.removeAttribute("msg");
                                    } 
                                %>
                            </div>
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label  for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div id="signup" style="font-weight:400;font-size:.8rem;">
                                    <label>don't have an account? </label><a href="signup.jsp" style="font-weight:400;font-size:.8rem;box-shadow: none;border:none;text-decoration: none; color:#0ef;background: transparent" > signup</a>
                                    </div>
                                    <button  id="sub-btn" type="submit" class="btn btn-primary ">login</button>
                                    <div style="margin-left:37%;">
                                    <a href="forgot.jsp" style="font-weight:400;font-size:.8rem;box-shadow: none;border:none;text-decoration: none; color:#0ef;background: transparent">forgot password</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="https://unpkg.com/typed.js@2.0.132/dist/typed.umd.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script>
        const typed = new Typed('.textanimation', {
            strings: ['Tech Blog'],
            typeSpeed: 100,
            backSpeed: 100,
            backDelay: 1000,
            loop: true
        });

    </script>
</html>
