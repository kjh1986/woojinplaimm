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
			window.alert("강사입력이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("강사입력이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("강사수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("강사수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("강사삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("강사삭제가 실패했습니다.");
		}else if("${code}"=="400"){
			window.alert("강의과목등록이 완료 되었습니다.");
		}else if("${code}"=="401"){
			window.alert("강의과목등록이 실패했습니다.");
		}else if("${code}"=="500"){
			window.alert("강의과목삭제가 완료 되었습니다.");
		}else if("${code}"=="501"){
			window.alert("강의과목삭제가 실패했습니다.");
		}
		
		//수정액션리스너 
		$("button.btn-lecturerInfo").on("click",function(){
			var lec_id = $(this).attr("value");
			var lec_name = $(this).parents("tr").children(":nth-child(2)").text();
			var lec_tel = $(this).parents("tr").children(":nth-child(3)").text();
			var lec_sub = $(this).parents("tr").children(":nth-child(5)").text();
			$("#infoModal input#lec_id").val(lec_id);
			$("#infoModal input[name=lec_id]").val(lec_id);
			$("#infoModal input#lec_name").val(lec_name);
			$("#infoModal input#lec_tel").val(lec_tel);
			$("#infoModal input#lec_sub").val(lec_sub);
			$("#infoModal").modal();
		});

		//삭제액션리스너 
		$("button.btn-lecturerDelete").on("click",function(){
			var lec_id = $(this).attr("value");
			var lec_name = $(this).parents("tr").children(":nth-child(2)").text();
			var lec_tel = $(this).parents("tr").children(":nth-child(3)").text();
			var lec_sub = $(this).parents("tr").children(":nth-child(5)").text();
			$("#deleteModal input#lec_id").val(lec_id);
			$("#deleteModal input[name=lec_id]").val(lec_id);
			$("#deleteModal input#lec_name").val(lec_name);
			$("#deleteModal input#lec_tel").val(lec_tel);
			$("#deleteModal input#lec_sub").val(lec_sub);
			$("#deleteModal").modal();
		});

		
		//등록 액션 리스너
		$(".btnInsert").on("click",function(){
			$("#insertModal").modal();
		});
		//강의과목등록 액션 리스너
		$(document).on("click",".btn-lecsubInsert",function(){
			var lec_id = $(this).attr("value");
			var lec_name = $(this).parents("tr").children(":nth-child(2)").text();
			$("#lecsubModal input#lec_id").val(lec_id);
			$("#lecsubModal input[name=lec_id]").val(lec_id);
			$("#lecsubModal input#lec_name").val(lec_name);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/insertSubjectList",
				data : {
					lec_id : lec_id
				},
				success : function(data){
					var subOp ="";
					if(data.length>0){
						for(idx in data){
							subOp += "<option value='"+data[idx].sub_id +"'>"+data[idx].sub_name +"</option>"
						}
					}
					$("#lecsubModal select#sub_id").html(subOp);
					
				}
			});
			
			$("#lecsubModal").modal();
		});
		//강의과목삭제 액션 리스너
		$(document).on("click",".btn-lecsubDelete",function(){
			var lec_id = $(this).attr("value");
			var lec_name = $(this).parents("tr").children(":nth-child(2)").text();
			$("#lecsubDeleteModal input#lec_id").val(lec_id);
			$("#lecsubDeleteModal input[name=lec_id]").val(lec_id);
			$("#lecsubDeleteModal input#lec_name").val(lec_name);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/deleteSubjectList",
				data : {
					lec_id : lec_id
				},
				success : function(data){
					
					var subOp ="";
					if(data.length>0){
						for(idx in data){
							subOp += "<option value='"+data[idx].sub_id +"'>"+data[idx].sub_name +"</option>"
						}
					}
					$("#lecsubDeleteModal select#sub_id").html(subOp);
					
				}
			});
			
			$("#lecsubDeleteModal").modal();
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
					<div class="list-group collapse" id="basicCallapse">
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/roomList">숙소목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/subjectList">과목목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/courseList">과정목록</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/ocdList">개설과정구분</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/jobList">훈련직종구분</a>
						<a class="list-group-item" href="${pageContext.request.contextPath}/basicInfo/tuitionList">훈련비구분</a>
					</div>

					<a class="list-group-item active" href="${pageContext.request.contextPath}/lecturerList">강사목록</a> <a
						data-toggle="collapse" href="#StudentCallapse"
						class="list-group-item callapseItem"> 훈련생관리 <span
						class="caret" style="float: right"> </span></a>
					<div class="list-group collapse" id="StudentCallapse">
						<a class="list-group-item" href="${pageContext.request.contextPath}/studentList">전체훈련생</a> 
						<a class="list-group-item" href="#">입실관리</a>
					</div>

					<a class="list-group-item " href="${pageContext.request.contextPath}/companyList" >협약기업관리</a>  
						
					<a class="list-group-item" href="${pageContext.request.contextPath}/ocList" >개설과정관리</a>

				</div>
			</div>
			<!-- main DIV GROUP -->
			<div class="col-md-10 text-left" style="padding: 0px;"
				id="dataResult">


				<div class="panel panel-info">
					<div class="panel-heading">강사목록</div>
					<div class="panel-body">
						
							<table class="table table-hover">
								<thead>
									<tr>
										<th>강사번호</th>
										<th>강사명</th>
										<th>전화번호</th>
										<th>과목변경</th>
										<th>과목목록</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lr" items="${tableData}">
										<tr>
											<td>${lr.lec_id}</td>
											<td>${lr.lec_name}</td>
											<td>${lr.lec_tel}</td>
											<td><div class="btn-group">
													<button type="button"
														class="btn btn-xs btn-default btn-lecsubInsert"
														value="${lr.lec_id}">등록</button>
													<button type="button"
														class="btn btn-xs btn-danger btn-lecsubDelete"
														value="${lr.lec_id}">삭제</button>
												</div></td>
											<td>${lr.lec_sub}</td>
											<td><button
													class="btn btn-default btn-sm btn-lecturerInfo"
													value="${lr.lec_id}">수정</button></td>
											<td><button
													class="btn btn-danger btn-sm btn-lecturerDelete"
													value="${lr.lec_id}">삭제</button></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						<hr>
						<a type="button" class="btn btn-default">전체 <span
							class="badge" id="count">${count }</span></a>
						<button type="button" class="btn btn-info btnInsert">등록</button>

						<div class="form-inline" style="float: right" id="lecturerSearch">
						<form>
							<select class="form-control" name="key" id="key">
								<option value="lec_id">강사번호</option>
								<option value="lec_name">강사명</option>
								<option value="lec_sub">강의과목</option>
							</select> 
							<label for="searchText">검색:</label> 
							<input type="text" class="form-control" name="value" id="value">
							<button type="submit" class="btn btn-primary btnSearch">검색</button>
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
								<h4 class="modal-title">강사-수정</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/lecturerUpdate" method="POST"
									class="form-inline" id="lecturerInfo">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="lec_id">No : </label><br> <label
												for="lec_name">강사명 : </label><br> <label
												for="lec_tel">전화번호 : </label><br> <label
												for="lec_sub">강의과목 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="lec_id"
												disabled> <input type="hidden" name="lec_id">
											<input type="text" class="form-control" name="lec_name"
												id="lec_name"> <input type="text"
												class="form-control" name="lec_tel" id="lec_tel">
											<input type="text" class="form-control" name="lec_sub"
												id="lec_sub" disabled>
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
								<h4 class="modal-title">강사-삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/lecturerDelete" method="POST"
									class="form-inline" id="lecturerDelete">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="lec_id">No : </label><br> <label
												for="lec_name">강사명 : </label><br> <label
												for="lec_tel">전화번호 : </label><br> <label
												for="lec_sub">강의과목 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="lec_id"
												disabled> <input type="hidden" name="lec_id">
											<input type="text" class="form-control"
												name="lec_name" id="lec_name"> <input
												type="text" class="form-control" name="lec_tel"
												id="lec_tel"> <input type="text"
												class="form-control" name="lec_sub"
												id="lec_sub" disabled>
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
								<h4 class="modal-title">강사-등록</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/lecturerInsert" method="POST"
									class="form-inline" id="lecturerInsert">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="lec_name">강사명 : </label><br> <label
												for="lec_tel">전화번호 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control"
												name="lec_name" id="lec_name"> <input
												type="text" class="form-control" name="lec_tel"
												id="lec_tel">
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
				<!-- 강의과목등록Modal -->
				<div id="lecsubModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">강사-과목등록</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/insertLecsub" method="POST"
									class="form-inline" id="lecturerLecsub">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="lec_id">No : </label><br> <label
												for="lec_name">강사명 : </label><br> <label
												for="sub_id">과목명 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control"
												id="lec_id" disabled> <input
												type="hidden" name="lec_id"> <input
												type="text" class="form-control"
												name="lec_name" id="lec_name"
												disabled> <select class="form-control"
												name="sub_id" id="sub_id">

											</select>
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

				<!-- 강의과목삭제Modal -->
				<div id="lecsubDeleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">강사-과목삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/deleteLecsub" method="POST"
									class="form-inline" id="lecturerLecsub">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="lec_id">No : </label><br> <label
												for="lec_name">강사명 : </label><br> <label
												for="sub_id">과목명 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control"
												id="lec_id" disabled> <input
												type="hidden" name="lec_id"> <input
												type="text" class="form-control"
												name="lec_name" id="lec_name"
												disabled> <select class="form-control"
												name="sub_id" id="sub_id">

											</select>
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