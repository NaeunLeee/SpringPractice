<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<h1 class="page-header">사원 상세보기</h1>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">사원 조회</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="${pageContext.request.contextPath}/employee/modify" method="get">
						<div class="form-group">
							<label>사 번</label> 
							<input class="form-control" name="empid" value="${employee.empid}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>이 름</label> 
							<input class="form-control" name="name" value="${employee.name}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>이메일</label>
							<textarea class="form-control" rows="3" name="email" readonly="readonly">${employee.email}</textarea>
						</div>
						<div class="form-group">
							<label>전화번호</label> 
							<input class="form-control" name="phone" value="${employee.phone}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>생년월일</label><br>
							<h4><fmt:formatDate value="${employee.birth}" pattern="yyyy년 MM월 dd일" /></h4>
						</div>
						<div class="form-group">
							<label>주 소</label> 
							<input class="form-control" name="address" value="${employee.address}" readonly="readonly">
						</div>
							<div class="row" align="center">
								<button type="submit" class="btn btn-default">수 정</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/employee/list'" class="btn btn-info">목 록</button>
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