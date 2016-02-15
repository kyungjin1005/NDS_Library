<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원관리</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
#list-title {
	text-align: center;
	padding: 0px;
}

#list-title img {
	width: 100%;
	margin: 0px;
}

.list-group-item {
	font-family: "맑은고딕";
	font-weight: bold;
	color: #555555;
	height: 50px;
	display: list-item;
	vertical-align: middle;
}

#mTitle {
	background-image: url("pictures/title.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 25px;
	padding-left: 20px;
}

.title-line {
	border: 1px solid red;
	margin-top: 5px;
	margin-bottom: 40px;
}

#member-header {
	font-weight: bold;
	font-size: 15px;
}

#member-header button {
	margin: 0px 10px;
}

#member-table {
	margin: 20px auto;
	padding: 0px 20px;
}

#member-table tbody tr:HOVER {
	cursor: pointer;
}

#member-table th {
	height: 30px;
	background-color: #ddd;
	font-weight: bold;
	font-size: 13px;
}

#member-table th, #member-table td {
	font-family: "맑은고딕";
	text-align: center;
	vertical-align: middle;
}

#member-table td {
	font-size: 13px;
	height: 50px;
}

#member-footer {
	text-align: right;
	margin: 15px 0px;
}


#member-table td:nth-child(1) { // 번호
	width: 20px;
}
#member-table td:nth-child(2) { // 제목
	width: 20px;
}
#member-table th:nth-child(3) { // 저자

}
#member-table th:nth-child(5) { // 출판사
}
#member-table th:nth-child(6) { // 기증인
}
#member-table th:nth-child(7) { // 기증일
}
#member-table th:nth-child(8) { // 기증사애
}
</style>
<script>
	$(document).ready(function() {
		$(".btn-detail").on("click", function() {
			$(location).attr(
					"href",
					"ManagerMemberInfo.nds?user_id="
							+ $(this).val());
		});
		
		$("#btn-all").on("click", function(){
			$(".cb").attr("checked","checked");
			
		});
	});
	
	function goMemberInfo(member_id){
		alert(member_id);
	}
</script>
</head>
<body>


	<div class="container">

		<header>
			<%@include file="/include/header.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/managerpage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="">회원관리</a></li>
					<li class="list-group-item"><a href="">대출관리</a></li>
					<li class="list-group-item"><a data-toggle="collapse"
						href="#collapse1">도서관리<span
							class="glyphicon glyphicon-menu-right"
							style="margin-left: 5px; font-size: 10px;"></span></a></li>
					<li>
						<div id="collapse1" class="panel-collapse collapse">
							<ul class="list-group"
								style="margin: 0px; padding: 0px; text-align: center;">
								<li class="list-group-item"><a href="">- 모든도서</a></li>
								<li class="list-group-item"><a href="">- 신청도서</a></li>
								<li class="list-group-item"><a href="">- 기증도서</a></li>
							</ul>
						</div>
					</li>
					<li class="list-group-item"><a href="">게시판관리</a></li>
					<li class="list-group-item"><a href="">메세지관리</a></li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">회원관리</h1>
				<hr class="title-line" />
				<form class="form-inline" role="form" method="post" action="ManagerMemberMsg.nds">
					<div id="member-header">
						Count <span class="badge">${size}</span>
						<button	type="button" class="btn btn-sm btn-default" id="btn-all">일괄선택</button>
					</div>
					<table class="table table-hover" id="member-table">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>소속회사</th>
								<th>부서</th>
								<th>직위</th>
								<th>등록날짜</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>
								<td><input type="checkbox" class="form-control"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr> -->
							<c:set var="count" value="1"></c:set>
							<c:forEach var="user" items="${userList}">
								<tr>
									<td><input type="checkbox"  class="form-control cb" name="user_id" value="${user.user_id }"></td>
									<td>${count}</td>
									<td>${user.nds_number}</td>
									<td>${user.name}</td>
									<td>NDS</td>
									<td>${user.department}</td>
									<td>${user.position}</td>
									<td>${user.registered_date}</td>
									<td><button type="button" value="${user.user_id}" class="btn btn-sm btn-default btn-detail">상세보기</button></td>
								</tr>
								<c:set var="count" value="${count+1}"></c:set>
							</c:forEach>

						</tbody>
					</table>

					<div id="member-footer">
						<hr />
						<button type="submit" class="btn btn-md btn-warning btn-msg">메세지 보내기</button>
					</div>
				</form>
			</div>

		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>