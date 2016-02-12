<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>대출관리</title>

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

#book-table th {
	font-weight: bold;
	font-size: 16px;
}

#book-table td {
	font-size: 15px;
	vertical-align: middle;
}

#book-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

#book-table th, #book-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#book-table td:nth-child(2) {
	text-align: left;
}

#filter {
	border: 0px solid blue;
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

/* modal CSS */
#modal-table td {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 40px;
}

#modal-table td:nth-child(1) {
	width: 30%;
	font-weight: bold;
}

#modal-table td:nth-child(2) {
	width: 70%;
}

#right-box {
	text-align: center;
}

#img-book {
	width: 100%;
	border: 1px solid #888;
}

.btn-dmg-log {
	width: 45%;
	height: 60px;
	font-weight: bold;
	font-size: 20px;
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
					<li class="list-group-item"><a href="">메세지관리</a></li>
				</ul>


			</div>
			<div class="col-md-10">
				<h1 id="mTitle">대출관리</h1>
				<hr class="title-line" />

				<div id="filter">
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control filter" id="borrow-filter"
							name="borrow-filter">
							<option value="0">전체</option>
							<option value="1">예약중</option>
							<option value="2">대출대기</option>
							<option value="3">대출중</option>
							<option value="4">반납완료</option>
						</select>
					</form>
				</div>


				<table class="table table-hover text-center" id="book-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>BOOK ID</th>
							<th>대출일</th>
							<th>반납예정일</th>
							<th>반납일</th>
							<th>대출상태</th>
							<th>대출회원</th>
							<th>대출 및 반납</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>대출대기</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register">대출</button>
								<button class="btn btn-md btn-danger btn-register disabled">반납</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>예약중</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register">대출</button>
								<button class="btn btn-md btn-danger btn-register disabled">반납</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>2016-02-07</td>
							<td>2016-02-07</td>
							<td>반납완료</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register disabled">대출</button>
								<button class="btn btn-md btn-danger btn-register disabled">반납</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>2016-02-07</td>
							<td>-</td>
							<td>대출중</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register disabled">대출</button>
								<button class="btn btn-md btn-danger btn-register">반납</button>
							</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>2016-02-07</td>
							<td>2016-02-07</td>
							<td>반납완료</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register disabled">대출</button>
								<button class="btn btn-md btn-danger btn-register disabled">반납</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>2016-02-07</td>
							<td>-</td>
							<td>대출중</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-warning btn-register disabled">대출</button>
								<button class="btn btn-md btn-danger btn-register">반납</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>

	</div>
</body>
</html>