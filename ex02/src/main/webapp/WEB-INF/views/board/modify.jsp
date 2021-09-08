<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<h1 class="page-header">게시글 수정</h1>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">게시글 수정</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="${pageContext.request.contextPath}/board/modify" method="post">
							<div class="form-group">
								<label>글 번호</label> 
								<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
							</div>
							<div class="form-group">
								<label>제 목</label> 
								<input class="form-control" name="title" value="${board.title}">
							</div>
							<div class="form-group">
								<label>내 용</label>
								<textarea class="form-control" rows="3" name="content">${board.content}</textarea>
							</div>
							<div class="form-group">
								<label>작성자</label> 
								<input class="form-control" name="writer" value="${board.writer}">
							</div>
							<div class="row" align="center">
								<button type="submit" class="btn btn-default">수 정</button>
								<button type="submit" 
										formaction="${pageContext.request.contextPath}/board/delete"
										class="btn btn-default">삭 제</button>
								<a href="${pageContext.request.contextPath}/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}"
								   class="btn btn-info">목 록</a>
							</div>
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





<%@ include file="/WEB-INF/views/includes/footer.jsp"%>