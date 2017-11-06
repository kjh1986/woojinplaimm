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
		if("${code}"=="100"){
			window.alert("개설과정입력이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("개설과정입력이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("개설과정수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("개설과정수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("개설과정삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("개설과정삭제가 실패했습니다.");
		}else if("${code}"=="400"){
			window.alert("개설과목등록이 완료 되었습니다.");
		}else if("${code}"=="401"){
			window.alert("개설과목등록이 실패했습니다.");
		}else if("${code}"=="500"){
			window.alert("개설과목삭제가 완료 되었습니다.");
		}else if("${code}"=="501"){
			window.alert("개설과목삭제가 실패했습니다.");
		}
		
		
		$("#insertModal input#oc_start_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd" 
		});
		$("#insertModal input#oc_finish_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		
		
		 $('[data-toggle="tooltip"]').tooltip();
		//수정액션리스너 
		$("button.btn-ocInfo").on("click",function(){
			var oc_id = $(this).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/ocInfo",
				data : {oc_id:oc_id},
				success : function(data){
					$("#infoModal").html(data);
					
					$("#infoModal").modal();
				}
			});
		});

		//삭제액션리스너 
		$("button.btn-ocDelete").on("click",function(){
			var oc_id = $(this).attr("value");
			var course_name = $(this).parents("tr").find("td:nth-child(2) button").text();
			
			$("#deleteModal input#oc_id").val(oc_id);
			$("#deleteModal input[name=oc_id]").val(oc_id);
			$("#deleteModal input#course_name").val(course_name);
			
			$("#deleteModal").modal();
		});

		//검색액션리스너 
		$("#ocSearchForm select#ing").on("change",function(){
			$("#ocSearchForm").submit();
			
		});
		
		//등록 액션 리스너
		$(".btnInsert").on("click",function(){
			$("#insertModal").modal();
		});

		$("#key option[value=${key}]").attr("selected","selected");
		$("#ing option[value=${ing}]").attr("selected","selected");
		$("#value").val("${value}");
		
		
		$("#osInsertModal #sub_id").on("change", function(){
			var sub_id = $(this).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/ocOsLecList",
				data : {sub_id:sub_id},
				success: function(data){
					var options ="";
					for(idx in data){
						options += "<option value='"+data[idx].lec_id+"'>"+data[idx].lec_name+"</option>";
					}
					$("select#lec_id").html(options);
				}
			});
		});
		
		
		//과목등록액션
		$(".btn-ocsubInsert").on("click", function(){
			var oc_id = $(this).val();
			var course_name = $(this).parents("tr").find("td:nth-child(2) button").text();
			var subs = $(this).parents("tr").children("td:nth-child(9)").text();
			$("#osInsertModal input[name=oc_id]").val(oc_id);
			$("#osInsertModal input#oc_id").val(oc_id);
			$("#osInsertModal input#subs").val(subs);
			$("#osInsertModal input#course_name").val(course_name);
			$("#osInsertModal").modal();
		});
		
		//과목삭제액션
		$(".btn-ocsubDelete").on("click", function(){
			var oc_id = $(this).val();
			var course_name = $(this).parents("tr").find("td:nth-child(2) button").text();
			var subs = $(this).parents("tr").children("td:nth-child(9)").text();
			$("#osDeleteModal input[name=oc_id]").val(oc_id);
			$("#osDeleteModal input#oc_id").val(oc_id);
			$("#osDeleteModal input#subs").val(subs);
			$("#osDeleteModal input#course_name").val(course_name);
			$.ajax({
				url : "${pageContext.request.contextPath}/ocOsDeleteList",
				data : {oc_id:oc_id},
				success: function(data){
					var options ="";
					for(idx in data){
						options+="<option value='"+data[idx].os_id+"'>"+data[idx].lecsub+"</option>";
					}
					$("select#os_id").html(options);
				}
			});
			$("#osDeleteModal").modal();
		});
		
		//수강생등록페이지연결
		$(".btn-tcOcList").on("click",function(){
			var oc_id = $(this).val();
			$("form#tcOcList input[name=oc_id]").val(oc_id);
			$("form#tcOcList").submit();
		});
		
		//페이징처리
		var totalPages = ${totalPages};//전체 페이지
        var visiblePages = 10;//리스트 보여줄 페이지
        var startPage = $('#startPage').val();//현재 페이지
         
        $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: visiblePages,
            startPage: startPage,
            onPageClick: function (event, page) {
                $('#startPage').val(page);//보고 싶은 페이지
                $('#visiblePages').val(visiblePages);
                $("#ocSearchForm").submit();
            }
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
						
					<a class="list-group-item active" href="${pageContext.request.contextPath}/ocList" >개설과정관리</a>

				</div>
			</div>
			<!-- main DIV GROUP -->
			<div class="col-md-10 text-left" style="padding:0px;" id="dataResult" >
				<div class="panel panel-info">
					<div class="panel-heading">과정목록</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>개설과정번호</th>
									<th>개설과정명</th>
									<th>구분명</th>
									<th>직종명</th>
									<th>과정기간</th>
									<th>목표인원</th>
									<th>교육시간</th>
									<th>훈련비</th>
									<th>과목등록</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var = "oc" items="${tableData}">
									<tr>
										<td>${oc.oc_id}</td>
										<td>
										<button type="button" class="btn btn-link btn-tcOcList" style="padding-top:0" data-toggle="tooltip" title="클릭시 훈련생 등록" value="${oc.oc_id}">${oc.course_name}</button>
										</td>
										<td>${oc.ocd_name}</td>
										<td>${oc.job_family_name}</td>
										<td>${oc.oc_start_date} ~ ${oc.oc_finish_date}</td>
										<td>${oc.oc_goals_num}</td>
										<td>${oc.oc_timeofedu}</td>
										<td>${oc.money}원</td>
										<td style="display:none">${oc.subs}</td>
										<td><div class="btn-group">
											<button type="button" class="btn btn-sm btn-default btn-ocsubInsert"
												value="${oc.oc_id}">등록</button>
											<button type="button" class="btn btn-sm btn-danger btn-ocsubDelete"
												value="${oc.oc_id}">삭제</button>
										</div></td>
										<td><button class="btn btn-default btn-sm btn-ocInfo" value="${oc.oc_id}">수정</button></td>
										<td><button class="btn btn-danger btn-sm btn-ocDelete" value="${oc.oc_id}">삭제</button></td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
						<div class="col-md-12" align="center">
			               	<ul id="pagination" class="pagination"></ul><!-- 페이지네이션 -->
			           	</div>
                 	
						
						
						<button type="button" class="btn btn-default">전체 
						<span class="badge" id="count">${totalCount }</span></button>
						<button type="button" class="btn btn-default">검색 
						<span class="badge" id="count">${count }</span></button>
						<button type="button" class="btn btn-info btnInsert">등록</button>
						<div class="form-inline" style="float:right" >
						<form id="ocSearchForm">
							<select class="form-control" name="ing" id="ing">
								<option value="all">전체</option>
								<option value="end">종료</option>
								<option value="ing">진행중</option>
								<option value="yet">개설예정</option>
							</select>
							<select class="form-control" name="key" id="key">
								<option value="all">전체</option>
								<option value="oc_id">개설과정번호</option>
								<option value="course_name">과정명</option>
								<option value="ocd_name">구분명</option>
								<option value="job_famliy_name">직종명</option>
								<option value="subs">강사명</option>
							</select>
							<label for="searchText">검색:</label> 
							<input type="text" class="form-control" name="value" id="value">
							<button type="submit" class="btn btn-primary btnSearch btn-submit">검색</button>
							
							<!-- 페이징을 위한 hidden타입 추가 -->
							<input type="hidden" name="init" value="${init}">
							<input type="hidden" id="startPage" name="startPage" value="1">
							</form>
						</div>
					</div>
					
						
					
				</div>
			
				<form action="${pageContext.request.contextPath}/tcOcList" id="tcOcList">
					<input type="hidden" name="oc_id" value="">
				</form>
			<!-- info Modal -->
				<div id="infoModal" class="modal fade" role="dialog">
					
				</div>
				
				<!-- delete Modal -->
				<div id="deleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
			
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">개설과정-삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/ocDelete" class="form-inline" method="POST">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="delete_oc_id">No : </label><br>
											<label for="delete_course_name">과정명 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="oc_id" disabled>
											<input type="hidden" name="oc_id">
											<input type="text" class="form-control" name="course_name" id="course_name">
										</div>
									</div>
									
									<hr>
									<div style="text-align: right">	
										<button type="submit" class="btn btn-danger btn-submit">삭제</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
								<h4 class="modal-title">과정등록</h4>
							</div>
							<div class="modal-body">
								<form class="form-inline" action="${pageContext.request.contextPath}/ocInsert" method="POST">
									<div class="row">
										<div class="col-md-4" style="text-align: right">

											<label for="course_id">과정명 : </label><br> 
											<label for="oc_start_date">시작일 : </label><br> 
											<label for="oc_finish_date">종료일 : </label><br> 
											<label for="ocd_code">구분명 : </label><br> 
											<label for="job_family_code">직종명 : </label><br> 
											<label for="oc_goals_num">목표인원 : </label><br> 
											<label for="oc_timeofedu">교육시간 : </label><br>
											<label for="money">훈련비 : </label><br>
										</div>
										<div class="col-md-6">
											<select class="form-control" name="course_id" id="course_id">
												<c:forEach var="co" items="${courses }">
													<option value="${co.course_id }">${co.course_name }</option>
												</c:forEach>
											</select><br>
											<input type="text" class="form-control" name="oc_start_date"
												id="oc_start_date"> 
											<input type="text" class="form-control" name="oc_finish_date"
												id="oc_finish_date"> 
											<select class="form-control" name="ocd_code" id="ocd_code">
												<c:forEach var="ocd" items="${ocds }">
													<option value="${ocd.ocd_code }">${ocd.ocd_name }</option>
												</c:forEach>
											</select><br>
											<select class="form-control" name="job_family_code" id="job_family_code">
												<c:forEach var="jf" items="${jfs }">
													<option value="${jf.job_family_code }">${jf.job_family_name }</option>
												</c:forEach>
											</select><br>	
											<input type="number" class="form-control" name="oc_goals_num"
												id="oc_goals_num"> 
											<input type="number" class="form-control" name="oc_timeofedu"
												id="oc_timeofedu">
											<input type="number" class="form-control" name="money"
												id="money">
										</div>
									</div>
									<hr>
									<div style="text-align: right">
										<button type="submit" class="btn btn-default btn-submit">등록</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							
									</div>
								</form>
							</div>
							
						</div>
			
					</div>
				</div>
				
			
			</div>
		</div>
	</div>
	
	<!-- 과목insert Modal -->
	<div id="osInsertModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목등록</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/ocOsInsert" method="POST">
						<div class="row">
							<div class="col-md-4" style="text-align: right">
								<input type="hidden" name="oc_id"> <label for="oc_id">과정번호
									: </label><br> <label for="course_name">과정명 : </label><br> <label
									for="subs">현재과목 : </label><br> <label for="sub_id">과목명
									: </label><br> <label for="lec_id">강사명 : </label><br>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="oc_id" value=""
									disabled> <input type="text" class="form-control"
									id="course_name" value="" disabled> <input type="text"
									class="form-control" id="subs" value="" disabled> <select
									class="form-control" name="sub_id" id="sub_id">
									<c:forEach var="sub" items="${subjects }">
										<option value="${sub.sub_id }">${sub.sub_name }</option>
									</c:forEach>
								</select> <select class="form-control" name="lec_id" id="lec_id">

								</select><br>
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
	
	<!-- 과목insert Modal -->
	<div id="osDeleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목삭제</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/ocOsDelete" method="POST">
						<div class="row">
							<div class="col-md-4" style="text-align: right">
								<input type="hidden" name="oc_id"> 
								<label for="oc_id">과정번호: </label><br> 
								<label for="course_name">과정명 : </label><br> 
								<label for="subs">현재과목 : </label><br> 
								<label for="os_id">과목명: </label><br> 
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="oc_id" value="" disabled> 
								<input type="text" class="form-control" id="course_name" value="" disabled> 
								<input type="text" class="form-control" id="subs" value="" disabled> 
								<select class="form-control" name="os_id" id="os_id">
								
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

	

</body>

</html>
	
