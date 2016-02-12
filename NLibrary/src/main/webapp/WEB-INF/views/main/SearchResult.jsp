<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>검색결과</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
#result {
	margin-top: 120px;
}

.title-line {
	border: 1px solid red;
	margin-top: 5px;
	margin-bottom: 20px;
}

.mTitle {
	font-weight: bold;
	font-size: 25px;
	vertical-align: middle;
	background-image: url("pictures/title.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
}

.mTitle span {
	margin-left: 20px;
}

#filter {
	border: 0px solid blue;
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

#filter span {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
	color: #2C2255;
}

table tbody tr:HOVER {
	text-decoration: underline;
	cursor: pointer;
}

#result-table th {
	font-weight: bold;
	font-size: 16px;
}

#result-table td {
	font-size: 15px;
	vertical-align: middle;
}

#result-table td:nth-child(2) {
	text-align: left;
}

#result-table td img {
	width: 60px;
	margin-right: 15px;
	border: 0px solid red;
	/* float: left; */
}

#result-table th, #borrow-table td {
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

		<div id="result">
			<div class="mTitle">
				<span>검색결과</span>

			</div>
			<hr class="title-line" />
		</div>

		<div id="filter">
			<span>검색 결과가 총 <span>3</span> 권 있습니다.
			</span>

			<form class="form-inline" role="form" method="post"
				style="display: inline-block; float: right;">
				<select class="form-control" id="borrow-filter" name="borrow-filter">
					<option value="0">전체</option>
					<option value="1">대출가능</option>
				</select>
			</form>
		</div>

		<table class="table table-hover text-center" id="result-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>발행일</th>
					<th>평점</th>
					<th>대출상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
					<td>홍길동</td>
					<td>한빛미디어</td>
					<td>2016-02-05</td>
					<td>☆★★★★</td>
					<td>대출가능</td>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
					<td>홍길동</td>
					<td>한빛미디어</td>
					<td>2016-02-05</td>
					<td>☆★★★★</td>
					<td>대출가능</td>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
					<td>홍길동</td>
					<td>한빛미디어</td>
					<td>2016-02-05</td>
					<td>☆★★★★</td>
					<td>대출가능</td>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
					<td>홍길동</td>
					<td>한빛미디어</td>
					<td>2016-02-05</td>
					<td>☆★★★★</td>
					<td>대출가능</td>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
					<td>홍길동</td>
					<td>한빛미디어</td>
					<td>2016-02-05</td>
					<td>☆★★★★</td>
					<td>대출가능</td>
				</tr>
			</tbody>
		</table>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>