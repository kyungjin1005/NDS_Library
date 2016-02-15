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

#donation-table tbody tr:HOVER {
	cursor: pointer;
}

#donation-table th {
	font-weight: bold;
	font-size: 16px;
}

#donation-table td {
	font-size: 15px;
	vertical-align: middle;
}

#donation-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

#donation-table th, #donation-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#donation-table td:nth-child(2) {
	text-align: left;
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
			<%@include file="ManagerpageSidebar.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">도서관리 -> 기증도서</h1>
				<hr class="title-line" />

				<div id="filter">
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control filter" id="donation-filter"
							name="donation-filter">
							<option value="0">전체</option>
							<option value="1">기증완료</option>
							<option value="2">기증대기</option>
							<option value="3">기증반려</option>
						</select>
					</form>
				</div>


				<table class="table table-hover text-center" id="donation-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>기증인</th>
							<th>기증일</th>
							<th>기증상태</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
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