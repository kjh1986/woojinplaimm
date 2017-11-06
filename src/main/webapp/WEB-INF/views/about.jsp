<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<title>우진플라임 교육관리 시스템 v1.0</title>
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- 로고 -->
				<a class="navbar-brand wj-logo" href="main.jsp"><img
					src="img/logo_woojin.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/main.jsp">Home</a></li>
					<!-- 개발자문의 링크 -->
					<li><a href="/about.jsp">About</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container text-center" style="margin-top: 40px;">
			<!--메인화면 -->
		<div id="main">
			<div class="page-header">
				<h2>
					우진플라임 교육관리 시스템 <small> v1.0 since 2017.8.3</small>
				</h2>
				<p>개발자 문의</p>
				
			</div>
			<div>
			
				<p>E-mail : eyefortooth@naver.com</p>
				<p>Facebook : sksqkqh12@naver.com</p>
			
			</div>
			
			
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			about : eyefortooth@naver.com <br> © Copyright 2017.
			EyeForTooth. All Rights Reserved.
		</p>
	</footer>

</body>
</html>