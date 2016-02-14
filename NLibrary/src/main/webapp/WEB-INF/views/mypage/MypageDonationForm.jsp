<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도서기증하기</title>

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

#donation-table td {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 80px;
}

#donation-table td:nth-child(1) {
	width: 20%;
	font-weight: bold;
}

#donation-table td:nth-child(2) {
	width: 80%;
}

#right-box {
	text-align: center;
}

#img-book {
	width: 100%;
	border: 1px solid #888;
	margin-bottom: 10px;
}

#btn-donation {
	width: 100%;
	height: 60px;
	font-weight: bold;
	font-size: 20px;
}
</style>
<script>
	$(document).ready(function() {
		$("#btn-require").on("click", function() {
			$("#req-modal").modal();
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
				<h1 id="mTitle">도서기증하기</h1>
				<hr class="title-line" />

				<div class="row" style="margin: 20px 0px;">
					<form role="form" action="MypageDonationAdd.nds" method="post">
					<input type="hidden" name="registered_date" value="${book.registered_date}" />
					<input type="hidden" name="title" value="${book.title}" />
					<input type="hidden" name="author" value="${book.author}" />
					<input type="hidden" name="publisher" value="${book.publisher}" />
					<input type="hidden" name="pubdate" value="${book.pubdate}" />
					<input type="hidden" name="isbn" value="${book.isbn}" />
					<input type="hidden" name="image" value="${book.image}" />
					<input type="hidden" name="explanation" value="${book.explanation}" />
						<div class="col-md-7">
							<table class="table text-center" id="donation-table">

								<tbody>
								
								<tbody>
									<tr>
										<td>제목</td>
										<td>${book.title }</td>
									</tr>

									<tr>
										<td>지은이</td>
										<td>${book.author }</td>
									</tr>
									<tr>
										<td>출판사</td>
										<td>${book.publisher }</td>
									</tr>
									<tr>
										<td>발행년도</td>
										<td>${book.pubdate }</td>
									</tr>
									<tr>
										<td>ISBN</td>
										<td>${book.isbn }</td>
									</tr>
									<tr>
										<td>기증일</td>
										<td>${book.registered_date}</td>
									</tr>
									<tr>
										<td>기증한마디</td>
										<td><input type="text" class="form-control"
											id="user_comment" name="user_comment" placeholder="(30자 이내)"
											maxlength="30" required="required"></td>
									</tr>
									
								</tbody>
							</table>
						</div>
						<div class="col-md-5" id="right-box">
							<img src=${book.image } alt="" id="img-book" />
							<button type="submit" class="btn btn-warning" id="btn-donation">기증하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>