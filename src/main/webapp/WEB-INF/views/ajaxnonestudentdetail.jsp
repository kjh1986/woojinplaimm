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
							<input type="hidden" name="st_id" value="${student.st_id }">
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
							<input type="text" class="form-control" name="st_name" id="st_name" value="${student.st_name }">
							<input type="text" class="form-control" name="st_ssn" id="st_ssn" value="${student.st_ssn }">
							<input type="text" class="form-control" name="st_regdate" id="st_regdate" value="${student.st_regdate }">
							<input type="text" class="form-control" name="st_tel" id="st_tel" value="${student.st_tel }">
							<input type="text" class="form-control" name="st_email" id="st_email" value="${student.st_email }">
							<input type="text" class="form-control" name="st_carnum" id="st_carnum" value="${student.st_carnum }">
						</div>
						<div class="col-md-1" style="text-align: right">
							<label for="st_note">비고 : </label><br>
						
						</div>
						<div class="col-md-3">
							<textarea class="form-control" style="width:100%" rows="10" maxlength = "200" name = "st_note" id="st_note">${student.st_note }</textarea>
							<br>
							<button type="submit" class="btn btn-default btn-submit">수정</button>
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
							</div>
							<div class="col-md-3">
								<form id="stdInsertForm" action="${pageContext.request.contextPath }/studentstdInsert" method="post">
									<input type="hidden" name = "st_id" value="${student.st_id }">
									<select class="form-control" name = "std_code" id="std_code">
										<c:forEach var = "d" items = "${stds}">
											<option value="${d.std_code }"> ${d.std_name }</option>
										</c:forEach>
									</select>
									<input type="hidden" name = ${student.std_code !='none'?"std_code":"" } value="${student.std_code }">
								<button type="submit" class="btn btn-sm ${st.std_code!='none'?'btn-danger':'btn-info'}">유형등록</button>
								</form>
							</div>
							<div class="col-md-1" style="text-align: right">
								
							
							</div>
							<div class="col-md-3">
								
						</div>
					</div>
				
						<hr>
						
				</div>
				
			</div>

		</div>

</div>
<script>
		$("#st_regdate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		
		if("${student.std_code}"!='none'){
			$("#stdInsertForm select[name=std_code] option[value=${student.std_code}]").attr("selected","selected");
			
			$("#stdInsertForm button[type=submit]").text('유형삭제');
			$("#stdInsertForm select[name=std_code]").attr('disabled','disabled');
			$("#stdInsertForm").attr('action','${pageContext.request.contextPath }/studentstdDelete');
		}
		
		</script>
		