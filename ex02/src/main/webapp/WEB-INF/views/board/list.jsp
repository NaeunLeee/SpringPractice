<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
		<div class="row">
			<form id="actionForm" action="list" method="get">
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<div style="float: left; margin-right: 10px;">
				<select name="type" class="form-control" style="width: 100px">
					<option value="" ${empty pageMaker.cri.type ? 'selected' : ""}>선택</option>
					<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ""}>제목</option>
					<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ""}>내용</option>
					<option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ""}>작성자</option>
					<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ""}>제목/내용</option>
					<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ""}>제목/작성자</option>
					<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ""}>전체 검색</option>
				</select>
			</div>
			<div style="float: left; margin-right: 10px;">
				<input name="keyword" value="${pageMaker.cri.keyword}" class="form-control" style="width: 200px">
			</div>
			<div style="float: left;">
				<button class="btn btn-primary">검색</button>
			</div>
			</form>
		</div>
		<br>
		<div class="row">
			<div class="col-12">
				<table class="table table-hover" id="board">
					<thead>
						<tr>
							<th class="col-1">글번호</th>
							<th class="col-2">제 목</th>
							<th class="col-3">내 용</th>
							<th class="col-2">작성자</th>
							<th class="col-2">작성일자</th>
							<th class="col-2">수정일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.bno}</td>
								<td>
									<a style="float: left;" href="${board.bno}" class="move">${board.title}</a>
									<p style="float: left; margin-left: 5px;" class="text-info">[${board.replycnt}]</p>
								</td>
								<td>${board.content}</td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}"
										pattern="yy-MM-dd" /></td>
								<td><fmt:formatDate value="${board.updatedate}"
										pattern="yy-MM-dd" /></td>
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
	<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/register'">글 쓰기</button>
</div>

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


