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

#box {
	margin-top: 20px;
	width: 95%;
	margin: 0px auto;
}

#msg-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 70px;
	text-align: left;
	font-size: 18px;
	font-family: "맑은고딕";
	line-height: 2em;
	font-family: "맑은고딕";
}

#msg-table th {
	width: 20%;
	vertical-align: middle;
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 18px;
	text-align: left;
}

#msg-table td {
	padding: 10px;
}

#btn-msg {
	text-align: right;
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
			<div class="col-md-10 body-box">
				<h1 id="mTitle">회원관리</h1>
				<hr class="title-line" />
				<div id="box">
					<form action="" method="POST">
						<table class="table" id="msg-table">
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" required="required"
									class="form-control" id="title" /></td>
							</tr>
							<tr>
								<th>받는사람</th>
								<td>홍길동</td>
							</tr>
							
							<tr>
								<th>부서/직위</th>
								<td>개발본부 / 사원</td>
							</tr>

							<tr>
								<th>내용</th>
								<td><textarea name="content" required="required"
										class="form-control" id="content" style="height: 300px;"></textarea></td>
							</tr>
						</table>

						<div id="btn-msg">
							<input class="btn btn-default" type="button" value="돌아가기"
								onclick="history.back();"  /> 
								<input type="submit" value="메세지 보내기" class="btn btn-warning" />
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