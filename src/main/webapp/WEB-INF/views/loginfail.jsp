<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 실패</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
div.panel {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<div class="modal-dialog">
 
			<div>
				<h1 style="font-size: x-large;">
					<img src="${pageContext.request.contextPath}/resources/img/logo_woojin.png" alt="logo"
						style="vertical-align: bottom;"> 우진플라임 교육관리 시스템  <small>v1.1</small>
				</h1>
			</div>
 
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
					<label>로그인에 실패했습니다. 재 로그인 후 이용해주세요</label>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="form-group"></div>
					<a href="${pageContext.request.contextPath }/" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>
 
		</div>
	</div>

</body>
</html>