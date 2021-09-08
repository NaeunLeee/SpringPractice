<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script src="./resources/js/json.min.js"></script>

<script type="text/javascript" >
	$(function(){
		userList();

		userSelect();
		
		userDelete();
		
		userInsert();
	
		userUpdate();
		
		init();
	});
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#form1').each(function(){
				this.reset();
			});
		});
	}//init
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var userId = $(this).closest('tr').find('#hidden_userId').val();
			var result = confirm(userId +" 사용자를 정말로 삭제하시겠습니까?");
			var tr = $(this).closest('tr');
			if(result) {
				$.ajax({
					url:'users/'+userId,  
					type:'DELETE',
					//data: {},
					//contentType:'application/json;charset=utf-8',	
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, 
					success:function(xhr) {
						console.log(xhr.result);
						//userList();
						if (xhr.result == true) {
							tr.remove();
							alert("삭제가 완료되었습니다.");
						}
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			//var userId = $(this).closest('tr').find('#hidden_userId').val();
			//var userId = $(this).parent().parent().data("userid");	// this의 parent : td -> td의 parent : tr
			var userId = $(this).closest('tr').data("userid");		// 가장 가까운 tr 태그
			
			//특정 사용자 조회
			$.ajax({
				url:'users/'+userId,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult

			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function userSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:text[name="password"]').val(user.password);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 요청
	function userUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();		
			$.ajax({ 
			    url: "users", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    contentType: 'application/json',
			    success: function(data) { 
			        userList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 등록 요청
	function userInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			$("#form1")
/* 			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var passsword = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val(); */		
			$.ajax({ 
			    url: "users",  
			    type: 'POST',  
			    dataType: 'json', 
			    //data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    data : JSON.stringify($("#form1").serializeObject()),		// serializeObject() : 위의 주석 막아둔 작업을 한꺼번에 해주는 함수
			    contentType: 'application/json', 
			    success: function(response) {
			    	if(response.result == true) {
			    		userList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'users',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){		// for (i=0; i<data.length; i++) { item = data[i] } ;
			$('<tr data-userid="' + item.id + '">')
			.append($('<td>').html(item.id))
			.append($('<td>').html(item.name))
			.append($('<td>').html(item.password))
			.append($('<td>').html(item.role))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">사용자 관리</h1>
	</div>
	<!-- 컨텐트 -->
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">
				<label>아이디 : </label> 
				<input type="text" class="form-control" name="id">
			</div>
			<div class="form-group">
				<label>이름:</label> 
				<input type="text" class="form-control" name="name">
			</div>
			<div class="form-group">
				<label>패스워드:</label> 
				<input type="text" class="form-control" name="password">
			</div>
			<!-- 		<div class="form-group">
			<label >성별:</label>
			<div class="radio">
				<label><input type="radio"  name="gender"  value="남">남</label>
			</div>
			<div class="radio">
				<label><input type="radio"  name="gender"  value="여">여</label>
			</div>	
		</div>	 -->
			<div class="form-group">
				<label>역할:</label> <select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록"
					id="btnInsert" /> <input type="button" class="btn btn-primary"
					value="수정" id="btnUpdate" /> <input type="button"
					class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>사용자 목록</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">이름</th>
					<th class="text-center">성별</th>
					<th class="text-center">거주지</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
