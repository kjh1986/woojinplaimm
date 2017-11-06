<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<div class="modal-dialog" style="width:75%">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">훈련생상세정보-수정</h4>
				</div>
				<div class="modal-body">
						
					<div class="row">
						<div class="col-md-1" style="text-align: right">
							<label>사진 :</label>
						</div>
						<div class="col-md-3">
							<img src="${pageContext.request.contextPath }/resources/picture/
						${student.pic_filename=='none'?'img_avatar1.png': student.pic_filename}"
							width="100%" alt=""><br>
						</div>
						<form action="${pageContext.request.contextPath }/studentUpdate" method="POST" class="form-horizontal" id="studentInfo">
				
						<div class="col-md-1" style="text-align: right">
							<label for="st_id">NO : </label><br>
							<label for="st_name">훈련생명 : </label><br>
							<label for="st_ssn">주민번호 : </label><br>
							<label for="st_regdate">등록일 : </label><br>
							<label for="st_tel">전화번호 : </label><br>
							<label for="st_email">이메일 : </label><br>
							<label for="st_carnum">차량번호 : </label><br>
							</div>
						<div class="col-md-3">
							<input type="text" class="form-control" id="st_id" value="${student.st_id }" disabled>
							<input type="hidden" name="st_id" value="${student.st_id }">
							<input type="text" class="form-control" name="st_name" id="st_name" value="${student.st_name }">
							<input type="text" class="form-control" name="st_ssn" id="st_ssn" value="${student.st_ssn }">
							<input type="text" class="form-control" name="st_regdate" id="st_regdate" value="${student.st_regdate }" >
							<input type="text" class="form-control" name="st_tel" id="st_tel" value="${student.st_tel }">
							<input type="text" class="form-control" name="st_email" id="st_email" value="${student.st_email }">
							<input type="text" class="form-control" name="st_carnum" id="st_carnum" value="${student.st_carnum }">
							</div>
						<div class="col-md-1" style="text-align: right">
							<label for="st_note">비고 : </label><br>
						
						</div>
						<div class="col-md-3">
							<textarea class="form-control" style="width:100%" rows="10" name = "st_note" id="st_note">${student.st_note }</textarea>
							<br>
							<button type="submit" class="btn btn-default btn-submit" style="float:right">수정</button>
						</div>
						</form>
					</div>
					
						<hr>
					<div class="row" style="margin-top:5px">
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<form action="${pageContext.request.contextPath }/studentPicAdd" method="post" enctype="multipart/form-data">
								<input type="hidden" name="st_id" id="st_id" value="${student.st_id }">
								<div class="form-group">
									<small><input type="file" class="form-control" id="pic_fileName" name="pic_fileName" required="required"></small> 
									<span class="help-block">(.jpg or .png, 1Mbyte 이내)</span>
									<button type="submit" class="btn btn-default btn-sm">사진등록</button>
								</div>
								
							</form>
						
						</div>
						<div class="col-md-1" style="text-align: right">
							<label for="std_code">유형 : </label><br>
							<label for="ac_st_dept">부서 : </label><br>
							<label for="job_title">직위 : </label><br>
							<label for="emp_id">사번 : </label><br>
						</div>
						<form action="${pageContext.request.contextPath }/studentacUpdate" method="post" id="stdUpdateForm">
						<div class="col-md-3">
							<input type="hidden" name="st_id" value="${student.st_id }">
						
							<input type="hidden" class="form-control" name="std_code" value="${student.std_code }">
							<input type="text" class="form-control" id="std_name" value="${student.std_name }" disabled>
						
							<input type="text" class="form-control" id="ac_st_dept" name="ac_st_dept" value="${student.ac_st_dept }">
							<input type="text" class="form-control" id="job_title" name="job_title" value="${student.job_title }">
							<input type="text" class="form-control" id="emp_id" name="emp_id" value="${student.emp_id }">
							
						</div>
						<div class="col-md-1" style="text-align: right">
							<label for="com_id">사업자 : </label><br>
							<label for="com_name">회사명 : </label><br>
							<label for="com_tel">전화번호 : </label><br>
							<label for="com_tel">유형정보 : </label><br>
						</div>	
						<div class="col-md-3">
							<select class="form-control" name = "com_id" id="com_id">
								<c:forEach var = "c" items = "${comids}">
									<option value="${c.com_id }" ${c.com_id==student.com_id?'selected':'' }> ${c.com_id }(${c.com_name })</option>
								</c:forEach>
							</select>
							<input type="text" class="form-control" id="com_name" value="${student.com_name }" disabled>
							<input type="text" class="form-control" id="com_tel" value="${student.com_tel }" disabled>
							<div class="btn-group">
								<button type="submit" class="btn btn-info">수정</button>
								<button type="button" class="btn btn-danger btn-stdDelete">유형삭제</button>
							</div>
							<button type="button" class="btn btn-default"data-dismiss="modal" style="float: right">Close</button>
							
						</div>
						</form>
						
						<form action="${pageContext.request.contextPath }/studentacDelete" method="post" id="stdDeleteForm">
							<input type="hidden" name="st_id" value="${student.st_id }">
							<input type="hidden" name="std_code" value="${student.std_code }">
							
						</form>
						
							
					</div>
				
						<hr>
						
				</div>
				
			</div>

		</div>
		
		<script>
		//유형정보삭제 액션 리스너
		$(".btn-stdDelete").on("click", function(){
			$("#stdDeleteForm").submit();
		});
		$("#st_regdate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		</script>

</div>