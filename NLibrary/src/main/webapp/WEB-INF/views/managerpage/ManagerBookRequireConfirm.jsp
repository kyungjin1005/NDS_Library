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

#require-table td {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 60px;
}

#require-table td:nth-child(1) {
	width: 20%;
	font-weight: bold;
}

#require-table td:nth-child(2) {
	width: 80%;
}

#img-book {
	width: 80%;
	border: 1px solid #888;
	margin-bottom: 5px;
}

.btn-require {
	width: 80%;
	height: 60px;
	font-weight: bold;
	font-size: 20px;
	margin: 4px 0px;
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
			<div class="col-md-10" style="margin-top: 10px;">
				<h1 id="mTitle">도서관리 -> 신청도서</h1>
				<hr class="title-line" />
				<div class="row" style="margin: 20px 0px;">
					<div class="col-md-7">
						<table class="table text-center" id="require-table">

							<tbody>
								<tr>
									<td>제목</td>
									<td>${book.title }</td>
								</tr>

								<tr>
									<td>지은이</td>
									<td>${book.author }</td>
								</tr>
								<tr>
									<td>출판사</td>
									<td>${book.publisher }</td>
								</tr>
								<tr>
									<td>발행년도</td>
									<td>${book.pubdate }</td>
								</tr>
								<tr>
									<td>ISBN</td>
									<td>${book.isbn }</td>
								</tr>
								<tr>
									<td>신청인</td>
									<td>${book.name }</td>
								</tr>
								<tr>
									<td>신청일</td>
									<td>${book.registered_date }</td>
								</tr>
								<tr>
									<td>신청한마디</td>
									<td>${book.user_comment }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-5 text-center">
						<img src="${book.image }" alt="" id="img-book" />
						<button class="btn btn-primary btn-require" id="btn-confirm">승인</button>
						<button class="btn btn-danger btn-require" id="btn-reject">반려</button>
					</div>
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

						<form action="ManagerRequireRejectBook.nds" method="post"
							class="form-horizontal">
							<input type="hidden" name="req_don_id" value="${book.req_don_id}" />
							<div class="form-group">
								<label class="control-label col-md-2" for="manager_comment">반려이유:</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="manager_comment"
										id="manager_comment" required="required" placeholder="30자이내">
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
<script>
	$(document).ready(
			function() {

				$("#btn-confirm").on(
						"click",
						function() {
							$(location).attr(
									"href",
									"RequireConfirm.nds?req_don_id="
											+ "${book.req_don_id }");
						});

				$("#btn-reject").on("click", function() {
					$("#modal-reject").modal();
				});
			});
</script>
</html>