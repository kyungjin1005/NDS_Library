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

<style type="text/css">
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
			<%@include file="ManagerpageSidebar.jsp"%>
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