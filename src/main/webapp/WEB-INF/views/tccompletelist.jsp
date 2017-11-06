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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/script/wj-style.css">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/twbsPagination.js"></script>

<script>
	$(document).ready(function() {
		if("${code}"=="400"){
			window.alert("수료등록이 완료 되었습니다.");
		}else if("${code}"=="401"){
			window.alert("수료등록이 실패했습니다.");
		}else if("${code}"=="402"){
			window.alert("등록할 수료생을 선택해주세요.");
		}else if("${code}"=="500"){
			window.alert("수료수정이 완료 되었습니다.");
		}else if("${code}"=="501"){
			window.alert("수료수정이 실패했습니다.");
		}else if("${code}"=="600"){
			window.alert("수료취소가 완료 되었습니다.");
		}else if("${code}"=="601"){
			window.alert("수료취소가 실패했습니다.");
		}
		//훈련생정보 
		$("button.btn-studentInfo").on("click",function(){
			var st_id = $(this).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/studentInfo",
				data : {st_id:st_id},
				success : function(data){
					$("#infoModal").html(data);
					$("#infoModal button[type=submit]").attr("disabled","disabled");
					$("#infoModal button.btn-stdDelete").attr("disabled","disabled");
					
					$("#infoModal").modal();
				}
			});
			
		});
		
		$("button.btnUpdate").on("click", function(){
			var cs_id = $(this).val();
			var st_name = $(this).parents("tr").find("td:nth-child(4)").text();
			var cs_date = $(this).parents("tr").find("td:nth-child(8)").text();
			$("#updateModal input[name=cs_id]").val(cs_id);
			$("#updateModal input[name=old_cs_id]").val(cs_id);
			$("#updateModal input#st_name").val(st_name);
			$("#updateModal input[name=cs_date]").val(cs_date);
			$("#updateModal").modal();
		});
		$("button.btnDelete").on("click", function(){
			var cs_id = $(this).val();
			var st_name = $(this).parents("tr").find("td:nth-child(4)").text();
			$("#deleteModal input[name=cs_id]").val(cs_id);
			$("#deleteModal input#cs_id").val(cs_id);
			$("#deleteModal input#st_name").val(st_name);
			$("#deleteModal").modal();
		});
 
        
		$("button.csInsert").on("click", function(){
			var cs_date = $("#insertModal input[name=cs_date]").val();
			console.log(cs_date);
			$("#csInsertForm input[name=cs_date]").val(cs_date);
			$("#csInsertForm").submit();
		});
	
		

	});
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
					<div class="panel-heading">${oc.course_name }(${oc.oc_id })
						훈련생목록-수료관리</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>개설과정명</th>
									<th>구분명</th>
									<th>직종명</th>
									<th>과정기간</th>
									<th>목표인원</th>
									<th>교육시간</th>
									<th>훈련비</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>${oc.course_name}</td>
									<td>${oc.ocd_name}</td>
									<td>${oc.job_family_name}</td>
									<td>${oc.oc_start_date} ~ ${oc.oc_finish_date} ( ${oc.ing=='yet'?'예정':(oc.ing=='end'?'종료':'진행중') } )</td>
									<td>${oc.oc_goals_num}</td>
									<td>${oc.oc_timeofedu}</td>
									<td>${oc.money}원</td>
									
								</tr>

							</tbody>
						</table>
						
						<div style="text-align: right">
						<div class="btn-group">
							<a class="btn btn-default btn-tcUpdate" href="${pageContext.request.contextPath}/tcStUpdateList?oc_id=${oc.oc_id }">
							수정/삭제</a>
							<a class="btn btn-primary btn-tcComplete" href="${pageContext.request.contextPath}/tcCompleteList?oc_id=${oc.oc_id }">
							수료관리</a>
							<a class="btn btn-default btn-tcInsert" href="${pageContext.request.contextPath}/tcOcList?oc_id=${oc.oc_id }">
							추가등록</a>
						</div>
						</div>	
						<hr>	
					</div>
					<div class="panel-body" id="studentList">
						<form action="${pageContext.request.contextPath}/csInsert" id="csInsertForm" method="POST">
							<input type="hidden" name = "oc_id" value="${oc.oc_id }">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>선택</th>
										<th>훈련생번호</th>
										<th>유형</th>
										<th>훈련생명</th>
										<th>훈련비구분</th>
										<th>할인액</th>
										<th>수료번호</th>
										<th>수료일</th>
										<th>수정</th>
										<th>수료취소</th>
									</tr>
								</thead>
								<tbody class="tableData">
									<c:choose>
										<c:when test="${empty tableData}">
											<tr>
												<td colspan="11" style="text-align: center"><strong>검색결과가
														없습니다.</strong></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="st" items="${tableData}">
												<tr ${st.tc_drop == "drop"?"style='background-color:#ffeeee'":""}>
													<td>
													<input type="checkbox" name="tc_id" value="${st.tc_id}" ${st.tc_drop == "drop"?"disabled":""}>
													</td>
													<td>${st.st_id}</td>
													<td>${st.std_name}</td>
													<td><button type="button" class="btn btn-link btn-studentInfo" value="${st.st_id}">${st.st_name}</button></td>
													<td>${st.t_name}</td>
													<td>${st.tc_sale}</td>
													<td>${st.cs_id}</td>
													<td>${st.cs_date == null?'':st.cs_date}</td>
													<td><button type="button" class="btn btn-default btnUpdate" value="${st.cs_id}" ${st.tc_complete =='none'?'disabled':''}>수정</button></td>
													<td><button type="button" class="btn btn-danger btnDelete" value="${st.cs_id}" ${st.tc_complete =='none'?'disabled':''}>수료취소</button></td>
							
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							
							<input type="hidden" name="cs_date">
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#insertModal">수료등록</button>
						</form>
						
				</div>
				
			</div>



		</div>
						<!-- info Modal -->
				<div id="infoModal" class="modal fade" role="dialog">
				<!-- 상세정보표시 AJAX요청 전달받는 부분 -->
				
				</div>

	<!-- 수료생 등록 모달-->
	<div id="insertModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수료생 등록</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2">
					<label for="cs_date">수료일 : </label></div>
					<div class="col-md-5">
					<input type="text" class="form-control" name="cs_date" id="cs_date"></div>
					<div class="col-md-4">
					<button type="button" class="btn btn-default csInsert">등록</button></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- 수료생 수정 모달-->
	<div id="updateModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수료생 수정</h4>
				</div>
				<div class="modal-body">
					<form class="form-inline" method="POST"
						action="${pageContext.request.contextPath}/csUpdate">
						<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-2">
						<label for="cs_id">수료번호 : </label><br>
						<label for="cs_id">수료생명 : </label><br>
						<label for="cs_date">수료일 : </label><br>
						<input type="hidden" name="old_cs_id">
						</div>
						<div class="col-md-5">
						<input type="text" class="form-control" name="cs_id" id="cs_id"><br>
						<input type="text" class="form-control" id="st_name" disabled><br>
						<input type="text" class="form-control" name="cs_date" id="up_cs_date"><br>
						</div></div>
						<hr>
						<div style = "text-align: right">
						<button type="submit" class="btn btn-default">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
					
				</div>
				
			</div>

		</div>
	</div>
		<!-- 수료생 삭제 모달-->
	<div id="deleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수료생 수료취소</h4>
				</div>
				<div class="modal-body">
					<form class="form-inline" method="POST"
						action="${pageContext.request.contextPath}/csDelete">
						<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-2">
						<label for="cs_id">수료번호 : </label><br>
						<label for="st_name">수료생명 : </label><br>
						<input type="hidden" name="cs_id">
						</div>
						<div class="col-md-5">
						<input type="text" class="form-control" id="cs_id" disabled><br>
						<input type="text" class="form-control" id="st_name" disabled><br>
						</div></div>
						<hr>
						<div style = "text-align: right">
						<button type="submit" class="btn btn-danger">수료취소</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
					
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
					<p>정말 로그아웃 하시겠습니까? <a href="${pageContext.request.contextPath}/logout?loginCheck=logout" class="btn btn-lg"><span class="glyphicon glyphicon-log-out">확인</span></a>
				<p>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</div>
<script>
$("input#cs_date").datepicker({
	changeMonth : true,
	changeYear : true,
	dateFormat : "yy-mm-dd"
});
$("input#up_cs_date").datepicker({
	changeMonth : true,
	changeYear : true,
	dateFormat : "yy-mm-dd"
});
</script>

</body>

</html>
	
