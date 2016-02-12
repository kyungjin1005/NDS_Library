<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>공지사항</title>

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
					<img src="pictures/boardpage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="">공지사항</a></li>
					<li class="list-group-item"><a href="">도서신청</a></li>
					<li class="list-group-item"><a href="">기증도서</a></li>
					<li class="list-group-item"><a href="">스터디모집</a></li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">공지사항</h1>

				<hr class="title-line" />
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>105</td>
							<td><a href="#">1월 3째주 IT핫이슈</a></td>
							<td>관리자</td>
							<td>2016-01-22</td>
							<td>100</td>
						</tr>
						<tr>
							<td>104</td>
							<td><a href="#">1월 2째주 IT핫이슈</a></td>
							<td>김혜원</td>
							<td>2016-01-21</td>
							<td>200</td>
						</tr>
						<tr>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
						</tr>
						<tr>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
						</tr>
						<tr>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
						</tr>
						<tr>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
						</tr>
						<tr>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
							<td>...</td>
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