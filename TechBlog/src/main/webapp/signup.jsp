<%-- 
    Document   : signup
    Created on : Mar 18, 2023, 2:33:15 PM
    Author     : USER
--%>
<%@page import="com.techBlog.entities.Message"%>
<%@page import="com.techBlog.entities.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="css/mycs.css" rel="stylesheet" type="text/css"/>
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
            body{
                background: var(--second-bg-color);
            }
            .card{
                margin-top: 2rem;
                background: var(--second-bg-color);
                color:#fff;
                box-shadow: 0 0 1rem var(--main-color);
                margin-bottom: 2rem;
            }
            .card #header i{
                font-size: 2rem;
            }
            .card #header {
                background: #343c4b;
            }
            .card-body{
                background:  #3f485a;
                font-size: 1rem;
                font-weight: 600;
            }
            #reg-btn{
                background: var(--bg-color);
                font-weight: 600;
                border: .1rem solid var(--main-color);
                box-shadow: 0 0 1rem var(--main-color);
                left: 50%;
                margin-top: 1rem;
                margin-left: 35%;
            }
            #reg-btn:hover{
                color: #000;
                font-weight: 600;
                background: var(--main-color);
                box-shadow:none;
            }
            .radio-content{
                font-weight: 500;
            }
            #spin{
                font-size: 3rem;

                text-align: center;
                display: none;
            }
            #success{
                display: none;

            }
            #file{
                color:#fff;
                width: 50%;
                margin-left: 3rem;
                border: var(--main-color);

            }
            #photo{
                margin-left: 9em;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex " >
            <div class="container">
                <div class="row">
                    <div  class="col-md-6 offset-3">
                        
                        <div id="signup-item" class="card">
                            
                            <div id="header" class="card-header center-align" style="text-align:center;">
                                <h3 > Welcome to <span class="textanimation" style="color:var(--main-color);">Tech Blog</span></h3>  
                                <i style="color:red;box-shadow:0 0 1rem red;border-radius: 50%; " class='bx bx-user-circle'></i>
                                <br>
                                <h3>Register</h3>
                                <h4 id="success" class="success" style="display:none;text-shadow:0 0 1rem var(--main-color);"></h4>
                                <h5 id="userid" class="info" style="display:none;"> </h5>
                               
                            </div>

                            <div class="card-body">
                                <form id="sign-form" action="signup" method="post">
                                    <div class="form-group">
                                        <label >Name *</label>
                                        <input id="uname" name="name" type="text" class="form-control"   placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address *</label>
                                        <input id="uemail" name="email" type="email" class="form-control"  aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password *</label>
                                        <input id="upass" name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div>
                                        <label>Select gender</label>

                                        <div class="radio-content">
                                            <label >Male</label>
                                            <input type="radio" name="gender" value="male">
                                            <label >Female</label>
                                            <input type="radio" name="gender" value="female">
                                            <label >others</label>
                                            <input type="radio" name="gender" value="others">                                           
                                        </div>
                                    </div>

                                    <br>
                                    <div class="form-check">
                                        <input name="term" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">agree term & condition</label>
                                    </div>


                                    <button  id="reg-btn" type="submit" class="btn btn-primary ">register</button>
                                    <div style="margin-left:40%;"><a href="login.jsp" style="font-weight:400;font-size:.8rem;box-shadow: none;border:none;text-decoration: none; color:#0ef;background: transparent">login</a></div>
                                </form>
                                <div id="spin">
                                    <i class='bx bx-revision bx-spin'></i>
                                    <label>Please wait..</label>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Button trigger modal -->
            

            <!-- Modal -->
            
        </main>
    </body>
    <script src="https://unpkg.com/typed.js@2.0.132/dist/typed.umd.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            console.log('loaded....');
            $('#sign-form').on('submit', function (event) {
                event.preventDefault();

                let formdata = new FormData(this);
                $('#spin').css("display", "block");
                $('#sign-form').hide();


                $.ajax({
                    url: "signup",
                    type: 'POST',
                    data: formdata,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $(' #spin').css("display", "none");
                        $('#sign-form').show();
                        $('#success').css("display", "block");

                        if (data.trim() == "done") {
                            $('#success').html("Registration Successfull!").css({
                                "color": "greenyellow",
                                "text-shadow": "0 0 1rem var(--main-color)",
                            });
                            let decimal=Math.random()*100;
                            let randomNumber = Math.round(decimal);
                            let userid = $('#uname').val().slice(0,3)+$('#uemail').val().slice(3,6)+randomNumber+$('#upass').val().slice(2,5);
                            $('#userid').html("Your UserId : "+userid).css("display","block");


                        } else {
                            $('#success').html("Something went wrong !").css({
                                "color": "red",
                                "text-shadow": "0 0 1rem red",
                            });
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $(' #spin').css("display", "block");
                        $('#sign-form').hide();
                        $('#success').html("Somethinng went wrong!");
                    },
                    processData: false,
                    contentType: false
                });


            });
        });
    </script>


</html>
