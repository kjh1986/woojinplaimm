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
			window.alert("훈련생입력이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("훈련생입력이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("훈련생수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("훈련생수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("훈련생삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("훈련생삭제가 실패했습니다.");
		}else if("${code}"=="400"){
			window.alert("훈련생유형등록이 완료 되었습니다.");
		}else if("${code}"=="401"){
			window.alert("훈련생유형등록이 실패했습니다.");
		}else if("${code}"=="500"){
			window.alert("훈련생유형삭제가 완료 되었습니다.");
		}else if("${code}"=="501"){
			window.alert("훈련생유형삭제가 실패했습니다.");
		}else if("${code}"=="600"){
			window.alert("기업훈련생등록이 완료 되었습니다.");
		}else if("${code}"=="601"){
			window.alert("기업훈련생등록이 실패했습니다.");
		}else if("${code}"=="700"){
			window.alert("기업훈련생수정이 완료 되었습니다.");
		}else if("${code}"=="701"){
			window.alert("기업훈련생수정이 실패했습니다.");
		}else if("${code}"=="800"){
			window.alert("기업훈련생삭제가 완료 되었습니다.");
		}else if("${code}"=="801"){
			window.alert("기업훈련생삭제가 실패했습니다.");
		}else if("${code}"=="900"){
			window.alert("양성훈련생등록이 완료 되었습니다.");
		}else if("${code}"=="901"){
			window.alert("양성훈련생등록이 실패했습니다.");
		}else if("${code}"=="1000"){
			window.alert("양성훈련생수정이 완료 되었습니다.");
		}else if("${code}"=="1001"){
			window.alert("양성훈련생수정이 실패했습니다.");
		}else if("${code}"=="1100"){
			window.alert("양성훈련생삭제가 완료 되었습니다.");
		}else if("${code}"=="1101"){
			window.alert("양성훈련생삭제가 실패했습니다.");
		}else if("${code}"=="1200"){
			window.alert("훈련생사진등록이 완료 되었습니다.");
		}else if("${code}"=="1201"){
			window.alert("훈련생사진등록이 실패했습니다.");
		}
		//수정액션리스너 
		$("button.btn-studentInfo").on("click",function(){
			var st_id = $(this).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/studentInfo",
				data : {st_id:st_id},
				success : function(data){
					$("#infoModal").html(data);
					
					$("#infoModal").modal();
				}
			});
			
		});

		//삭제액션리스너 
		$("button.btn-studentDelete").on("click",function(){
			var st_id = $(this).attr("value");
			var st_name = $(this).parents("tr").children(":nth-child(3)").text();
			$("#deleteModal input#st_id").val(st_id);
			$("#deleteModal input[name=st_id]").val(st_id);
			$("#deleteModal input#st_name").val(st_name);
			$("#deleteModal").modal();
		});
		
		$("button.btnExcel").on("click", function(){
			$("#studentExcelForm").submit();
		});

	
		
		//검색액션리스너 
		$("#studentSearchForm select[name=std_code]").on("change",function(){
			$("#studentSearchForm").submit();
			
		});
		//등록 액션 리스너
		$(".btnInsert").on("click",function(){
			$("#insertModal").modal();
		});

		$("#studentSearchForm #key option[value=${key}]").attr("selected","selected");
		$("#studentSearchForm #value").val("${value}");

		$("#studentExcelForm #key").val("${key}");
		$("#studentExcelForm #std_code").val("${std_code}");
		$("#studentExcelForm #value").val("${value}");
		
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
                $("#studentSearchForm").submit();
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
					<div class="list-group collapse in" id="StudentCallapse">
						<a class="list-group-item active" href="${pageContext.request.contextPath}/studentList">전체훈련생</a> 
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
					<div class="panel-heading">훈련생목록</div>
					<div class="panel-body">
						
							<table class="table table-hover">
								<thead>
									<tr>
										<th>훈련생번호</th>
										<th>유형</th>
										<th>훈련생명</th>
										<th>나이</th>
										<th>생년월일</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>차량번호</th>
										<th>등록일</th>
										<th>상세/수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody class="tableData">
								<c:choose>
								<c:when test="${empty tableData}">
									<tr><td colspan="11" style="text-align: center">
									<strong>검색결과가 없습니다.</strong></td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="st" items="${tableData}">
										<tr>
											<td>${st.st_id}</td>
											<td>${st.std_name}</td>
											<td>${st.st_name}</td>
											<td>${st.st_age}</td>
											<td>${st.st_birth}</td>
											<td>${st.st_tel}</td>
											<td>${st.st_email}</td>
											<td>${st.st_carnum}</td>
											<td>${st.st_regdate}</td>
											<td><button class="btn btn-default btn-sm btn-studentInfo" 
											value="${st.st_id}">수정</button></td>
											<td><button
											class="btn btn-danger btn-sm btn-studentDelete"
											value="${st.st_id}">삭제</button></td>

										</tr>
									</c:forEach>
								</c:otherwise>	
								</c:choose>
								</tbody>
							</table>
							<hr>
						<div class="col-md-12" align="center">
                        	<ul id="pagination" class="pagination"></ul><!-- 페이지네이션 -->
                    	</div>


						<a type="button" class="btn btn-default">전체 <span
							class="badge" id="totalCount">${totalCount }</span></a> <a type="button"
							class="btn btn-default">검색 <span class="badge" id="count">${count }</span></a>
						<button type="button" class="btn btn-info btnInsert">등록</button>
						<button type="button" class="btn btn-success btnExcel">Excel</button>
						<form class="form-inline" id="studentExcelForm" action="${pageContext.request.contextPath}/studentExcel" method="POST">
						<input type="hidden" name="key" id="key">
						<input type="hidden" name="std_code" id="std_code">
						<input type="hidden" name="value" id="value">
						</form>

						<div class="form-inline" style="float: right" id="studentSearch">
							<form id="studentSearchForm">
								<select class="form-control" name="std_code">
									<option value="all">전체</option>
									<c:forEach var="d" items="${stds }">
										<option value="${d.std_code }"
											${d.std_code==param.std_code?'selected':'' }>${d.std_name }</option>
									</c:forEach>
								</select> 
								<select class="form-control" name="key" id="key">
									<option value="all">전체</option>
									<option value="st_id">훈련생번호</option>
									<option value="st_name">훈련생명</option>
									<option value="st_tel">전화번호</option>
									<option value="com_name">소속기업</option>
								</select> <label for="searchText">검색:</label> 
								<input type="text" class="form-control" name="value" id="value">
								<button type="submit" class="btn btn-primary btnSearch">검색</button>
								
								<!-- 페이징을 위한 hidden타입 추가 -->
								<input type="hidden" name="init" value="${init}">
								<input type="hidden" id="startPage" name="startPage" value="1">
                       			
							</form>
						</div>
					</div>



				</div>


				<!-- info Modal -->
				<div id="infoModal" class="modal fade" role="dialog">
				<!-- 상세정보표시 AJAX요청 전달받는 부분 -->
				
				</div>

				<!-- delete Modal -->
				<div id="deleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">훈련생-삭제</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/studentDelete" method="POST"
									class="form-inline" id="lecturerDelete">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="st_id">No : </label><br> <label
												for="st_name">훈련생명 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="st_id"
												disabled> <input type="hidden" name="st_id">
											<input type="text" class="form-control" name="st_name"
												id="st_name">
										</div>
									</div>
									
										<div style="text-align: center"><br><span class="text-danger">* 훈련생 삭제시 등록된 상세정보도 삭제됩니다.</span></div>
									
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
								<h4 class="modal-title">훈련생-등록</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/studentInsert" method="POST"
									class="form-inline" id="studentInsert">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="_st_name">훈련생명 : </label><br> <label
												for="st_ssn">주민번호 : </label><br> <label
												for="st_tel">전화번호 : </label><br> <label
												for="st_email">이메일 : </label><br> <label
												for="st_carnum">차량번호 : </label><br>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" name="st_name"
												id="st_name" value="${student.st_name }"> <input
												type="text" class="form-control" name="st_ssn"
												id="st_ssn" value="${student.st_ssn }"> <input
												type="text" class="form-control" name="st_tel"
												id="st_tel" value="${student.st_tel }"> <input
												type="text" class="form-control" name="st_email"
												id="st_email" value="${student.st_email }"> <input
												type="text" class="form-control" name="st_carnum"
												id="st_carnum" value="${student.st_carnum }">
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