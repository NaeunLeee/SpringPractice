<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">사원 목록</h1>
		<br>
		<div class="row">
			<div class="col-12">
				<table class="table table-hover" id="employee">
					<thead>
						<tr>
							<th>사 번</th>
							<th>이 름</th>
							<th>성</th>
							<th>입사일</th>
							<th>업무ID</th>
							<th>부서ID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="employee">
							<tr>
								<td>${employee.employee_id}</td>
								<td>${employee.first_name}</td>
								<td>${employee.last_name}</td>
								<td><fmt:formatDate value="${employee.hire_date}" pattern="yyyy/MM/dd" /></td>
								<td>${employee.job_id}</td>
								<td>${employee.department_id}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br><br>
				
				<div id="pageButton" align="center">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage-1}" class="btn btn-default">이전</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
						<a href="${num}" class="btn btn-outline-primary">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage+1}" class="btn btn-default">다음</a>
					</c:if>
				</div>
				<br><br>
			</div>
		</div>

	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row" align="center">
	<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/employee/register'">사원추가</button>
</div>
<br><br><br>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-laballedby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-default">Save changes</button>
			</div>
		</div>
	</div>
</div>


<script>
// DataTable : 데이터가 1000건 미만일 때 

/* 	$(function() {
		$('#board').DataTable();
	}) */
	
 	$(function() {
		var actionForm = $("#actionForm");
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			var bno = $(this).attr("href");
			actionForm.append('<input type="hidden" name="bno" value="' + bno + '">');
			actionForm.attr("action", "get");
			actionForm.submit();
		})
		
		
		$("#pageButton a").on("click", function(e) {
			e.preventDefault();			// a 태그의 원래 기능을 막기 위해서
			var p = $(this).attr("href");				// $(this) -> 내가 클릭한 a 태그
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		})
	})	
	
	
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		function checkModal(result) {
			if (result === '') {
				return;
			}
			if (parseInt(result) > 0) {
				$('.modal-body').html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$('#myModal').modal('show');
		}
	}) 
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


