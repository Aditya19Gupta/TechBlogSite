<%-- 
    Document   : forgot
    Created on : Mar 22, 2023, 9:26:57 PM
    Author     : USER
--%>

<%@page import="com.techBlog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://unpkg.com/typed.js@2.0.132/dist/typed.umd.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
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
        <main class="d-flex align-items-center" style="margin-top: 3rem;height:80vh;">
            <div class="container" >
                <div class="row">
                    <div  class="col-md-6 offset-3">
                        <div id="login-item" class="card">
                            <div class="card-header center-align" style="text-align:center;">
                                <h3 > Welcome to <span class="" style="color:var(--main-color);">Tech Blog</span></h3>  
                                <!--<i style="color:red;box-shadow:0 0 1rem red;border-radius: 50%; " class='bx bx-user-circle'></i>-->
                                <br>
                                <h3>Reset password</h3>
                                <%
                                    Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {


                                %>
                                <div class="alert <%= m.getCssClass()%>" role="alert">
                                    <%= m.getContent()%>
                                </div>
                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>
                            </div>
                            <div class="card-body">
                                <form action="forgot" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">UserId *</label>
                                        <input name="userid" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter id">

                                    </div>
                                    <div class="form-group">
                                        <label>Password *</label>
                                        <input id="pass" class="form-control" required name="password" type="password" placeholder="enter password">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm password *</label>
                                        <input id="cpass" class="form-control" required name="cpassword" type="text" placeholder="confirm password">
                                        
                                        <div> 
                                            <i style="display:none;" id="ii" class='bx bx-check-shield'>Matching...</i>
                                        </div>    
                                        <span id="passHelp"></span>
                                    </div>
                                    <div>
                                        <button id="sub-btn" class="btn btn-primary">reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

    </body>
    <script>

        $('#pass, #cpass').on('keyup', function () {
            if($('#cpass').val()== null | $('#pass').val()==null){
                $('#passHelp').html('not matching..').css("color", "red");
            }
            if ($('#pass').val() == $('#cpass').val()) {
                $('#passHelp').hide();
                $('#ii').css({
                    'display': 'block',
                    'color': '#0ef',
                    'font-weight':'700',
                    'background': 'transparent'
                });
            }
            else{
                $('#passHelp').html('not matching..').css("color", "red");
            }
        });

    </script>
</html>
