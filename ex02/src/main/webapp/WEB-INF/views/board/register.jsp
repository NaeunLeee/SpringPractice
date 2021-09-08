<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<h1 class="page-header">게시글 등록</h1>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">작성 폼</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="${pageContext.request.contextPath}/board/register" method="post">
							<div class="form-group">
								<label>제 목</label><br>
									<input name="title" class="form-control" placeholder="제목을 입력해주세요.">
							</div>
							<div class="form-group">
								<label>내 용</label>
								<textarea name="content" class="form-control" placeholder="내용을 입력해주세요." rows="3"></textarea>
							</div>
							<div class="form-group">
								<label>작성자</label><br>
									<input name="writer" class="form-control" placeholder="이름을 입력해주세요.">
							</div>
							<br>
							<button type="submit" class="btn btn-default">등 록</button>
							<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/board/list'">목 록</button>
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