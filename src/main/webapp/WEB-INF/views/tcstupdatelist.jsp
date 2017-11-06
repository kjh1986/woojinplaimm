<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>우진플라임 교육관리 시스템 v1.0</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/script/wj-style.css">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/twbsPagination.js"></script>

<script>
	$(document).ready(function() {
		if("${code}"=="100"){
			window.alert("수강등록이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("수강등록이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("수강생수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("수강생수정이 실패했습니다.");
		}else if("${code}"=="600"){
			window.alert("수강취소가 완료 되었습니다.");
		}else if("${code}"=="601"){
			window.alert("수강취소가 실패했습니다.");
		}
	
	
		//개설과정별 수정 액션 리스너
		$(".btn-tcstUpdate").on("click", function(){
			var tc_id = $(this).val();
			var st_id = $(this).parents("tr").children("td:nth-child(1)").text();
			var st_name = $(this).parents("tr").children(":nth-child(3)").text();
			var t_code = $(this).parents("tr").children(":nth-child(8)").text();
			var tc_sale = $(this).parents("tr").children(":nth-child(7)").text();
			$("#tcUpdateModal input[name=tc_id]").val(tc_id);
			$("#tcUpdateModal input[name=st_id]").val(st_id);
			$("#tcUpdateModal input#st_name").val(st_name);
			$("#tcUpdateModal select#t_code").val(t_code);
			$("#tcUpdateModal input#tc_sale").val(tc_sale);
			$("#tcUpdateModal").modal({backdrop: false});
		});
		$(".btn-tcstDelete").on("click",function(){
			var tc_id = $(this).val();
			var st_id = $(this).parents("tr").children("td:nth-child(1)").text();
			var st_name = $(this).parents("tr").children(":nth-child(3)").text();
			var t_code = $(this).parents("tr").children(":nth-child(8)").text();
			var tc_sale = $(this).parents("tr").children(":nth-child(7)").text();
			$("#tcDeleteModal input[name=tc_id]").val(tc_id);
			$("#tcDeleteModal input[name=st_id]").val(st_id);
			$("#tcDeleteModal input#st_name").val(st_name);
			$("#tcDeleteModal select#t_code").val(t_code);
			$("#tcDeleteModal input#tc_sale").val(tc_sale);
			$("#tcDeleteModal").modal({backdrop: false});
		});
		
		 //중탈여부변경
        $(".tc_drop").on("click",function(){
        	var tc_id = $(this).val();
        	var tc_drop = $(this).attr("checked");
        	$("#tc_dropForm input[name=tc_id]").val(tc_id);
        	$("#tc_dropForm input[name=tc_drop]").val(tc_drop);
        	
        	$("#tc_dropForm").submit();
        });
		
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
						훈련생목록-수정/삭제</div>
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
							<a class="btn btn-primary btn-tcUpdate" href="${pageContext.request.contextPath}/tcStUpdateList?oc_id=${oc.oc_id }">
							수정/삭제</a>
							<a class="btn btn-default btn-tcComplete" href="${pageContext.request.contextPath}/tcCompleteList?oc_id=${oc.oc_id }">
							수료관리</a>
							<a class="btn btn-default btn-tcInsert" href="${pageContext.request.contextPath}/tcOcList?oc_id=${oc.oc_id }">
							추가등록</a>
						</div>
						</div>
						<hr>	
					</div>
					<div class="panel-body" id="studentList">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>훈련생번호</th>
									<th>유형</th>
									<th>훈련생명</th>
									<th>나이</th>
									<th>생년월일</th>
									<th>훈련비구분</th>
									<th>할인액</th>
									<th>중도탈락</th>
									<th>수정</th>
									<th>수강취소</th>
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
												<td>${st.st_id}</td>
												<td>${st.std_name}</td>
												<td><button type="button" class="btn btn-link btn-studentInfo" value="${st.st_id}">${st.st_name}</button></td>
												<td>${st.st_age}</td>
												<td>${st.st_birth}</td>
												<td>${st.t_name}</td>
												<td>${st.tc_sale}</td>
												<td style="display:none">${st.t_code}</td>
												<td><input type="checkbox" class="tc_drop" value="${st.tc_id}" ${st.tc_drop == 'drop'?'checked':''}></td>
												<td><button class="btn btn-default btn-sm btn-tcstUpdate"
														value="${st.tc_id}" ${st.tc_complete == 'complete'?'disabled':'' } ${st.tc_drop == 'drop'?'disabled':'' }>수정</button></td>
												<td><button class="btn btn-danger btn-sm btn-tcstDelete"
														value="${st.tc_id}" ${st.tc_complete == 'complete'?'disabled':'' } ${st.tc_drop == 'drop'?'disabled':'' }>수강취소</button></td>
						
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<hr>
				</div>
				
			</div>



		</div>
		<!-- 중탈자변경 히든 폼 -->
		<form action="${pageContext.request.contextPath}/tcDrop" method="POST" id="tc_dropForm">
			<input type="hidden" name="tc_id">
			<input type="hidden" name="tc_drop">
			<input type="hidden" name="oc_id" value="${oc.oc_id }">
		</form>
		<!-- tc수정모달 -->
		<div id="tcUpdateModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">개설과정-훈련생수정</h4>
					</div>
					<div class="modal-body">
						
						<form method="POST" class="form" action="${pageContext.request.contextPath}/tcstUpdate">
							<div class="row">
								<div class="col-md-4" style="text-align: right">
									<label for="oc_id">개설과정번호 : </label><br>
									<label for="course_name">과정명 : </label><br> 
									<label for="st_name">훈련생명 : </label><br> 
									<label for="t_code">훈련비구분 : </label><br> 
									<label for="tc_sale">할인액 : </label><br> 
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="oc_id" value="${oc.oc_id }" disabled>
									<input type="hidden" name="oc_id" value="${oc.oc_id }" >
									<input type="text" class="form-control" id="course_name" value="${oc.course_name }" disabled>
									<input type="hidden" name="st_id" value="">
									<input type="text" class="form-control" id="st_name" value="" disabled>
									<select class="form-control" id="t_code" name="t_code">
										<c:forEach var="t" items="${tcodes }">
											<option value="${t.t_code }">${t.t_name }</option>
										</c:forEach>
									</select>
									<input type="number" class="form-control" id="tc_sale" name="tc_sale" value="">
									<input type="hidden" name="tc_id" value="" >
									
								</div>
							</div>
							<hr>
							<div style="text-align: right">
								<button type="submit" class="btn btn-default btn-tcstUpdateSubmit">수정</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
		<!-- delete Modal -->
		<div id="tcDeleteModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">개설과정-훈련생삭제</h4>
					</div>
					<div class="modal-body">
						<form method="POST" class="form" action="${pageContext.request.contextPath}/tcstDelete">

							<div class="row">
								<div class="col-md-4" style="text-align: right">
									<label for="oc_id">개설과정번호 : </label><br>
									<label for="course_name">과정명 : </label><br> 
									<label for="st_name">훈련생명 : </label><br> 
									<label for="t_code">훈련비구분 : </label><br> 
									<label for="tc_sale">할인액 : </label><br> 
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="oc_id" value="${oc.oc_id }" disabled>
									<input type="hidden" name="oc_id" value="${oc.oc_id }" >
									<input type="text" class="form-control" id="course_name" value="${oc.course_name }" disabled>
									<input type="hidden" name="st_id" value="">
									<input type="text" class="form-control" id="st_name" value="" disabled>
									<select class="form-control" id="t_code" name="t_code" disabled>
										<c:forEach var="t" items="${tcodes }">
											<option value="${t.t_code }">${t.t_name }</option>
										</c:forEach>
									</select>
									<input type="number" class="form-control" id="tc_sale" name="tc_sale" value="" disabled>
									<input type="hidden" name="tc_id" value="" >
									
								</div>
							</div>
							<hr>
							<div style="text-align: right">
								<button type="submit" class="btn btn-danger btn-tcstDeleteSubmit">수강취소</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
				<!-- info Modal -->
				<div id="infoModal" class="modal fade" role="dialog">
				<!-- 상세정보표시 AJAX요청 전달받는 부분 -->
				
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


</body>

</html>
	
