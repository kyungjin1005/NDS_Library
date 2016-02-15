<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원정보</title>

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

#member-picture {
	width: 90%;
}

#info-header {
	font-family: "맑은고딕";
	font-weight: bold;
	vertical-align: middle;
	font-size: 20px;
	font-family: "맑은고딕";
	font-weight: bold;
}

#member-table {
	margin: 0px auto;
}

#member-table th {
	border-right: 1px solid #ddd;
	width: 30%;
	height: 20px;
	font-weight: bold;
	font-size: 15px;
	width: 30%;
}

#member-table th, #member-table td {
	font-family: "맑은고딕";
	text-align: center;
	vertical-align: middle;
}

#member-table td {
	font-size: 15px;
}

section {
	margin-top: 30px;
}

.sub-title {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 20px;
	align-items: center;
}

.icon {
	font-size: 25px;
}

.sub-title-line {
	border: 1px solid #dd0000;
	margin-top: 5px;
	margin-bottom: 40px;
}

.sub-table th {
	font-weight: bold;
	font-size: 16px;
	background-color: #eee;
	text-align: center;
}

.sub-table td {
	font-size: 15px;
}

.sub-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

.sub-table td:nth-child(2) {
	text-align: left;
}

#borrow-table td, #require-table td, #donation-table td {
	vertical-align: middle;
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
			<div class="col-md-10">
				<h1 id="mTitle">회원관리->회원정보</h1>
				<hr class="title-line" />

				<div class="row">
					<div class="col-md-3">

						<img src=${user.picture } alt="" id="member-picture" />
					</div>
					<div class="col-md-9">
						<div class="panel panel-info">

							<div class="panel-heading" id="info-header">회원정보</div>
							<div class="panel-body" style="padding: 8px">

								<table class="table sub-table" id="member-table">
									<tbody>
										<tr>
											<th>이름</th>
											<td>${user.name }</td>
										</tr>
										<tr>
											<th>사번</th>
											<td>${user.nds_number }</td>
										</tr>
										<tr>
											<th>부서</th>
											<td>${user.department }</td>
										</tr>
										<tr>
											<th>직위</th>
											<td>${user.position }</td>
										</tr>
										<tr>
											<th>입사날짜</th>
											<td>${user.registered_date }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<section class="row">

					<div class="sub-title">

						<span class="glyphicon glyphicon-list-alt icon"></span> <span>대여내역</span><span
							class="badge" style="margin-left: 3px">${bSize}</span>
					</div>
					<hr class="sub-title-line" />
					<table class="table table-bordered text-center sub-table"
						id="borrow-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>대출일</th>
								<th>반납예정일</th>
								<th>반납일</th>
								<th>대출상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>
								<td>1</td>
								<td><img src="" alt="" /><span>이것이자바다</span></td>
								<td>홍길동</td>
								<td>ㅇㅇ출판사</td>
								<td>2016-01-22</td>
								<td>2016-02-05</td>
								<td>2016-02-05</td>
								<td>반납완료</td>
							</tr> -->

							<c:set var="count" value="1"></c:set>
							<c:forEach var="book" items="${bList}">
								<tr>
									<td>${count }</td>
									<td><img src=${book.image } alt="" /><span>${book.title}</span></td>
									<td>${book.author}</td>
									<td>${book.publisher}</td>
									<td>${empty book.borrowing_date?"-":book.borrowing_date}</td>
									<td>${empty book.scheduled_date?"-":book.scheduled_date}</td>
									<td>${empty book.returned_date?"-":book.returned_date}</td>
									<td>
									<c:choose>
										<c:when test="${empty book.returned_date}">
										대여중
										</c:when>
										<c:otherwise>
										반납완료
										</c:otherwise>
									</c:choose>
									</td>
								</tr>

							<c:set var="count" value="${count+1}"></c:set>
							</c:forEach>
						</tbody>
					</table>


				</section>


				<section class="row">

					<div class="sub-title">

						<span class="glyphicon glyphicon-list-alt icon"></span> <span
							style="">도서신청내역</span><span class="badge"
							style="margin-left: 3px">${rSize }</span>
					</div>
					<hr class="sub-title-line" />


					<table class="table table-bordered text-center sub-table"
						id="require-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>신청일</th>
								<th>신청상태</th>
								<th>완료일/구매일</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>

							<!-- <tr>
								<td>1</td>
								<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
								<td>홍길동</td>
								<td>ㅇㅇ출판사</td>
								<td>2016-01-22</td>
								<td>구매완료</td>
								<td>2016-02-05</td>
								<td>-</td>
							</tr> -->
							<c:set var="count" value="1"></c:set>
							<c:forEach var="book" items="${rList}">
								<tr>
									<td>${count }</td>
									<td><img src=${book.image } alt="" /><span>${book.title}</span></td>
									<td>${book.author}</td>
									<td>${book.publisher}</td>
									<td>${empty book.registered_date?"-":book.registered_date}</td>
									<td>${empty book.current_state?"-":book.current_state}</td>
									<td>${empty book.finished_date?"-":book.finished_date}</td>
									<td>${empty book.manager_comment?"-":book.manager_comment}</td>
								</tr>
							<c:set var="count" value="${count+1}"></c:set>
							</c:forEach>

						</tbody>
					</table>

				</section>

				<section class="row">

					<div class="sub-title">

						<span class="glyphicon glyphicon-list-alt icon"></span> <span
							style="">도서기증내역</span><span class="badge"
							style="margin-left: 3px">${dSize }</span>
					</div>
					<hr class="sub-title-line" />


					<table class="table table-bordered text-center sub-table"
						id="donation-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>기증일</th>
								<th>기증상태</th>
								<th>완료일/구매일</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>

							<!-- <tr>
								<td>1</td>
								<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
								<td>홍길동</td>
								<td>ㅇㅇ출판사</td>
								<td>2016-01-22</td>
								<td>기증완료</td>
								<td>2016-02-05</td>
								<td>-</td>
							</tr> -->
							
							<c:set var="count" value="1"></c:set>
							<c:forEach var="book" items="${dList}">
								<tr>
									<td>${count }</td>
									<td><img src=${book.image } alt="" /><span>${book.title}</span></td>
									<td>${book.author}</td>
									<td>${book.publisher}</td>
									<td>${empty book.registered_date?"-":book.registered_date}</td>
									<td>${empty book.current_state?"-":book.current_state}</td>
									<td>${empty book.finished_date?"-":book.finished_date}</td>
									<td>${empty book.manager_comment?"-":book.manager_comment}</td>
								</tr>
							<c:set var="count" value="${count+1}"></c:set>
							</c:forEach>
						</tbody>
					</table>

				</section>
			</div>

		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>