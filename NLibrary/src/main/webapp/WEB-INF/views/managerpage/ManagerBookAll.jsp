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
</head>
<body>
	<div class="container">
		<header>
			<%@include file="/include/header.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/ManagerpageSidebar.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">도서관리 -> 모든도서</h1>
				<hr class="title-line" />

				<div id="filter">
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control filter" id="borrow-filter"
							name="borrow-filter">
							<option value="0">전체</option>
							<option value="1">대출대기</option>
							<option value="2">대출가능</option>
							<option value="3">대출중</option>
							<option value="4">파손도서</option>
							<option value="5">분실도서</option>
						</select> <select class="form-control filter" id="align-filter"
							name="align-filter">
							<option value="0">정렬기준</option>
							<option value="1">입고일순</option>
							<option value="2">가나다순</option>
						</select>
					</form>
				</div>


				<table class="table table-hover text-center" id="book-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>BOOK ID</th>
							<th>입고일</th>
							<th>대출상태</th>
							<th>대출회원</th>
							<th>파손 및 분실</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>대출중</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">파손 및
									분실 등록</button>
							</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>대출중</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">파손 및
									분실 등록</button>
							</td>
						</tr>


						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>대출대기</td>
							<td>김아무개</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">파손 및
									분실 등록</button>
							</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>대출가능</td>
							<td>-</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">파손 및
									분실 등록</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>대출가능</td>
							<td>-</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">파손 및
									분실 등록</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>파손도서</td>
							<td>-</td>
							<td>
								<button class="btn btn-md btn-danger btn-register disabled">파손
									및 분실 등록</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>32434353</td>
							<td>2016-02-02</td>
							<td>분실도서</td>
							<td>-</td>
							<td>
								<button class="btn btn-md btn-danger btn-register disabled">파손
									및 분실 등록</button>
							</td>
						</tr>


					</tbody>
				</table>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="modal-dam-los" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="mTitle">분실 및 파손 등록</h4>
					</div>
					<div class="modal-body text-center">

						<div class="row" style="margin: 20px 0px;">
							<div class="col-md-7">
								<table class="table text-center" id="modal-table">
									<tbody>
										<tr>
											<td>제목</td>
											<td>이것이 자바다</td>
										</tr>

										<tr>
											<td>저자</td>
											<td>홍길동</td>
										</tr>
										<tr>
											<td>출판사</td>
											<td>oo출판</td>
										</tr>
										<tr>
											<td>발행일</td>
											<td>2016-01-03</td>
										</tr>
										<tr>
											<td>입고일</td>
											<td>2016-01-03</td>
										</tr>
										<tr>
											<td>BOOK ID</td>
											<td>32432432</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-5" id="right-box">
								<img src="pictures/booksample01.jpg" alt="" id="img-book" />
							</div>

						</div>
						<div class="row" style="margin-bottom: 10px;">
							<button type="button" class="btn btn-primary btn-lg btn-dmg-log"
								data-dismiss="modal">분실등록</button>
							<button type="button" class="btn btn-danger btn-lg btn-dmg-log"
								data-dismiss="modal">파손등록</button>
						</div>

					</div>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
<script>
	$(document).ready(function() {

		$(".btn-register").on("click", function() {
			$("#modal-dam-los").modal();
		});
	});
</script>
</html>