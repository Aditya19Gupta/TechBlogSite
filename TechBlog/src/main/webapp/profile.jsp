

<%@page import="java.io.File"%>
<%@page import="com.techBlog.entities.*"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile Page</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mycs.css" rel="stylesheet" type="text/css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style>
body {
	background: #323946;
}

#logout a:hover {
	color: #0ef;
}

.con {
	text-align: center;
	color: #fff;
}

.con span {
	color: #0ef;
}

.con  #post {
	color: #fff;
	background: #1f242d;
	border: .1rem solid #0ef;
}

.con #post:hover {
	box-shadow: 0 0 1rem #0ef;
}

#contain {
	width: 20rem;
	overflow: hidden;
}

#cat {
	background: #495469;
	color: #fff;
	font-size: 1.5rem;
	transition: .3s;
}

#cat:hover {
	background: #a3a375;
}

/* Container needed to position the overlay. Adjust the width as needed */
</style>
</head>
<body>
	<!-- nav bar start -->
	<nav id="nav"
		class="navbar navbar-expand-lg navbar-dark primary-bg banner-bg">
		<a id="main" class="navbar-brand" href="index.jsp"><i
			class='bx bxs-coffee-bean'></i> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class='bx bxs-home-smile'></i>Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class='bx bxs-right-arrow'></i>Courses
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java</a> <a
							class="dropdown-item" href="#">Python</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Web Development</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link"
					href="contact.jsp"><i class='bx bxs-contact'></i>Contact</a></li>
				<li class="nav-item active"><a class="nav-link " href="#"><i
						class='bx bx-dots-vertical-rounded'></i>More</a></li>
				<li class="nav-item active" data-toggle="modal"
					data-target="#content"><a class="nav-link" href="#"><i
						class='bx bxs-edit-alt' onclick="refreshPage()"></i>Post</a></li>
			</ul>
			<ul>
				<li id="logout" class="navbar-nav active mr-right"><a
					class="nav-link " href="#!" data-toggle="modal"
					data-target="#exampleModal" style="color: #fff; font-weight: 600;"><i
						class='bx bxs-face'></i><%=user.getName()%></a> <a class="nav-link "
					style="color: red; font-weight: 600;" href="LogoutServlet"><i
						class='bx bx-user-minus'></i>logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- nav bar end -->
	<!--        start profile modal-->
	<!-- Button trigger modal -->
	<header style="background: #000033; border-top: 0.1px solid #fff;">
		<div class="con" style="padding-top: 1rem; padding-bottom: 1rem;">
			<h1 style="color: #fff;">
				Welcome <span style="color: #0ef;"><%=user.getName()%></span>
			</h1>

			<button class="btn btn-primary" id="post" data-toggle="modal"
				data-target="#content">post blog</button>

		</div>
	</header>






	<!-- main body -->

	
		<div class="row">
			<div class="col-3 mt-2"
				style="margin-left: 1rem;background:gray">
				<a onclick="getPosts(0)"
					class="list-group-item list-group-item-action"><h3>All
						Post</h3></a>
				<%
				PostDao pdo = new PostDao(ConnectionProvider.getConnection());
				ArrayList<Category> clist = pdo.getAllCategories();

				for (Category c : clist) {
				%>
				<a id="cat" href="#" onclick="getPosts(<%=c.getCid()%>)"
					class="list-group-item list-group-item-action"><%=c.getName()%></a>
				<%
				}
				%>
			</div>

			<div class="col-md-8 " id="post-container">
				<div id="loader">
					<i style="color: #fff; text-align: font-size: 5rem;"
						class='bx bx-loader-circle bx-spin'></i>
					<h1>Loading...</h1>
				</div> 				
			</div>
		</div>
	
	<!-- second column -->



	<!-- main body  close -->
	<!-- Modal -->




	<!-- Modal -->
	<div class="modal fade" id="content" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post" action="AddPostServlet" method="post">
						<div>
							<select name="pcid" class="form-control"
								style="background: #3d5c5c; color: #fff;">
								<option style="text-align: center;">----Select
									categories---</option>
								<%
								PostDao pd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = pd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div>
							<label>Blog title</label> <input name="ptitle" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea name="pcontent" class="form-control"
								placeholder="enter content"></textarea>
						</div>
						<div class="form-group">
							<label>Code</label>
							<textarea name="pcode" class="form-control"
								placeholder="enter code(if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select pic</label>
							 <input type="file" class="form-control"
								name="ppic" />
						</div>
						<div style="text-align: center; margin-top: .6rem;">
							<button type="submit" onlick="window.location.reload();" class="btn btn-outline-primary">post</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Profile</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center ">
					<div id="profile-details">
						<img src="img/<%=user.getProfile()%>" style="max-width: 100px;"
							alt="#" /> <br>

						<%=user.getName()%>


						<table class="table">
							<thead>
								<tr>
									<th scope="col">id</th>
									<th scope="col"><%=user.getId()%></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">email</th>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">password</th>
									<td>********</td>

								</tr>
								<tr>
									<th scope="row">Gender</th>
									<td><%=user.getGender()%></td>

								</tr>
								<tr>
									<th scope="row">Date of reg.</th>
									<td><%=user.getDatetime()%></td>

								</tr>
							</tbody>
						</table>
					</div>
					<!--edit details-->
					<div id="edit-details" class="edit-profile text-center"
						style="display: none;">
						<form id="editp" action="EditServlets" method="post"
							enctype="multipart/form-data">
							<div class="modal-body text-center ">

								<img src="img/<%=user.getProfile()%>" style="max-width: 100px;"
									alt="#" />
								<div id="photo">
									<a href="#" style="top: 100%; color: #000;" data-toggle="modal"
										data-target="#upload"><i class='bx bxs-camera'></i></a>
								</div>

								<%=user.getName()%>
							</div>
							<div id="pic">
								<div class="modal fade" id="upload" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">Modal
													title</h5>
												<button id="clr" type="button" class="close"
													data-dismiss="select" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">

												<input class="btn btn-primary" name="userprofile"
													type="file"> <a class="btn btn-outline-primary">upload</a>

											</div>

											<div class="modal-footer">
												<button id="cls" type="button" class="btn btn-secondary"
													data-dismiss="modal ">Close</button>
												<button id="save" type="button" class="btn btn-primary">Save
													photo</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<table class="table text-center">
								<tr>
									<th>id</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th>Email :</th>
									<td><input class="form-control" name="useremail"
										type="email" value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th>Name :</th>
									<td><input class="form-control" name="username"
										type="text" value="<%=user.getName()%>"></td>
								</tr>
								<tr>
									<th>Gender :</th>
									<td><%=user.getGender().toUpperCase()%></td>
								</tr>
								<tr>
									<th>Password :</th>
									<td><input class="form-control" name="userpass"
										type="text" value="<%=user.getPassword()%>"></td>
								</tr>

							</table>
							<button class="btn btn-outline-primary">Save profile</button>
						</form>

					</div>
					<!--edit details end-->

					<div class="modal-footer bg-light">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-profile" type="button" class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
		<div class="save-profile " style="display: none;">
			<h4 class="text-center">Profile updated !..</h4>
		</div>
		<!-- end profile modal -->
