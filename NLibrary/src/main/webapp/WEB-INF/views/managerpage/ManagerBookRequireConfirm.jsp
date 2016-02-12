<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도서관리</title>

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

#require-table td {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 60px;
}

#require-table td:nth-child(1) {
	width: 20%;
	font-weight: bold;
}

#require-table td:nth-child(2) {
	width: 80%;
}

#img-book {
	width: 80%;
	border: 1px solid #888;
	margin-bottom: 5px;
}

.btn-require {
	width: 80%;
	height: 60px;
	font-weight: bold;
	font-size: 20px;
	margin: 4px 0px;
}
</style>
<script>
	$(document).ready(function() {

		$(".btn-register").on("click", function() {
			$("#modal-dam-los").modal();
		});
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
			<div class="col-md-10" style="margin-top: 10px;">
				<h1 id="mTitle">도서관리 -> 신청도서</h1>
				<hr class="title-line" />
				<div class="row" style="margin: 20px 0px;">
					<div class="col-md-7">
						<table class="table text-center" id="require-table">

							<tbody>
								<tr>
									<td>제목</td>
									<td>이것이 자바다</td>
								</tr>

								<tr>
									<td>지은이</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>출판사</td>
									<td>oo출판</td>
								</tr>
								<tr>
									<td>발행년도</td>
									<td>2016-01-03</td>
								</tr>
								<tr>
									<td>ISBN</td>
									<td>32432432</td>
								</tr>
								<tr>
									<td>신청인</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>신청일</td>
									<td>2016-02-02</td>
								</tr>
								<tr>
									<td>신청한마디</td>
									<td>NDS임직원들이 있으면 도움이 될 수 있다고 생각하여 신청합니다!</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-5 text-center">
						<img src="pictures/booksample01.jpg" alt="" id="img-book" />
						<button class="btn btn-primary btn-require">승인</button>
						<button class="btn btn-danger btn-require">반려</button>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>