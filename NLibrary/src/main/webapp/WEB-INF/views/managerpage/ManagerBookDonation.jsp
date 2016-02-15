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
	font-size: 15px;
}

#donation-table td {
	font-size: 13px;
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

#donation-table td:nth-child(1) { // 번호
	width: 5%;
}
#donation-table td:nth-child(2) { // 제목
	width: 30%;
}
#donation-table td:nth-child(3) { // 저자
	width: 10%;
}
#donation-table td:nth-child(5) { // 출판사
	width: 20%;
}
#donation-table td:nth-child(6) { // 기증인
	width: 5%;
}
#donation-table td:nth-child(7) { // 기증일
	width: 10%;
}
#donation-table td:nth-child(8) { // 기증사애
	width: 10%;
}
#donation-table td:nth-child(9) { // 도서등록
	width: 10%;
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
							<th>도서등록</th>
						</tr>
					</thead>
					<tbody>

						<!-- <tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>ㅇㅇ출판</td>
							<td>김아무개</td>
							<td>2016-02-02</td>
							<td>기증완료</td>
						</tr> -->
						<c:set var="count" value="1"></c:set>
						<c:forEach var="book" items="${donationList}">
							<tr class="item">
								<td>${count}</td>
								<td><img src="${book.image}" alt="${book.req_don_id}" /><span>${book.title }</span></td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.name}</td>
								<td>${book.registered_date}</td>
								<td>${empty book.current_state?"-":book.current_state}</td>
								<td>
								<c:choose>
										<c:when test="${book.current_state=='기증대기'}">
										<button class="btn btn-md btn-danger btn-register" value="${book.req_don_id}">승인 및 등록</button>
										</c:when>
										<c:otherwise>
										<button class="btn btn-md btn-default" value="${book.req_don_id}" disabled="disabled">처리완료</button>
										</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<c:set var="count" value="${count+1}"></c:set>
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
	$(document).ready(function() {
		
		$("#donation-filter option:eq(${filter})").attr("selected",
		"selected");

		$("#donation-filter").change(
			function() {
				$(location).attr(
						"href",
						"ManagerBookDonation.nds?filter="
								+ $("#donation-filter").val());
		});

		$(".btn-register").on("click",
				function() {
					$(location).attr("href",
							"ManagerBookDonationConfirm.nds?req_don_id=" + $(this).val());

		});
	});
</script>
</html>