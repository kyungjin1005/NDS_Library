<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도서기증현황</title>

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
	margin-bottom: 30px;
}

#donation-table th {
	font-weight: bold;
	font-size: 16px;
	height: 50px;
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

#don-modal {
	
}

.modal-content {
	z-index: 1;
	max-height: 800px;
	overflow-y: scroll;
}

#don-search {
	margin: 10px 0px;
}

#modal-table {
	width: 100%;
	margin: 0px auto;
}

#modal-table th {
	font-weight: bold;
	font-size: 16px;
}

#modal-table td {
	vertical-align: middle;
	margin: 0px 10px;
	font-size: 12px;
	line-height: 2em;
}

#modal-table th, #modal-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#modal-table td:nth-child(1) {
	width: 10%;
}

#modal-table td:nth-child(2) {
	text-align: left;
	width: 70%;
}

#modal-table td:nth-child(3) {
	width: 20%;
}

.clearfix {
	overflow: auto;
	vertical-align: middle;
	border: 0px solid red;
	display: flex;
	align-items: center;
}

.modal-img {
	float: left;
	width: 100px;
	margin-right: 20px;
	border: 0px solid blue;
}

.modal-list {
	border: 0px solid green;
	margin-bottom: 0px;
}

#modal-table td li:first-child {
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {
		$("#btn-donation").on("click", function() {
			$("#don-modal").modal();
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
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/mypage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="">대출현황조회</a></li>
					<li class="list-group-item"><a href="">메세지함</a></li>
					<li class="list-group-item"><a href="">도서신청현황</a></li>
					<li class="list-group-item"><a href="">도서기증현황</a></li>
				</ul>

			</div>
			<div class="col-md-10"">
				<h1 id="mTitle">도서기증현황</h1>
				<hr class="title-line" />
				
				<form class="form-inline" role="form" method="post"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="borrow-filter"
						name="borrow-filter">
						<option value="0">전체</option>
						<option value="1">기증대기</option>
						<option value="2">기증완료</option>
						<option value="3">기증반려</option>
					</select>
				</form>
				
				<table class="table table-hover text-center" id="donation-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>기증일</th>
							<th>기증상태</th>
							<th>완료일</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>oo출판</td>
							<td>2016-02-05</td>
							<td>기증완료</td>
							<td>2016-02-05</td>
							<td>-</td>
						</tr>


						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>oo출판</td>
							<td>2016-02-05</td>
							<td>기증대기</td>
							<td>-</td>
							<td>-</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>oo출판</td>
							<td>2016-02-05</td>
							<td>기증대기</td>
							<td>-</td>
							<td>-</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>oo출판</td>
							<td>2016-02-05</td>
							<td>기증반려</td>
							<td>2016-02-05</td>
							<td>파손도서</td>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>홍길동</td>
							<td>oo출판</td>
							<td>2016-02-05</td>
							<td>기증완료</td>
							<td>2016-02-05</td>
							<td>-</td>
						</tr>

					</tbody>
				</table>

				<div style="text-align: right;">
					<button class="btn btn-lg btn-warning" id="btn-donation">기증하기</button>
				</div>
			</div>

		</div>



		<!-- Modal -->
		<div class="modal fade" id="don-modal" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="mTitle">도서기증하기</h4>
					</div>
					<div class="modal-body text-center">

						<form class="form-inline">
							<div id="don-search">
								<input type="search" class="form-control" size="50"
									placeholder="책 제목을 입력하세요">
								<button type="button" class="btn btn-danger">검색</button>
							</div>
						</form>

						<table class="table table-hover text-center" id="modal-table">
							<thead>
								<tr>
									<th>번호</th>
									<th>책정보</th>
									<th>기증하기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>
										<div class="clearfix">
											<img src="pictures/booksample01.jpg" alt="" class="modal-img" />
											<ul class="modal-list">
												<li>프로그래머로 사는 법</li>

												<li>저자 - <span class="mb-title">샘 라이트스톤</span></li>
												<li>출판사 - <span class="mb-company">한빛미디어</span></li>
												<li>발행일 - <span class="mb-pubdate">2012.10.04</span></li>
												<li>ISBN - <span class="mb-isbn"> 9788979149623</span></li>
											</ul>
										</div>
									</td>

									<td>
										<button class="btn btn-md btn-default">기증하기</button>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<div></div>
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