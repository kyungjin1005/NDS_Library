<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메세지함</title>

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
	margin-bottom: 30px;
}

#msg-table tbody tr:HOVER {
	cursor: pointer;
}

#msg-table th {
	font-weight: bold;
	font-size: 16px;
	background-color: #eee;
}

#msg-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 70px;
}

#msg-table th, #msg-table td {
	text-align: center;
	font-family: "맑은고딕";
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
					<img src="pictures/mypage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="">대출현황조회</a></li>
					<li class="list-group-item"><a href="">메세지함</a></li>
					<li class="list-group-item"><a href="">도서신청현황</a></li>
					<li class="list-group-item"><a href="">도서기증현황</a></li>
				</ul>
			</div>
			<div class="col-md-10"">
				<h1 id="mTitle">메세지함</h1>
				<hr class="title-line" />



				<form class="form-inline" role="form" method="post"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="borrow-filter"
						name="borrow-filter">
						<option value="0">전체</option>
						<option value="1">읽은 메세지</option>
						<option value="2">안읽은 메세지</option>
					</select>
				</form>


				<table class="table text-center" id="msg-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>보낸사람</th>
							<th>받은날짜</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서...</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내.....</td>
							<td>관리자</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서...</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내.....</td>
							<td>관리자</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서...</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내.....</td>
							<td>관리자</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서...</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내.....</td>
							<td>관리자</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서...</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내.....</td>
							<td>관리자</td>
							<td>2016-02-05</td>
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