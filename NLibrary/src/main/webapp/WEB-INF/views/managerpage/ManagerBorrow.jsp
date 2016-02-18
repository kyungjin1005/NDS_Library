<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/include/link.jsp"%>

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
</head>
<body>
	<div class="container">
		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">대출관리</h1>
				<hr class="title-line" />

				<form class="form-inline" role="form" method="get"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="borrow-filter"
						name="borrow-filter">
						<option value="0">전체</option>
						<option value="1">예약 도서</option>
						<!-- 이미 대출중인 책을 예약한 상태 -->
						<option value="2">대출 신청 도서</option>
						<!-- 관리자의 승인을 기다리는 상태 -->
						<option value="3">대출 도서</option>
					</select>
				</form>


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
						<c:forEach var="borrowing" items="${borrowingList}">
							<tr>
								<td>${borrowing.borrowing_id }</td>
								<td><img src="pictures/booksample01.jpg" alt="" /><span>${borrowing.title}</span></td>
								<td>${borrowing.book_id}</td>
								<td><c:choose>
										<c:when test="${borrowing.borrowing_date != null}">
											${borrowing.borrowing_date}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${borrowing.scheduled_date != null}">
											${borrowing.scheduled_date}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${borrowing.returned_date != null}">
											${borrowing.returned_date}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose></td>
								<td>${borrowing.current_state }</td>
								<td>${borrowing.name }</td>
								<td>
									<button class="btn btn-md btn-warning btn-borrow"
										value="${borrowing.borrowing_id }">대출</button>
									<button class="btn btn-md btn-danger btn-return"
										value="${borrowing.borrowing_id }">반납</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
<script>
	$(document).ready(
			function() {
				$(".btn-borrow").on(
						"click",
						function() {
							$(location).attr(
									"href",
									"changeToBorrow.nds?borrowing_id="
											+ $(this).val());
							alert("책이 대출되었습니다.");
						});
				$(".btn-return").on(
						"click",
						function() {
							$(location).attr(
									"href",
									"changeToReturn.nds?borrowing_id="
											+ $(this).val());
							alert("책이 반납되었습니다.");
						});

				$("#borrow-filter option:eq(${filter})").attr("selected",
						"selected");

				$("#borrow-filter").change(
						function() {
							$(location).attr(
									"href",
									"ManagerBorrow.nds?filter="
											+ $("#borrow-filter").val());
						});
			});
</script>
</html>