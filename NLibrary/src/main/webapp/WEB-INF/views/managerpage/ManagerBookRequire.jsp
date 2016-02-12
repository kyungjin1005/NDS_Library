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

#book-table tbody tr:HOVER {
	cursor: pointer;
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
	width: 20%;
	font-weight: bold;
}

#modal-table td:nth-child(2) {
	width: 30%;
}

#modal-table td:nth-child(3) {
	width: 20%;
	font-weight: bold;
}

#modal-table td:nth-child(4) {
	width: 30%;
}

#right-box {
	text-align: center;
}

#img-book {
	width: 70%;
	border: 1px solid #888;
}

.btn-modal {
	width: 70%;
	font-weight: bold;
	font-size: 20px;
	font-weight: bold;
	margin: 10px 0px;
}
</style>
<script>
	$(document).ready(
			function() {

				$("#borrow-filter option:eq(${filter})").attr("selected",
						"selected");

				$(".btn-register").on("click", function() {
					$("#modal-dam-los").modal();
				});

				$("#borrow-filter").change(
						function() {
							$(location).attr(
									"href",
									"ManagerBookRequire.nds?filter="
											+ $("#borrow-filter").val());
						});
				
			});
	

	function goConfirm(req_don_id) {
		$(location).attr(
				"href",
				"ManagerBookRequireConfirm.nds?req_don_id="+req_don_id);
	
	}
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
			<div class="col-md-10">
				<h1 id="mTitle">도서관리 -> 신청도서</h1>
				<hr class="title-line" />

				<div id="filter">
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control filter" id="borrow-filter"
							name="borrow-filter">
							<option value="0">전체</option>
							<option value="1">구매완료</option>
							<option value="2">신청완료</option>
							<option value="3">신청대기</option>
							<option value="4">신청반려</option>
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
							<th>신청자</th>
							<th>신청일</th>
							<th>승인상태</th>
							<th>완료일/구매일</th>
							<th>도서등록</th>
						</tr>
					</thead>
					<tbody>

						<!-- <tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>2016-02-02</td>
							<td>승인완료</td>
							<td>2016-02-03</td>
							<td>
								<button class="btn btn-md btn-danger btn-register">
									도서등록</button>
							</td>
						</tr> -->
						<c:set var="count" value="1"></c:set>
						<c:forEach var="book" items="${requireList}">
							<tr class="item" onclick="goConfirm(${book.req_don_id})">
								<td>${count}</td>
								<td><img src="${book.image}" alt="" /><span>${book.title }</span></td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.name}</td>
								<td>${book.registered_date}</td>
								<td>${empty book.current_state?"-":book.current_state}</td>
								<td>${empty book.finished_date?"-":book.finished_date}</td>
								<td>
									<button class="btn btn-md btn-danger btn-register"
										${book.current_state=='신청완료'?"disabled=\"disalbed\"":""}>도서등록</button>
								</td>
							</tr>
							<c:set var="count" value="${count+1}"></c:set>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="modal-dam-los" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="mTitle">도서등록</h4>
					</div>
					<div class="modal-body text-center">

						<div class="row" style="margin: 20px 0px;">
							<div class="col-md-8">
								<table class="table text-center" id="modal-table">
									<tbody>
										<!-- <tr>
											<td>BOOK ID</td>
											<td colspan="3">32432432</td>
										</tr> -->
										<tr>
											<td>ISBN ID</td>
											<td>32432432</td>
											<td>대분류</td>
											<td>
												<form class="form-inline" role="form" method="post"
													style="display: inline-block;">
													<select class="form-control filter" id="borrow-filter"
														name="borrow-filter">
														<option value="0">java</option>
														<option value="1">database</option>
														<option value="2">spring</option>
														<option value="3">mybatis</option>
														<option value="4">servlet/jsp</option>
													</select>

												</form>

											</td>
											<!-- <td>청구기호</td>
											<td>100.xxx</td> -->
										</tr>
										<tr>
											<td>제목</td>
											<td colspan="3">이것이 자바다</td>

										</tr>

										<tr>
											<td>저자</td>
											<td colspan="3">홍길동</td>
										</tr>
										<tr>
											<td>출판사</td>
											<td colspan="3">oo출판</td>
										</tr>
										<tr>
											<td>신청일</td>
											<td colspan="3">2016-01-03</td>
										</tr>
										<tr>
											<td>신청자</td>
											<td colspan="3">홍길동</td>
										</tr>
										<tr>
											<td>신청한마디</td>
											<td colspan="3">NDS임직원들이 읽으면 도움이 될 수 있을 것 같습니다.</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="col-md-4" id="right-box">
								<img src="pictures/booksample01.jpg" alt="" id="img-book" />
								<button type="button" class="btn btn-warning btn-lg  btn-modal"
									data-dismiss="modal">도서등록</button>

							</div>

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
</html>