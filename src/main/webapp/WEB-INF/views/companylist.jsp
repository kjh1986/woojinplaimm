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
			window.alert("기업등록이 완료 되었습니다.");
		}else if("${code}"=="101"){
			window.alert("기업등록이 실패했습니다.");
		}else if("${code}"=="200"){
			window.alert("기업수정이 완료 되었습니다.");
		}else if("${code}"=="201"){
			window.alert("기업수정이 실패했습니다.");
		}else if("${code}"=="300"){
			window.alert("기업삭제가 완료 되었습니다.");
		}else if("${code}"=="301"){
			window.alert("기업삭제가 실패했습니다.");
		}else if("${code}"=="400"){
			window.alert("협약정보등록이 완료 되었습니다.");
		}else if("${code}"=="401"){
			window.alert("협약정보등록이 실패했습니다.");
		}else if("${code}"=="500"){
			window.alert("협약정보수정이 완료 되었습니다.");
		}else if("${code}"=="501"){
			window.alert("협약정보수정이 실패했습니다.");
		}else if("${code}"=="600"){
			window.alert("협약정보삭제가 완료 되었습니다.");
		}else if("${code}"=="601"){
			window.alert("협약정보삭제가 실패했습니다.");
		}else if("${code}"=="700"){
			window.alert("온라인가입이력등록이 완료 되었습니다.");
		}else if("${code}"=="701"){
			window.alert("온라인가입이력등록이 실패했습니다.");
		}else if("${code}"=="800"){
			window.alert("온라인가입이력수정이 완료 되었습니다.");
		}else if("${code}"=="801"){
			window.alert("온라인가입이력수정이 실패했습니다.");
		}else if("${code}"=="900"){
			window.alert("온라인가입이력삭제가 완료 되었습니다.");
		}else if("${code}"=="901"){
			window.alert("온라인가입이력삭제가 실패했습니다.");
		}
		
		$("#oj_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		$("#ac_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		$("#ac_renew_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		$("#ac_cancel_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});

		$("#key option[value=${key}]").attr("selected","selected");
		$("#value").val("${value}");
		
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
        
        $(".btn-comDelete").on("click", function(){
        	var com_id = $(this).attr("value");
			var com_name = $(this).parents("tr").children(":nth-child(2)").text();
			$("#deleteModal input#com_id").val(com_id);
			$("#deleteModal input[name=com_id]").val(com_id);
			$("#deleteModal input#com_name").val(com_name);
			$("#deleteModal").modal();
        });
        $(".btn-comInfo").on("click",function(){
        	
        	var com_id = $(this).attr("value");
			var com_name = $(this).parents("tr").children(":nth-child(2)").text();
			var com_tel = $(this).parents("tr").children(":nth-child(3)").text();
			var com_inurance_id = $(this).parents("tr").children(":nth-child(4)").text();
			var com_empnum = $(this).parents("tr").children(":nth-child(5)").text();
			var com_ceo_name = $(this).parents("tr").children(":nth-child(6)").text();
			var com_postnum = $(this).parents("tr").children(":nth-child(7)").text();
			var com_addr = $(this).parents("tr").children(":nth-child(8)").text();
			var com_type_biz = $(this).parents("tr").children(":nth-child(9)").text();
			var com_type_biz_detail = $(this).parents("tr").children(":nth-child(10)").text();
			var com_note = $(this).parents("tr").children(":nth-child(11)").text();
			var ac_date = $(this).parents("tr").children(":nth-child(12)").text();
			var ac_renew_date = $(this).parents("tr").children(":nth-child(13)").text();
			var ac_cancel_date = $(this).parents("tr").children(":nth-child(14)").text();
			var oj_date = $(this).parents("tr").children(":nth-child(15)").text();
			$("#infoModal input#com_id").val(com_id);
			$("#infoModal input[name=com_id]").val(com_id);
			$("#infoModal input#com_name").val(com_name);
			$("#infoModal input#com_tel").val(com_tel);
			$("#infoModal input#com_inurance_id").val(com_inurance_id);
			$("#infoModal input#com_empnum").val(com_empnum);
			$("#infoModal input#com_ceo_name").val(com_ceo_name);
			$("#infoModal input#com_postnum").val(com_postnum);
			$("#infoModal input#com_addr").val(com_addr);
			$("#infoModal input#com_type_biz").val(com_type_biz);
			$("#infoModal input#com_type_biz_detail").val(com_type_biz_detail);
			$("#infoModal input#ac_date").val(ac_date);
			$("#infoModal input#ac_renew_date").val(ac_renew_date);
			$("#infoModal input#ac_cancel_date").val(ac_cancel_date);
			$("#infoModal textarea#com_note").val(com_note);
			$("#infoModal .com_id").val(com_id);
			$("#infoModal input#oj_date").val(oj_date);
			$("#infoModal").modal();
        });
        
        $(".btn-agreeDelete").on("click", function(){
        	$("#companyAgreeDelete").submit();
        });
        $(".btn-ojDelete").on("click", function(){
        	$("#companyOjDelete").submit();
        });
        $(".btnInsert").on("click",function(){
        	
        	$("#insert_com_addr").val("");
        	$("#insert_com_postnum").val("");
        })
        
        //체납여부변경
        $(".com_dc").on("click",function(){
        	var com_id = $(this).val();
        	var com_dc = $(this).attr("checked");
        	$("#com_defaultForm input[name=com_id]").val(com_id);
        	$("#com_defaultForm input[name=com_dc]").val(com_dc);
        	
        	$("#com_defaultForm").submit();
        });
        
        $("button.btnExcel").on("click", function(){
			$("#companyExcelForm").submit();
		});
        $("#companyExcelForm #key").val("${key}");
		$("#companyExcelForm #value").val("${value}");
     
		
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

					<a class="list-group-item active" href="${pageContext.request.contextPath}/companyList" >협약기업관리</a>  
						
					<a class="list-group-item" href="${pageContext.request.contextPath}/ocList" >개설과정관리</a>

				</div>
			</div>
			<!-- main DIV GROUP -->
			<div class="col-md-10 text-left" style="padding: 0px;"
				id="dataResult">

				<div class="panel panel-info">
					<div class="panel-heading">협약기업목록</div>
					<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>사업자번호</th>
										<th>회사명</th>
										<th>전화번호</th>
										<th>고용보험번호</th>
										<th>사원수</th>
										<th>대표자</th>
										<th>우편번호</th>
										<th width="20%">주소</th>
										<th>업종</th>
										<th>상세업종</th>
										<th>체납</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody class="tableData">
								<c:choose>
								<c:when test="${empty tableData}">
									<tr><td colspan="11" style="text-align: center"><strong>검색결과가 없습니다.</strong></td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="com" items="${tableData}">
										<tr ${com.dc == "default"?"style='background-color:#ffeeee'":""}>
											<td>${com.com_id}</td>
											<td>${com.com_name}</td>
											<td>${com.com_tel}</td>
											<td>${com.com_inurance_id}</td>
											<td>${com.com_empnum}</td>
											<td>${com.com_ceo_name}</td>
											<td>${com.com_postnum}</td>
											<td>${com.com_addr}</td>
											<td>${com.com_type_biz}</td>
											<td>${com.com_type_biz_detail}</td>
											<td style="display:none">${com.com_note}</td>
											<td style="display:none">${com.ac_date}</td>
											<td style="display:none">${com.ac_renew_date}</td>
											<td style="display:none">${com.ac_cancel_date}</td>
											<td style="display:none">${com.oj_date}</td>
											<td><input type="checkbox" class="com_dc" value="${com.com_id}" ${com.dc == 'default'?'checked':''}></td>
											<td><button
													class="btn btn-default btn-sm btn-comInfo"
													value="${com.com_id}">수정</button></td>
											<td><button
													class="btn btn-danger btn-sm btn-comDelete"
													value="${com.com_id}">삭제</button></td>

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
						<button type="button" data-toggle="modal" data-target="#insertModal" class="btn btn-info btnInsert">등록</button>
						<button type="button" class="btn btn-success btnExcel">Excel</button>
						<form class="form-inline" id="companyExcelForm" action="${pageContext.request.contextPath}/companyExcel" method="POST">
							<input type="hidden" name="key" id="key">
							<input type="hidden" name="value" id="value">
						</form>

						<div class="form-inline" style="float: right" id="studentSearch">
							<form id="companySearchForm" method="GET">
								
								<select class="form-control" name="key" id="key">
									<option value="all">전체</option>
									<option value="com_id">사업자번호</option>
									<option value="com_name">회사명</option>
									<option value="com_tel">전화번호</option>
									<option value="com_inurance_id">고용보험번호</option>
									<option value="com_ceo_name">대표자명</option>
									<option value="com_addr">주소</option>
									<option value="com_empnum_up">사원수(이상)</option>
									<option value="com_empnum_down">사원수(이하)</option>
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
				<!-- 체납변경 히든 폼 -->
				<form action="${pageContext.request.contextPath}/companyDefault" method="POST" id="com_defaultForm">
					<input type="hidden" name="com_id">
					<input type="hidden" name="com_dc">
				</form>
				<!-- modal -->
				<!-- 기업 수정모달 -->
				<div id="infoModal" class="modal fade" role="dialog">
					<div class="modal-dialog" style="width:60%">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">협약기업-수정</h4>
							</div>
							<div class="modal-body">
							
								<form action="${pageContext.request.contextPath}/companyUpdate" method="POST"
									class="form-inline" id="companyInfo">
									<div class="row">
										<div class="col-md-2" style="text-align: right">
											<label for="com_id">사업자번호 : </label><br> 
											<label for="com_name">회사명 : </label><br> 
											<label for="com_tel">전화번호 : </label><br> 
											<label for="com_empnum">사원수 : </label><br>
											<label for="com_postnum">우편번호 : </label><br>
											<label for="com_addr">주소 : </label><br>
										</div>
										<div class="col-md-4">
											<input type="text" class="form-control" id="com_id"disabled> 
											<input type="hidden" name="com_id">
											<input type="text" class="form-control" name="com_name" id="com_name">
											<input type="text" class="form-control" name="com_tel" id="com_tel">
											<input type="number" class="form-control" name="com_empnum" id="com_empnum" >
											<input type="text" class="form-control com_postnum" name="com_postnum" id="com_postnum" >
											<input type="text" class="form-control com_addr" name="com_addr" id="com_addr" >
										</div>
										<div class="col-md-2" style="text-align: right">
											<label for="com_ceo_name">대표자 : </label><br> 
											<label for="com_inurance_id">고용보험 : </label><br> 
											<label for="com_type_biz">업종 : </label><br> 
											<label for="com_type_biz_detail">상세업종 : </label><br>
											<label for="com_note">비고 : </label><br>
										</div>
										<div class="col-md-4">
											<input type="text" class="form-control" name="com_ceo_name" id="com_ceo_name"> 
											<input type="text" class="form-control" name="com_inurance_id" id="com_inurance_id">
											<input type="text" class="form-control" name="com_type_biz" id="com_type_biz">
											<input type="text" class="form-control" name="com_type_biz_detail" id="com_type_biz_detail" >
											<textarea class="form-control" style="width:100%" rows="3" maxlength = "200" name = "com_note" id="com_note"></textarea>
										</div>
									</div>
									<div style="text-align: right">
									
										<button type="submit" class="btn btn-default btn-submit">수정</button>
										 
											
									</div>
								</form>
									<hr>
								<form action="${pageContext.request.contextPath}/companyAgree" method="POST" class="form-inline" >
									<h4>협약등록정보</h4>
									<input type="hidden" class="com_id" name="com_id">
									<label for="ac_date">등록일 : </label>
									<input type="text" class="form-control" style="width:180px" name="ac_date" id="ac_date"> 
									<label for="ac_renew_date">갱신일 : </label>
									<input type="text" class="form-control" style="width:180px" name="ac_renew_date" id="ac_renew_date">
									<label for="ac_cancel_date">종료일 : </label>
									<input type="text" class="form-control" style="width:180px" name="ac_cancel_date" id="ac_cancel_date">
									<div class="btn-group">
										<button type="submit" class="btn btn-default">등록/수정</button>
										<button type="button" class="btn btn-danger btn-agreeDelete" value="">삭제</button>
									</div>
								</form>
								<form action="${pageContext.request.contextPath}/companyAgreeDelete" method="POST" class="form-inline" id="companyAgreeDelete">
									<input type="hidden" class="com_id" name="com_id">
								</form>
									<hr>
								<form action="${pageContext.request.contextPath}/companyOj" method="POST" class="form-inline" >
									<h4>온라인가입여부</h4>
									<input type="hidden" class="com_id" name="com_id">
									<label for="oj_date">등록일 : </label>
									<input type="text" class="form-control" style="width:180px" name="oj_date" id="oj_date">
									<div style="display:inline;padding-right:10px;">
									<div class="btn-group">
										<button type="submit" class="btn btn-default">등록/수정</button>
										<button type="button" class="btn btn-danger btn-ojDelete" value="">삭제</button>
									</div>
									<button style="float:right" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</form>	
								<form action="${pageContext.request.contextPath}/companyOjDelete" method="POST" class="form-inline" id="companyOjDelete">
									<input type="hidden" class="com_id" name="com_id">
								</form>
							</div>

						</div>

					</div>
				

				
				</div>
				<!-- 기업 입력모달 -->
				<div id="insertModal" class="modal fade" role="dialog">
					<div class="modal-dialog" style="width:60%">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">협약기업-입력</h4>
							</div>
							<div class="modal-body">
							
								<form action="${pageContext.request.contextPath}/companyInsert" method="POST"
									class="form-inline" id="companyInfo">
									<div class="row">
										<div class="col-md-2" style="text-align: right">
											<label for="com_id">사업자번호 : </label><br> 
											<label for="com_name">회사명 : </label><br> 
											<label for="com_tel">전화번호 : </label><br> 
											<label for="com_empnum">사원수 : </label><br>
											<label for="com_postnum">우편번호 : </label><br>
											<label for="com_addr">주소 : </label><br>
										</div>
										<div class="col-md-4">
											<input type="text" class="form-control" id="com_id" name="com_id" required>
											<input type="text" class="form-control" name="com_name" id="com_name" required>
											<input type="text" class="form-control" name="com_tel" id="com_tel">
											<input type="number" class="form-control" name="com_empnum" id="com_empnum" >
											<input type="text" class="form-control com_postnum" name="com_postnum" id="insert_com_postnum" >
											<input type="text" class="form-control com_addr" name="com_addr" id="insert_com_addr" >
										</div>
										<div class="col-md-2" style="text-align: right">
											<label for="com_ceo_name">대표자 : </label><br> 
											<label for="com_inurance_id">고용보험 : </label><br> 
											<label for="com_type_biz">업종 : </label><br> 
											<label for="com_type_biz_detail">상세업종 : </label><br>
											<label for="com_note">비고 : </label><br>
										</div>
										<div class="col-md-4">
											<input type="text" class="form-control" name="com_ceo_name" id="com_ceo_name"> 
											<input type="text" class="form-control" name="com_inurance_id" id="com_inurance_id">
											<input type="text" class="form-control" name="com_type_biz" id="com_type_biz">
											<input type="text" class="form-control" name="com_type_biz_detail" id="com_type_biz_detail" >
											<textarea class="form-control" style="width:100%" rows="3" maxlength = "200" name = "com_note" id="com_note"></textarea>
										</div>
									</div>
									<hr>
									<div style="text-align: right">
										<button type="submit" class="btn btn-default btn-submit">등록</button>
										<button style="float:right" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</form>
									
							</div>

						</div>

					</div>
				

				
				</div>
				<!-- 기업 삭제모달 -->
				<div id="deleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog" >

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">협약기업-삭제</h4>
							</div>
							<div class="modal-body">
							
								<form action="${pageContext.request.contextPath}/companyDelete" method="POST" class="form-inline" id="companyInfo">
									<div class="row">
										<div class="col-md-4" style="text-align: right">
											<label for="com_id">사업자번호 : </label><br> 
											<label for="com_name">회사명 : </label><br> 
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="com_id"disabled> 
											<input type="hidden" name="com_id">
											<input type="text" class="form-control"  name="com_name" id="com_name"disabled>
											
										</div>
									</div>
									<hr>
									<div style="text-align: right">
									
										<button type="submit" class="btn btn-default btn-submit">삭제</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											
									</div>
								</form>
									
								
							</div>

						</div>

					</div>
				

				
				</div>


				<!-- modal end -->

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
<script>
//주소검색
$(".com_addr").on("click", function(){
	jusopopup();
});
$(".com_postnum").on("click", function(){
	jusopopup();
});

function jusopopup(){
	var pop = window.open("${pageContext.request.contextPath}/resources/script/jusopopup.jsp","pop","width=600,height=500,scrollbars=yes,regizable=yes");
}

function jusoCallBack(roadFullAddr, roadAddrPart1,addrDetail,roadAddrPart2,engAddr,jibunAddr,zipNo){
// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$(".com_postnum").val(zipNo);
	$(".com_addr").val(roadFullAddr);
}

</script>


</body>

</html>