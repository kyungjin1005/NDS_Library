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
					<li class="list-group-item"><a href="MessageList.nds">메세지관리</a></li>
				</ul>


			</div>
			<div class="col-md-10">
				<h1 id="mTitle">게시판 관리</h1>
				<hr class="title-line" />







				<div style="margin-bottom: 1%;">
					<div>
						<ul class="nav nav-pills nav-justified ">
							<li class="active"><a href="ManageBoard.jsp">글관리</a></li>
							<li><a href="CommentList.jsp">댓글관리</a></li>
							<!-- <li><a href="Logout.nds" style="color: red"> 로그아웃</a></li> -->
						</ul>
					</div>
				</div>
				<br>

				<div id="filter">
					&nbsp;
					<button class="btn btn-large btn-default">일괄선택</button>
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: left;">
						<select class="form-control filter" id="borrow-filter"
							name="borrow-filter">
							<option value="0">모든카테고리</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>

						</select> <select class="form-control filter" id="align-filter"
							name="align-filter">
							<option value="0">모든날짜</option>
							<option value="1">최근일주일</option>
							<option value="2">최근한달</option>
						</select>
					</form>
				</div>




				<table class="table table-hover" id="member-table">
					<thead>
						<tr>
							<th>블라인드</th>
							<th>번호</th>
							<th>제목</th>
							<th>ID</th>
							<th>카테고리</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>

					</tbody>
				</table>

				<div id="member-footer">
					<hr />
					<button class="btn btn-md btn-warning btn-msg">새글 작성</button>
				</div>
			</div>

		</div>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>


</body>
</html>