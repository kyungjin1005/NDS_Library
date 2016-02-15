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

<style type="text/css">
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
}

#member-table tbody tr:HOVER {
	cursor: pointer;
}

#member-table th {
	height: 30px;
	background-color: #ddd;
	font-weight: bold;
	font-size: 15px;
}

#member-table th, #member-table td {
	font-family: "맑은고딕";
	text-align: center;
	vertical-align: middle;
}

#member-table td {
	font-size: 15px;
	height: 50px;
}

#member-footer {
	text-align: right;
	margin: 15px 0px;
}
</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<header>
			<%@include file="/include/header.jsp"%>
		</header>
			<%@include file="ManagerpageSidebar.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">회원관리</h1>
				<hr class="title-line" />
				<form class="form-inline" role="form" method="post" action="">
					<div id="member-header">
						Count <span class="badge">10</span>
						<button class="btn btn-sm btn-default">일괄선택</button>
					</div>
					<table class="table table-hover" id="member-table">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>ID</th>
								<th>성명</th>
								<th>부서</th>
								<th>직위</th>
								<th>등록날짜</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>1510010</td>
								<td>김혜원</td>
								<td>개발본부</td>
								<td>사원</td>
								<td>2016-02-02</td>
							</tr>
						</tbody>
					</table>

					<div id="member-footer">
						<hr />
						<button class="btn btn-md btn-warning btn-msg">메세지 보내기</button>
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