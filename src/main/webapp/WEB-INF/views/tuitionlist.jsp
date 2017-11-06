<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<title>우진플라임 교육원 관리 시스템 v1.0</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/script/wj-style.css">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		if("${code}"=="100"){
			window.alert("훈련비구분입력이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("훈련비구분입력이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("훈련비구분수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("훈련비구분수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("훈련비구분삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("훈련비구분삭제가 실패했습니다.");
		}
		
		//수정액션리스너 
		$("button.btn-tuitionInfo").on("click",function(){
			var t_code = $(this).attr("value");
			var t_name = $(this).parents("tr").children(":nth-child(2)").text();
			
			$("#infoModal input#t_code").val(t_code);
			$("#infoModal input[name=t_code]").val(t_code);
			$("#infoModal input#t_name").val(t_name);
			$("#infoModal").modal();
		});

		//삭제액션리스너 
		$("button.btn-tuitionDelete").on("click",function(){
			var t_code = $(this).attr("value");
			var t_name = $(this).parents("tr").children(":nth-child(2)").text();
			
			$("#deleteModal input#t_code").val(t_code);
			$("#deleteModal input[name=t_code]").val(t_code);
			$("#deleteModal input#t_name").val(t_name);
			
			$("#deleteModal").modal();
		});


		//등록 액션 리스너
		$(".btnInsert").on("click",function(){
			$("#insertModal").modal();
		});
		
		
	});
</script>


<style>


</style>
<script>



</script>
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top"
		style="height: 51px;">
		<div class="container-fluid">
			<div class="navbar-header">

				<!-- 로고 -->
				<a class="navbar-brand wj-logo" href="${pageContext.request.contextPath}/goMain"><img
					src="${pageContext.request.contextPath}/resources/img/logo_woojin.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/index"><b>우진플라임 교육원 관리 시스템</b><small>
								v1.0 (2017.9.23)</small></a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/index">관리페이지</a></li>
					
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						통계페이지 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/statsRecord">실적현황</a></li>
							<li><a href="#">매출통계</a></li>
						</ul></li>
					<!-- 개발자문의 링크 -->
					<li><a href="#">개발자문의</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a class="btn" data-toggle="modal" data-target="#logoutModal">
					<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center" style="margin-top: 51px;">
		<div class="row content">
			<div class="col-md-2 sidenav" style="padding: 0px;">
				<div class="list-group">
					<a data-toggle="collapse" href="#basicCallapse"
						class="list-group-item callapseItem"> 기초정보 <span class="caret"
						style="float: right"> </span></a>
					<div class="list-group collapse in" id="basicCallapse">
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/roomList">숙소목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/subjectList">과목목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/courseList">과정목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/ocdList">개설과정구분</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/jobList">훈련직종구분</a>
						<a class="list-group-item active" href="${pageContext.request.contextPath}/basicInfo/tuitionList">훈련비구분</a>
					</div>

					<a class="list-group-item" href="${pageContext.request.contextPath}/lecturerList">강사목록</a> <a
						data-toggle="collapse" href="#StudentCallapse"
						class="list-group-item callapseItem"> 훈련생관리 <span
						class="caret" style="float: right"> </span></a>
					<div class="list-group collapse" id="StudentCallapse">
						<a class="list-group-item" href="${pageContext.request.contextPath}/studentList">전체훈련생</a> 
						<a class="list-group-item" href="#">입실관리</a>
					</div>

					<a class="list-group-item" href="${pageContext.request.contextPath}/companyList" >협약기업관리</a>  
						
					<a class="list-group-item" href="${pageContext.request.contextPath}/ocList" >개설과정관리</a>

				</div>
			</div>
			<!-- main DIV GROUP -->
			<div class="col-md-10 text-left" style="padding: 0px;"
				id="dataResult">

				<div class="panel panel-info">
					<div class="panel-heading">훈련비구분목록</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>구분번호</th>
									<th>구분명</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bi" items="${tableData}">
									<tr>
										<td>${bi.t_code}</td>
										<td>${bi.t_name}</td>
										<td><button class="btn btn-default btn-sm btn-tuitionInfo" value="${bi.t_code}">수정</button></td>
										<td><button class="btn btn-danger btn-sm btn-tuitionDelete"
												value="${bi.t_code}">삭제</button></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
						<button type="button" class="btn btn-default">
							전체 <span class="badge" id="count">${count }</span>
						</button>
						<button type="button" class="btn btn-info btnInsert">등록</button>
						<div class="form-inline" style="float:right" >
							<form>
							<select class="form-control" name="key" id="key">
								<option value="t_code">구분번호</option>
								<option value="t_name">훈련비구분명</option>
							</select>
							 
							<input type="text" class="form-control" name="value" id="value">
							<button type="submit" class="btn btn-primary btnSearch btn-submit">검색</button>
							</form>
						</div>
					</div>



				</div>

<!-- info Modal -->
	<div id="infoModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">훈련비정보</h4>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/basicInfo/tuitionUpdate" method="POST" class="form-inline" id="courseInfo">
						<div class="row">
							<div class="col-md-4" style="text-align: right">
								<label for="t_code">No : </label><br>
								<label for="t_name">과정명 : </label><br>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="t_code" disabled>
								<input type="hidden" name="t_code">
								<input type="text" class="form-control" name="t_name" id="t_name">
								
							</div>
						</div>
						<hr>
						<div style="text-align: right">	
							<button type="submit" class="btn btn-default  btn-submit">수정</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
				
			</div>

		</div>
	</div>
	


				<!-- delete Modal -->
				<div id="deleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">훈련비구분삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/basicInfo/tuitionDelete" method="POST"
									class="form-inline">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="t_code">No : </label><br> <label
												for="t_name">구분명 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="t_code"
												disabled> <input type="hidden" name="t_code">
											<input type="text" class="form-control" name="t_name"
												id="t_name">
										</div>
									</div>
									<hr>
									<div style="text-align: right">
										<button type="submit" class="btn btn-danger btn-submit">삭제</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>

						</div>

					</div>
				</div>

				<!-- insert Modal -->
				<div id="insertModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">직종훈련비구분등록</h4>
							</div>
							<div class="modal-body">
								<form class="form-inline" action="${pageContext.request.contextPath}/basicInfo/tuitionInsert"
								method = "POST">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="t_name">구분명 : </label>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" name="t_name"
												id="t_name">
										</div>
									</div>
									<hr>
									<div style="text-align: right">
										<button type="submit" class="btn btn-default btn-submit">등록</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>


						</div>

					</div>
				</div>


			</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>
			about : eyefortooth@naver.com <br> © Copyright 2017.
			EyeForTooth. All Rights Reserved.
		</p>
	</footer>
	<!-- Logout Modal -->
	<div id="logoutModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Logout Page</h4>
				</div>
				<div class="modal-body">
					<!-- Login form -->
					<p>
						정말 로그아웃 하시겠습니까? <a href="${pageContext.request.contextPath}/logout?loginCheck=logout"
							class="btn btn-lg"><span class="glyphicon glyphicon-log-out">확인</span></a>
					<p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>



</body>

</html>