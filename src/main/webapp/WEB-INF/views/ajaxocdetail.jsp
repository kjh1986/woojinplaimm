<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div class="modal-dialog" style="width:60%">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개설과정상세정보</h4>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/ocUpdate" method="POST" class="form-inline" id="courseInfo">
						<div class="row">
							<div class="col-md-2" style="text-align: right">
							
								<input type="hidden" name="oc_id" value="${oc.oc_id}">
								<label for="oc_id">NO : </label><br>
								<label for="course_id">과정명 : </label><br>
								<label for="oc_start_date">시작일 : </label><br>
								<label for="oc_finish_date">종료일 : </label><br>
								<label for="oc_timeofedu">교육시간 : </label><br>
								<label for="oc_goalsnum">목표인원 : </label><br>
								<label for="oc_goalsnum">과목목록 : </label><br>
								</div>
							<div class="col-md-4">
								<input type="text" class="form-control" id="oc_id" value="${oc.oc_id}" disabled>
								<select class="form-control" name="course_id" id="course_id">
									<c:forEach var="co" items="${courses }">
										<option value="${co.course_id }"${oc.course_id==co.course_id?'selected':'' }>${co.course_name }</option>
									</c:forEach>
								</select><br>
								<input type="text" class="form-control" name="oc_start_date" id="oc_start_date" value="${oc.oc_start_date}" required>
								<input type="text" class="form-control" name="oc_finish_date" id="oc_finish_date" value="${oc.oc_finish_date}" required>
								<input type="text" class="form-control" name="oc_timeofedu" id="oc_timeofedu" value="${oc.oc_timeofedu}" required>
								<input type="number" class="form-control" name="oc_goals_num" id="oc_goals_num" value="${oc.oc_goals_num}" required>
								<input type="text" class="form-control" name="oc_goals_num" id="oc_goals_num" value="${oc.subs}" style="width:100%" disabled>
								
							</div>
							<div class="col-md-2" style="text-align: right">
							
								<input type="hidden" name="info_st_id" value="${student.st_id }">
								<label for="ocd_code">구분명 : </label><br>
								<label for="job_family_code">직종명 : </label><br>
								<label for="money">훈련비 : </label><br>
								<label for="oc_note">비고 : </label><br>
								</div>
							<div class="col-md-4">
								<select class="form-control" name="ocd_code" id="ocd_code">
									<c:forEach var="ocd" items="${ocds }">
										<option value="${ocd.ocd_code }" ${oc.ocd_code==ocd.ocd_code?'selected':'' }>${ocd.ocd_name }</option>
									</c:forEach>
								</select><br>
								<select class="form-control" name="job_family_code" id="job_family_code">
									<c:forEach var="jf" items="${jfs }">
										<option value="${jf.job_family_code }"${oc.job_family_code==jf.job_family_code?'selected':'' }>${jf.job_family_name }</option>
									</c:forEach>
								</select><br>
								<input type="number" class="form-control" name="money" id="money" value="${oc.money }" required>
								<textarea class="form-control" style="width:100%" rows="10" maxlength = "200" name = "oc_note" id="oc_note">${oc.oc_note }</textarea>
							<br>
							</div>
						</div>
						
						<hr>
						<div style="text-align: right">	
							<button type="submit" class="btn btn-default  btn-submit">수정</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
				
			</div>

		</div>
		<script>
		$("#oc_start_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		$("#oc_finish_date").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd"
		});
		</script>
		
		