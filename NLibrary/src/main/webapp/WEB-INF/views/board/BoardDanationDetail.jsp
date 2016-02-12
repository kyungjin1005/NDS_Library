<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>기증도서</title>

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

.sub-title {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 20px;
	align-items: center;
	margin-top: 50px;
}

.icon {
	font-size: 25px;
}

.sub-title-line {
	border: 1px solid #888;
	margin-top: 5px;
	margin-bottom: 40px;
}

#donation-table {
	width: 100%;
	margin: 0px auto;
}

#donation-table th {
	width: 30%;
}

#donation-table td, #donation-table th {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 50px;
}

#img-book {
	width: 100%;
	border: 1px solid #eee;
	margin-bottom: 10px;
}

#alert-state {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 13px;
}

#reply-table th {
	font-weight: bold;
	font-size: 16px;
}

#reply-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 40px;
}

#reply-table th, #reply-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#btn-write {
	width: 100%;
	height: 100%;
	font-weight: bold;
	font-size: 15px;
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
					<li class="list-group-item">Java</li>
					<li class="list-group-item">Database</li>
					<li class="list-group-item">JSP/Servlet</li>
					<li class="list-group-item">Cloud</li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">기증도서</h1>
				<hr class="title-line" />
				<div class="row" style="margin: 20px 0px;">
					<div class="col-md-8">
						<table class="table text-center" id="donation-table">
							<tbody>
								<tr>
									<th>기증인</th>
									<td>홍길동</td>


								</tr>
								<tr>
									<th>기증일</th>
									<td>2016-02-02</td>

								</tr>
								<tr>
									<th>제목</th>
									<td>이것이 자바다</td>
								</tr>
								<tr>
									<th>저자</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th>출판사</th>
									<td>oo출판</td>
								</tr>
								<tr>
									<th>발행일</th>
									<td>2016-01-03</td>
								</tr>
								<tr>
									<th>ISBN</th>
									<td>3432423</td>
								</tr>
								<tr>
									<th>기증한마디</th>
									<td colspan="3">NDS임직원들이 읽으면 도움이 될 수 있을 것 같습니다.</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-md-4 text-center">
						<img src="pictures/booksample01.jpg" alt="" id="img-book" />
						<div class="alert alert-info" id="alert-state">
							기증상태 : <span>기증완료</span>
						</div>

					</div>
				</div>


				<div class="sub-title">
					<span class="glyphicon glyphicon-list-alt icon"></span> <span>댓글</span>
					<span class="badge" style="margin-left: 3px">3</span>
					<hr class="sub-title-line" />
				</div>
				<table class="table table-hover text-center" id="reply-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>댓글</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>

					</tbody>
				</table>
				<form role="form">

					<div class="row">
						<div class="col-md-11">
							<div class="form-group">
								<input type="text" placeholder="댓글을 입력해주세요(50)"
									required="required" maxlength="100" class="form-control"
									id="comment">
							</div>
						</div>
						<div class="col-md-1" style="padding: 0px; margin: 0px;">
							<button class="btn btn-lg btn-warning" id="btn-write">등록</button>
						</div>
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