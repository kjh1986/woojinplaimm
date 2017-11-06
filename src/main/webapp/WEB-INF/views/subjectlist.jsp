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
			window.alert("과목입력이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("과목입력이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("과목수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("과목수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("과목삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("과목삭제가 실패했습니다.");
		}
		//수정액션리스너 
		$("button.btn-subInfo").on("click",function(){
			var sub_id = $(this).attr("value");
			var sub_name = $(this).parents("tr").children(":nth-child(2)").text();
			var sub_lec = $(this).parents("tr").children(":nth-child(3)").text();
			
			$("#infoModal input#sub_id").val(sub_id);
			$("#infoModal input[name=sub_id]").val(sub_id);
			$("#infoModal input#sub_name").val(sub_name);
			$("#infoModal input#sub_lec").val(sub_lec);
			$("#infoModal").modal();
		});

		//삭제액션리스너 
		$("button.btn-subDelete").on("click",function(){
			var sub_id = $(this).attr("value");
			var sub_name = $(this).parents("tr").children(":nth-child(2)").text();
			var sub_lec = $(this).parents("tr").children(":nth-child(3)").text();
			
			$("#deleteModal input#sub_id").val(sub_id);
			$("#deleteModal input[name=sub_id]").val(sub_id);
			$("#deleteModal input#sub_name").val(sub_name);
			$("#deleteModal input#sub_lec").val(sub_lec);
			
			$("#deleteModal").modal();
		});

		//검색액션리스너 
		$("#subSearch .btnSearch").on("click",function(){
			
			$.ajax({
				url : "${pageContext.request.contextPath}/basicInfo/subjectList",		
				data : {
					key : $("#subSearch select").val(),
					value : $("#searchText").val()
				},
				success: function(data){
					var result = $(data).html();
					$("div#dataResult").html(result);
				}
			})
			
		});
		//등록 액션 리스너
		$(".btnInsert").on("click", function() {
			$("#insertModal").modal();
		});

		$("#key option[value=${param.key}]").attr("selected","selected");
		$("#value").val("${param.value}");
		
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
						<a class="list-group-item active" href="${pageContext.request.contextPath}/basicInfo/subjectList">과목목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/courseList">과정목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/ocdList">개설과정구분</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/jobList">훈련직종구분</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/tuitionList">훈련비구분</a>
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
					<div class="panel-heading">과목목록</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>과목번호</th>
									<th>과목명</th>
									<th>강의가능강사</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bi" items="${tableData}">
									<tr>
										<td>${bi.sub_id}</td>
										<td>${bi.sub_name}</td>
										<td>${bi.sub_lec}</td>
										<td><button class="btn btn-default btn-sm btn-subInfo"
												value="${bi.sub_id}">수정</button></td>
										<td><button class="btn btn-danger btn-sm btn-subDelete"
												value="${bi.sub_id}">삭제</button></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
						<button type="button" class="btn btn-default">
							전체 <span class="badge" id="count">${count }</span>
						</button>
						<button type="button" class="btn btn-info btnInsert">등록</button>
						<div class="form-inline" style="float: right" id="subSearch">
						<form>
							<select class="form-control" id="key" name="key">
								<option value="sub_id">과목번호</option>
								<option value="sub_name">과목명</option>
								<option value="sub_lec">강사명</option>
							</select> <label for="searchText">검색:</label> <input type="text"
								class="form-control" name="value" id="value">
							<button type="button" class="btn btn-primary btnSearch">검색</button>
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
								<h4 class="modal-title">과목상세정보</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/basicInfo/subjectUpdate" method="POST"
									class="form-inline" id="subInfo">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="sub_id">No : </label> <br> <label
												for="sub_name">과목명 : </label><br> <label
												for="sub_lec">강사목록 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="sub_id"
												disabled> <input type="hidden" name="sub_id">
											<input type="text" class="form-control" name="sub_name"
												id="sub_name"> <input type="text"
												class="form-control" name="sub_lec" id="sub_lec"
												disabled>
										</div>
									</div>
									<hr>
									<div style="text-align: right">
										<button type="submit" class="btn btn-default btn-submit">수정</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
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
								<h4 class="modal-title">과목상세정보-삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/basicInfo/subjectDelete" method="POST"
									class="form-inline">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="sub_id">No : </label><br> <label
												for="sub_name">과목명 : </label> <br> <label
												for="sub_lec">강사목록 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="sub_id"
												disabled> <input type="hidden" name="sub_id">
											<input type="text" class="form-control"
												name="sub_name" id="sub_name" disabled> <input
												type="text" class="form-control" name="sub_lec"
												id="sub_lec" disabled>
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
								<h4 class="modal-title">과목등록</h4>
							</div>
							<div class="modal-body">
								<form class="form-inline" method="POST"
									action="${pageContext.request.contextPath}/basicInfo/subjectInsert">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="sub_name">과목명 : </label>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control"
												name="sub_name" id="insert_sub_name">
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