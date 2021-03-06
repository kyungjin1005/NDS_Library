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
<title>도서신청현황</title>



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
	margin-bottom: 30px;
}

#require-table tbody tr:HOVER {
	cursor: pointer;
}


#require-table th {
	font-weight: bold;
	font-size: 16px;
	height: 50px;
}

#require-table td {
	font-size: 15px;
	vertical-align: middle;
}

#require-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

#require-table th, #require-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#require-table td:nth-child(2) {
	text-align: left;
}

#req-modal {
	
}

#scroll-box {
	max-height: 500px;
	overflow-y: scroll;
}

.modal-content {
	z-index: 1;
}

#req-search {
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

#nav1 {
	text-align: center;
}
</style>
</head>
<body>


	<div class="container">

		<header>
			<%@include file="/include/topMenu.jsp"%></header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/mypageSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">도서신청현황</h1>
				<hr class="title-line" />



				<form class="form-inline" role="form" method="get"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="borrow-filter"
						name="borrow-filter">
						<option value="0">전체</option>
						<option value="1">구매완료</option>
						<option value="2">신청완료</option>
						<option value="3">신청대기</option>
						<option value="4">신청반려</option>
					</select>
				</form>


				<table class="table table-hover text-center" id="require-table">
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


						<c:set var="count" value="1"></c:set>
						<c:forEach var="book" items="${requireList}">
							<tr onclick="goBoard(${book.req_don_id})">
								<td>${count}</td>
								<td><img src="${book.image}" alt="" /><span>${book.title }</span></td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.registered_date}</td>
								<td>${empty book.current_state?"-":book.current_state}</td>
								<td>${empty book.finished_date?"-":book.finished_date}</td>
								<td>${empty book.manager_comment?"-":book.manager_comment}</td>
							</tr>
							<c:set var="count" value="${count+1}"></c:set>
						</c:forEach>

					</tbody>
				</table>
				<div style="text-align: right;">
					<button class="btn btn-md btn-warning" id="btn-require">신청하기</button>
				</div>
				<!-- 페이징 -->
				${pagebar}
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="req-modal" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="mTitle">도서신청하기</h4>
					</div>
					<div class="modal-body text-center">

						<form class="form-inline">
							<div id="req-search">
								<input type="search" class="form-control" size="50" id="query"
									placeholder="책 제목을 입력하세요">
								<button type="button" class="btn btn-danger" id="btn-search">검색</button>
							</div>
						</form>
						<div id="scroll-box">
							<table class="table table-hover text-center" id="modal-table">
								<thead>
									<tr>
										<th>번호</th>
										<th>책정보</th>
										<th>신청하기</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
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

<script>
	$(document).ready(
			function() {

				$("#borrow-filter option:eq(${filter})").attr("selected",
						"selected");

				$("#btn-require").on("click", function() {
					$("#req-modal").modal();
				});

				$("#btn-search").on("click", function() {
					var query = $("#query").val();
					loadDoc(query);

				});

				$("#borrow-filter").change(
						function() {
							/* alert($("#borrow-filter").val()); */
							$(location).attr(
									"href",
									"MypageRequire.nds?filter="
											+ $("#borrow-filter").val());
						});
			});

	function loadDoc(query) {
		$
				.get(
						"NaverAjax.nds?query=" + query,
						function(data) {
							var rootElement = $(data).find(":root");
							var books = $(rootElement).find("book");
							var result = "";

							for (var i = 0; i < $(books).length; ++i) {
								var book = $(books).eq(i);
								result += "<tr>";
								result += "<td>" + (i + 1) + "</td>";
								result += "<td>" + "<div class=\"clearfix\">";
								result += "<img src="
										+ $(book).find("image").text()
										+ " class=\"modal-img\" />";
								result += "<ul class=\"modal-list\">";
								result += "<li>" + $(book).find("title").text()
										+ "</li>";
								result += "<li>저자 - "
										+ $(book).find("author").text()
										+ "</li>";
								result += "<li>출판사 - "
										+ $(book).find("publisher").text()
										+ "</li>";
								result += "<li>발행일 - "
										+ $(book).find("pubdate").text()
										+ "</li>";
								result += "<li>ISBN - "
										+ $(book).find("isbn").text() + "</li>";
								result += "</ul>";
								result += "</div>";
								result += "</td>";
								result += "<td>"
										+ "<button type=\"button\" value=\""
										+ $(book).find("isbn").text()
										+ "\"class=\"btn btn-md btn-default btn-register\" >신청하기</button>"
										+ "</td>";

								result += "</tr>";
							}

							/* 	$("#boardTable").find("tbody").append(result);		 */
							$("#modal-table").find("tbody").html(result);

							$(".btn-register").on(
									"click",
									function() {
										/* $("#isbn").val($(this).parents("tr").find("td:eq(1)").text()); */
										//alert("zz");
										alert($(this).val());

										$(location).attr(
												"href",
												"MypageRequireForm.nds?isbn="
														+ $(this).val());
									});
						}, "xml");

	}
	
	function goBoard(req_don_id){
		
		alert(req_don_id);
		$(location).attr(
				"href",
				"ReqAndDonDetail.nds?req_don_id=" + req_don_id + "&type=require");
	}
</script>
</html>