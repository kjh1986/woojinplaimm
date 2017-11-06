<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>우진플라임 교육원 관리시스템 v1.0</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		 $('[data-toggle="tooltip"]').tooltip();
	});
</script>


<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	min-height: 700px
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

.wj-logo {
	padding: 0px;
}

div.menu-group {
	padding: 0px;
	margin: 0px;
}

#index{float:left;margin:0;padding:0;}
#index li{float:left;margin:0;padding:0;list-style: none;}
#index ul{float:left;margin:0;padding:0;list-style: none;}
img.link-icon{height:195px;width:195px;}

</style>
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				
				<a class="navbar-brand wj-logo" href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/img/logo_woojin.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}">Home</a></li>
					
					<li><a href="${pageContext.request.contextPath}/about">About</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="btn" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container text-center" style="margin-top: 40px;">
			
		<div id="main">
			<div class="page-header">
				<h2>
					우진플라임 교육원 관리시스템 <small> v1.0 (2017.9.23)</small>
				</h2>
				
				<p>로그인 후 이용하세요.</p>

			</div>

			<div class="row">
		
				<div class="col-lg-6" style="margin:0;padding:0;background-color:#90dfaa;height:390px;">
					<a href="#" data-toggle="tooltip" title="로그인 후 이용하세요."><img
								src="resources/icons/edu_content.png" style="padding:10px"></a>
				</div>
				<div class="col-lg-6" style="margin:0;padding:0;" id="index">
					<ul>
					 	
						<li><a href="http://www.woojinplaimm.com/kor/company/intro.php"><img
								class="link-icon" src="${pageContext.request.contextPath}/resources/icons/bn_company.jpg"></a></li>
						<li><a href="http://www.woojinplaimm.or.kr/comp/intro.asp"><img class="link-icon"
								src="${pageContext.request.contextPath}/resources/icons/bn_eduintro.jpg"></a></li>
						<li><a href="http://www.woojinplaimm.or.kr/"><img class="link-icon"
								src="${pageContext.request.contextPath}/resources/icons/bn_edu.jpg"></a></li>
						<li><a href="http://www.woojinplaimm.or.kr/course/year.asp"><img
								class="link-icon" src="${pageContext.request.contextPath}/resources/icons/quickbox_4.jpg"></a></li>		
						<li><a href="http://www.woojinplaimm.or.kr/course/ing.asp"><img
								class="link-icon" src="${pageContext.request.contextPath}/resources/icons/quickbox_1.jpg"></a></li>
						<li><a href="http://www.woojinplaimm.or.kr/course/year.asp"><img
								class="link-icon" src="${pageContext.request.contextPath}/resources/icons/bn_inquiry.jpg"></a></li>
						
						
					</ul>

				</div>
			</div>
			<hr>
			


		</div>



	</div>

	<footer class="container-fluid text-center">
		<p>
			about : eyefortooth@naver.com <br> © Copyright 2017.
			EyeForTooth. All Rights Reserved.
		</p>
	</footer>


	<!-- Login Modal -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login Page</h4>
				</div>
				<div class="modal-body">
				<!-- Login form -->
					<form action="${pageContext.request.contextPath}/login" method="post">
						<div class="form-group">
							<label for="admin_id">ID : </label> 
							<input type="text" class="form-control" name="admin_id" id="admin_id" placeholder="admin" required>
						</div>
						<div class="form-group">
							<label for="admin_pass">Password:</label>
							<input type="password" class="form-control" name="admin_pass" id="admin_pass" required>
						</div>
						<button type="submit" class="btn btn-default">로그인</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>