

<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
            
            
            #nav{
                justify-content: center;
                content:fixed;
                border-bottom: 1.5px solid var(--second-bg-color);
            }
            body{
                background: var(--bg-color);
            }
            .primary-bg{
                background:#1f242d ;
                color:var(--text-color)
            }
            :root{
                --bg-color:#1f242d;
                --second-bg-color:#323946;
                --text-color:#fff;
                --main-color:#0ef;
            }
            #nav #main{
                font-size: 1.5rem;
                font-weight: 700;
                color: var(--main-color);
                text-shadow: 0 0 1rem var(--main-color);
            }
            #nav #main i{
                color: red;
                text-shadow: 0 0 1rem red;
            }
            #nav .dropdown-item{
                color: #000;
                transition: .5s;
            }
            #nav .dropdown-item:hover{
                color:#000;
                font-weight: 500;
            }
            #nav a{
                background: transparent;
                transition: 0.3s;
                font-size: 1rem;
                font-weight: 600;
            }

            #nav a i:hover{
                background: transparent;
                color: var(--main-color);
            }
            #sbutton i{
                color: var(--main-color);
                font-size: 1.5rem;
                font-weight: 900;
                margin-top: 5px;
            }
           #sbutton i:hover{
                background: #007780;
            }
            
            .jumbotron{
                background: var(--second-bg-color);
                color: var(--text-color);
            }
            .jumbotron h3 span{
                color: var(--main-color);
            }
            .container #button1{
                background: transparent;
                border: 1.5px solid var(--main-color);
                box-shadow: 0 0 1rem var(--main-color);
                margin-right: 1.5rem;
                transition: .5s;
            }
            .container a{
                background: transparent;
                border: 1.5px solid var(--main-color);
                box-shadow: 0 0 1rem var(--main-color);
                transition: .3s;
                
                justify-content: center;
            }
            .container #button1:hover{
                background: var(--main-color);
                color:var(--bg-color);
                box-shadow: none;
                border: none;
                margin-right: 1.5rem;
               

            }
            .container a:hover{
                background: var(--main-color);
                color:var(--bg-color);
                box-shadow: none;
                border: none;
                 content: fixed;
            }
            
            .col-md-4 .card{
                background: transparent;
                color:#fff;
                border: .1rem solid var(--main-color);
                transition: .3s;
            }
            .col-md-4 .card:hover{
                box-shadow: 0 0 1rem var(--main-color);
                
            }
            .col-md-4 .card-header{
                background: var(--second-bg-color);
                font-size: 1.5rem;
                font-weight: 600;
            }



        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron">
                <div class="container">
                    <h3> Welcome to <span class="textanimation"></span></h3>
                    <p>Hello this my first tech blog</p>
                    <p>A computer program consists of code that is executed on a computer to perform particular tasks. This code is written by programmers.

                        Programming is the process of giving machines a set of instructions that describe how a program should be carried out. Programmers will spend their whole careers learning a variety of programming languages and tools so they can effectively build computer programs.

                        Programmers will start by using a code editor or IDE to write what is called source code. This is a collection of code written in a programming language that other programmers can read.</p>
                    <a id='button1' class="btn btn-primary" href="signup.jsp"><i class='bx bx-link-external'></i>  Start ! It's free </a>
                    <a class="btn btn-primary" href="login.jsp"><i class='bx bx-user-circle' ></i>      login </a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row" style="margin-bottom:20px;">
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                            Java
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Read about Core Java</h5>
                            <p class="card-textames">Gosling, Mike Sheridan, and Patrick Naughton initiated the Java language project in June 1991. Java was originally designed for interactive television, but it was too advanced for the digital cable television industry at the time.</p>
                            <a href="https://en.wikipedia.org/wiki/Java_(programming_language)" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                            Python
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Read about Python programming</h5>
                            <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically typed and garbage-collected. </p>
                            <a href="https://www.bing.com/ck/a?!&&p=9ca1afeea53dcec5JmltdHM9MTY3OTM1NjgwMCZpZ3VpZD0xZDZjNWNjOS04MDE3LTZkNjgtMzEzNC00ZThkODFlNTZjODAmaW5zaWQ9NTQ3MA&ptn=3&hsh=3&fclid=1d6c5cc9-8017-6d68-3134-4e8d81e56c80&psq=python+wiki&u=a1aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUHl0aG9uXyhwcm9ncmFtbWluZ19sYW5ndWFnZSk&ntb=1" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                            Frontend Development
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Awesome web page idea</h5>
                            <p class="card-text">There are several tools and platforms, such as WordPress, Joomla, and Drupal, available that can be used to develop the front end of a website.HTML is the backbone of any website development process.</p>
                            <a href="https://en.wikipedia.org/wiki/Front-end_web_development" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                            MySQL
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Read MySQL command</h5>
                            <p class="card-text">MySQL is an open-source relational database management system (RDBMS). Its name is a combination of "My", the name of co-founder Michael Widenius's daughter My, and "SQL", the acronym for Structured Query Language. </p>
                            <a href="https://en.wikipedia.org/wiki/MySQL" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                          Data Structure
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Advance Java content</h5>
                            <p class="card-text">Gosling, Mike Sheridan, and Patrick Naughton initiated the Java language project in June 1991. Java was originally designed for interactive television, but it was too advanced for the digital cable television industry at the time.</p>
                            <a href="https://en.wikipedia.org/wiki/" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="margin-top:1rem;"><div class="card">
                        <div class="card-header">
                            Project
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">More project on various topic</h5>
                            <p class="card-text">We have donemany project like login page using javaFX, temperature converter, connect4game using JavaFX, JDBC connectivity, personal portfolio website and Blog website using servlets,jsp bootstrap, ajax, jQuery etc..</p>
                            <a href="#" class="btn btn-primary">Read</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://unpkg.com/typed.js@2.0.132/dist/typed.umd.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    
</html>
