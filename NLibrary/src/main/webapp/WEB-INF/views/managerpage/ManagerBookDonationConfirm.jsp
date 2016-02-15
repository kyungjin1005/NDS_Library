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

#donation-table {
	width: 100%;
	margin: 0px auto;
}

#donation-table td {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 60px;
}

#donation-table td:nth-child(1) {
	font-weight: bold;
	width: 20%;
}

#donation-table td:nth-child(2) {
	width: 30%;
}

#donation-table td:nth-child(3) {
	font-weight: bold;
	width: 20%;
}

#donation-table td:nth-child(4) {
	width: 30%;
}

#img-book {
	width: 95%;
	border: 1px solid #eee;
	margin-bottom: 10px;
}

.btn-donation {
	width: 95%;
	height: 55px;
	font-weight: bold;
	font-size: 30px;
	margin: 4px 0px;
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

				<div class="row" style="margin: 20px 0px;">
					<div class="col-md-8">
						<table class="table text-center" id="donation-table">
							<tbody>
								<tr>
									<td>기증인</td>
									<td>홍길동</td>
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
									<td>기증일</td>
									<td colspan="3">2016-02-02</td>

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
									<td>발행일</td>
									<td colspan="3">2016-01-03</td>
								</tr>
								<tr>
									<td>ISBN</td>
									<td colspan="3">3432423</td>
								</tr>
								<tr>
									<td>기증한마디</td>
									<td colspan="3">NDS임직원들이 읽으면 도움이 될 수 있을 것 같습니다.</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-md-4 text-center">
						<img src="pictures/booksample01.jpg" alt="" id="img-book" />
						<button class="btn btn-primary btn-donation" id="btn-register">승인
							및 도서등록</button>
						<button class="btn btn-danger btn-donation" id="btn-reject">반려</button>

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