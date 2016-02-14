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

		$("#btn-register").on("click", function() {
		});
		$("#btn-reject").on("click", function() {
			$("#modal-reject").modal();
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
				<h1 id="mTitle">도서관리 -> 기증도서</h1>
				<hr class="title-line" />

				<div class="row" style="margin: 20px 0px;">
				<form class="form-inline" role="form" method="post" action="ManagerDonationRegisterBook.nds">
				<input type="hidden" name="req_don_id" value="${book.req_don_id}" />
					<div class="col-md-8">
						<table class="table text-center" id="donation-table">
							<tbody>
								<tr>
									<td>기증인</td>
									<td>${book.name }</td>
									<td>대분류</td>
									<td>
									
											<select class="form-control filter" id="category_id"
												name="category_id">
												<option value="1">JAVA</option>
												<option value="2">웹프로그래밍</option>
												<option value="3">데이터베이스</option>
												<option value="4">프레임워크</option>
												<option value="5">클라우드</option>
												<option value="6">기타</option>
											</select>
									</td>
									<!-- <td>청구기호</td>
									<td>100.xxx</td> -->
								</tr>
								<tr>
									<td>기증일</td>
									<td colspan="3">${book.registered_date }</td>

								</tr>
								<tr>
									<td>제목</td>
									<td colspan="3">${book.title }</td>
								</tr>
								<tr>
									<td>저자</td>
									<td colspan="3">${book.author }</td>
								</tr>
								<tr>
									<td>출판사</td>
									<td colspan="3">${book.publisher }</td>
								</tr>
								<tr>
									<td>발행일</td>
									<td colspan="3">${book.pubdate }</td>
								</tr>
								<tr>
									<td>ISBN</td>
									<td colspan="3">${book.isbn }</td>
								</tr>
								<tr>
									<td>기증한마디</td>
									<td colspan="3">${book.user_comment}</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-md-4 text-center">
						<img src=${book.image } alt="" id="img-book" />
						<button type="submit" class="btn btn-primary btn-donation" id="btn-register">승인
							및 도서등록</button>
						<button type="button" class="btn btn-danger btn-donation" id="btn-reject">반려</button>

					</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="modal-reject" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="mTitle">도서반려</h4>
					</div>
					<div class="modal-body" style="margin: 20px auto;">

						<form action="ManagerDonationRejectBook.nds" method="post" class="form-horizontal">
							<input type="hidden" name="req_don_id" value="${book.req_don_id}" />
							<div class="form-group">
								<label class="control-label col-md-2" for="manager_comment">반려이유:</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="manager_comment" id="manager_comment" required="required"
										placeholder="30자이내">
								</div>

								<div class="col-md-2">
									<button type="submit" value=""
										class="form-control btn btn-md btn-warning">확인</button>
								</div>
							</div>
						</form>
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