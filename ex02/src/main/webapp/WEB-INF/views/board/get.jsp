<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<h1 class="page-header">게시글 상세보기</h1>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">게시글 조회</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="${pageContext.request.contextPath}/board/modify" method="get">
						<div class="form-group">
							<label>글 번호</label> 
							<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>제 목</label> 
							<input class="form-control" name="title" value="${board.title}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>내 용</label>
							<textarea class="form-control" rows="3" name="content" readonly="readonly">${board.content}</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> 
							<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
						</div>
							<div class="row" align="center">
								<button type="submit" class="btn btn-default">수정/삭제</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}'" class="btn btn-primary">목 록</button>
							</div>
						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}"> 
						</form>
					</div>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->

	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

	<div class="row">
		<h1 class="page-header">댓글</h1>
		<div class="col-lg-8" align="center">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<form id="replyForm">
							<input type="hidden" name="bno" value="${board.bno}">
							<div class="col-lg-2">
								<input type="text" name="replyer" class="form-control" placeholder="작성자"><br>
							</div>
							<div class="col-lg-8">
								<input type="text" name="reply" class="form-control" placeholder="내용을 입력하세요."><br>
							</div>
							<div class="col-lg-2">
								<button type="button" id="saveReply" class="btn btn-primary">댓글 등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<ul class="chat"></ul>
		</div>
	</div>

<script>
	let bno = "${board.bno}";
	
	$(function() {
		// 등록 처리
		$('#saveReply').on("click", function() {
			$.ajax({
				url : "../reply/",
				method : "post",		// 안 적어주면 get
				data : $('#replyForm').serialize(),		// serialize : 폼에 있는 문자열을 자동으로 받아옴
				dataType : "json",
				success : function(data) {
					$(".chat").prepend(makeLi(data));
				}
			});
		});
		
		// 댓글 목록
		$.ajax({
			url : "../reply/",
			data : {bno:bno},
			dataType : "json",
			success : function(datas) {
				console.log(datas);
				str = '';
				for (i=0; i<datas.length; i++) {
					str += makeLi(datas[i]);
				}
			$(".chat").html(str);
			}
		});
	})

		function makeLi(data) {
			return '<li>'
				+ '<div class="panel panel-default">'
				+ '<div class="panel-heading">' + data.rno + ' | ' + data.replyer + ' | ' + data.replydate + '</div>'   
				+ '<div class="panel-body">' + data.reply + '</div>'
				+ '</div>'
				+ '</li>';
		}
	
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>