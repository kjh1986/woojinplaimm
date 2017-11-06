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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/script/wj-style.css">	

<script src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>
	$(document).ready(function() {
		//구글차트 로드
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = new google.visualization.DataTable();
			 data.addColumn('string', '월별');
		        data.addColumn('number', '목표인원');
		        data.addColumn('number', '훈련인원');
		        data.addRows([
		          ['1월',${chartData1[0]}, ${chartData2[0]}],
		          ['2월',${chartData1[1]}, ${chartData2[1]}],
		          ['3월',${chartData1[2]}, ${chartData2[2]}],
		          ['4월',${chartData1[3]}, ${chartData2[3]}],
		          ['5월',${chartData1[4]}, ${chartData2[4]}],
		          ['6월',${chartData1[5]}, ${chartData2[5]}],
		          ['7월',${chartData1[6]}, ${chartData2[6]}],
		          ['8월',${chartData1[7]}, ${chartData2[7]}],
		          ['9월',${chartData1[8]}, ${chartData2[8]}],
		          ['10월',${chartData1[9]}, ${chartData2[9]}],
		          ['11월',${chartData1[10]}, ${chartData2[10]}],
		          ['12월',${chartData1[11]}, ${chartData2[11]}]
		        ]);

			var options = {
				chart : {
					title : '월별 실적 현황'
				}
			};

			var chart = new google.charts.Bar(document
					.getElementById('columnchart_material'));

			chart.draw(data, google.charts.Bar
					.convertOptions(options));
		}

		//웹페이지 최초 접근시 실행
		google.charts.setOnLoadCallback(drawChart);

		
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
				<a class="navbar-brand wj-logo" href="goMain.wjp?"><img
					src="${pageContext.request.contextPath }/resources/img/logo_woojin.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="index.wjp"><b>우진플라임 교육원 관리 시스템</b><small>
								v1.0 (2017.9.23)</small></a></li>
					<li><a href="index.wjp">관리페이지</a></li>
					<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						통계페이지 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="statsRecord.wjp">실적현황</a></li>
							<li><a href="statsSales.wjp">매출통계</a></li>
						</ul></li>
					<!-- 개발자문의 링크 -->
					<li><a href="${pageContext.request.contextPath}/about.jsp">개발자문의</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a class="btn" data-toggle="modal" data-target="#logoutModal">
					<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container-fluid text-center" style="margin-top: 51px;">
		<div class="row"style="margin-top: 20px;margin-bottom: 20px;">
			<div class="col-md-1"></div>
			<div class="col-md-10 text-center">
				<div id="columnchart_material"></div>
			</div>
			<div class="col-md-1"></div>
			
		</div>
		<div class="row content">
			<div class="col-md-1">
			</div>
			<!-- main DIV GROUP -->
			<div class="col-md-10 text-left" style="padding: 0px;"
				id="dataResult">

				<div class="panel panel-info">
					<div class="panel-heading">월별 훈련실적 현황</div>
					<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>훈련과정명</th>
										<th>총계</th>
										<th>목표달성</th>
										<th>1월</th>
										<th>2월</th>
										<th>3월</th>
										<th>4월</th>
										<th>5월</th>
										<th>6월</th>
										<th>7월</th>
										<th>8월</th>
										<th>9월</th>
										<th>10월</th>
										<th>11월</th>
										<th>12월</th>
										<th>목표달성율</th>
									</tr>
								</thead>
								<tbody class="tableData">
								<c:choose>
								<c:when test="${empty tableData}">
									<tr><td colspan="16" style="text-align: center"><strong>검색결과가 없습니다.</strong></td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="stats" items="${tableData}">
										<tr ${stats.rate < 100 ?"style='background-color:#ffeeee'":""}>
											<td>${stats.course_name}</td>
											<td>${stats.oc_goals_num}</td>
											<td>${stats.rate>=100?"달성":"미달성"}</td>
											<td>${stats.mon1}</td>
											<td>${stats.mon2}</td>
											<td>${stats.mon3}</td>
											<td>${stats.mon4}</td>
											<td>${stats.mon5}</td>
											<td>${stats.mon6}</td>
											<td>${stats.mon7}</td>
											<td>${stats.mon8}</td>
											<td>${stats.mon9}</td>
											<td>${stats.mon10}</td>
											<td>${stats.mon11}</td>
											<td>${stats.mon12}</td>
											<td>${stats.rate}%</td>
										</tr>
									</c:forEach>
								</c:otherwise>	
								</c:choose>
								</tbody>
							</table>
						

						<div class="form-inline" style="float: right" id="studentSearch">
							<form id="statsSearchForm" method="POST">
								<label for="searchText">년도 검색:</label> 
								<input type="number" class="form-control" placeholder="ex)2017" name="value" id="value">
								<button type="submit" class="btn btn-primary btnSearch">검색</button>
								
							</form>
						</div>
					</div>



				</div>
				
				<!-- modal -->
			

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



</body>

</html>