</body>
<script src="https://unpkg.com/typed.js@2.0.132/dist/typed.umd.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="js/myjs.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		let status = false;
		$('#edit-profile').click(function() {
			if (status == false) {
				$('#profile-details').hide();
				$('#edit-profile').text("back");
				$('.edit-profile').css("display", "block");
				status = true;
			} else {
				$('#profile-details').show();
				$('#edit-profile').text("edit");
				$('#edit-details').hide();
				status = false;
			}
		});
		$('#save').click(function() {
			$('#pic').hide();
		});
		$('#cls').click(function() {
			$('#pic').hide();
		});
		$('#clr').click(function() {
			$('#pic').hide();
		});

		//show update on screen      
		//            $('#icon').click(function(){
		//                $('#profile-details').hide();
		//            });

	});
</script>
<script>
	$(document).ready(function(e) {
		$('#add-post').on("submit", function(event) {
			event.preventDefault();

			console.log("loaded");
			let form = new FormData(this);
			$.ajax({
				url : "AddPostServlet",
				type : 'POST',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					if (data.trim() == "done") {
						swal("Done", "Your blog has been posted", "success");
					} else {
						swal("Error!!", "Something went wrong..", "error");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {

				},
				processData : false,
				contentType : false
			});
		});
	});
</script>
<script>

	function getPosts(catId){
		$.ajax({
			
			url : "load-posts.jsp",
			data:{cid:catId},
			success : function(data, textStatus, jqXHR) {
				//console.log(data);
				$("#loader").hide();
				$("#post-container").html(data);
				
			},

		})

	}
	$(document).ready(function(e) {
		
		getPosts(0);
		getPosts(catId);
	})
</script>
</html>
