<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="css/mycs.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    border: none;
    text-decoration: none;
    font-family: 'Poppins',sans-serif;
    scroll-behavior: smooth;
}
* span{
    color: var(--main-color);
}
:root{
    --bg-color:#1f242d;
    --second-bg-color:#323946;
    --text-color:#fff;
    --main-color:#0ef;
}

body{
    background:var(--bg-color);
    color: var(--main-color);
}
section{
	
    min-height: 30vh;
    padding: 1rem 9% 0;
}

.contact h1 span{
    font-size: 2rem;
    font-weight: 700;
    color: var(--main-color);
}
.contact h1{
    font-size: 2rem;
    font-weight: 700;
    color: var(--text-color);
    margin-top: 1rem;
    padding-left: 1rem;
    transition: .5s;
}
.contact h3{
    font-size: 1.5rem;
    font-weight: 500;
    margin-top: 1rem;
    padding-left: 1rem;
    background: var(--bg-color);
    color: var(--text-color);
    transition: .5s;
}
.row i{
    display: inline-flex;
    justify-content: center;
    align-items: center;
    width: 2.5rem;
    height: 2.5rem;
    background: transparent;
    border: .2rem solid var(--main-color);
    border-radius: 50%;
    margin: 3rem 1.5rem 3rem 0;
    transition: 0.3s;
}
#icon-con{
    width: 5rem;
    height: 5rem;
}
.row{
    background: var(--second-bg-color);
}
.row h3{
    background: transparent;
}
.row i:hover{
    background: var(--main-color);
    color: var(--second-bg-color);
    box-shadow: 0 0 1rem var(--main-color);
    text-decoration: none;
}
.row h1:hover{
    background-color: #212327;
    
}
.row h3:hover{
    background-color: #2e2f30;
}
.home-content li h3 span{
    position: relative;
}

</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<section class="contact">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h1><i id="icon-con" class='bx bxs-contact'></i> Contact <span>Me</span></h1>
                <h3><i class='bx bx-phone'></i> Call me : <span>9794369680</span> </h3>
                <h3><i class='bx bxl-whatsapp'></i> Whatsapp me : <span>9555942426</span></h3>
                <h3><i class='bx bxl-gmail'></i> Email me : <span>adityacse207@gmail.com</span></h3>
            </div>
        </div>
    </section>
</body>
</html>