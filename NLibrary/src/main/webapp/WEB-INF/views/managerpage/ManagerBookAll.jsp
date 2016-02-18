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
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
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
							<td></td>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<!-- 							<th>BOOK ISBN</th>
							<th>입고일</th> -->
							<th>상태</th>
							<th>대출회원</th>
							<th>파손 및 분실</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${bookList}">
							<tr>
								<td>${book.book_id }</td>
								<td><img src="${book.image }" alt="" /></td>
								<td>${book.title }</td>
								<td>${book.author }</td>
								<td>${book.publisher }</td>
								<%-- 								<td>${book.ISBN }</td>
								<td>${book.registered_date }</td> --%>
								<td>${book.current_state }</td>
								<td><c:choose>
										<c:when test="${book.name != null}">
											${book.name}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose></td>
								<td>
									<button class="btn btn-md btn-danger btn-register" value="${book.book_id }">파손
										및 분실 등록</button>
								</td>
							</tr>
						</c:forEach>
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
							<div class="col-md-4" id="left-box">
							</div>
							<div class="col-md-7">
								<table class="table text-center" id="modal-table">
									<tbody id="modal-tbody">
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="margin-bottom: 10px;" id="bottom-btn">
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
	$(document)
			.ready(
					function() {
						$(".btn-register").on("click", function() {
							$("#modal-dam-los").modal();
						});

						$(".btn-register").on("click", function() {
							$('#modal-tbody').text("");
							$('#bottom-btn').text("");
							$('#left-box').text("");
							var book_id = $(this).val();
							
							$.get("AjaxDamAndLosRegister.nds?book_id=" + book_id, function(data) {
								var rootElement = $(data).find(":root");
								var book = $(rootElement).find("book");
								
								var result = "";
								result += "<tr> <td>제목</td>";
								result += "<td>"+ $(book).find("title").text()+ "</td></tr>";
								result += "<tr><td>저자</td>";
								result += "<td>"+$(book).find("author").text()+ "</tr>";
								result += "<tr><td>출판사</td>";
								result += "<td>"+$(book).find("publisher").text()+ "</tr>";
								result += "<tr><td>발행일</td>";
								result += "<td>"+$(book).find("pubdate").text()+ "</tr>";
								result += "<tr><td>입고일</td>";
								result += "<td>"+$(book).find("registered_date").text()+ "</tr>";
								result += "<tr><td>BOOK ID</td>";
								result += "<td>"+$(book).find("book_id").text()+ "</tr>";
								
								$("#modal-table").find("tbody").append(result);

								var left = "";
								left += "<img src="+ $(book).find("image").text()+ "id=\"img-book\" style=\"width: 100%; height: 100%;\"/>";
								$("#left-box").append(left);
								
								var btn = "";
								btn += "<button type=\"submit\" class=\"btn btn-primary btn-lg btn-dmg-log btn-loss\" value=\"" + book_id + "\">분실등록</button>";
								btn += "<button type=\"submit\" class=\"btn btn-danger btn-lg btn-dmg-log btn-damage\" value=\"" + book_id + "\">파손등록</button>";
								//right += "<input type=\"hidden\" value="+ $(book).find("req_don_id").text()+ " name=\"req_don_id\" />";
								//right += "<input type=\"hidden\" value=\""+ $(book).find("isbn").text()+ "\" name=\"isbn\" />"
								
								$("#bottom-btn").append(btn);
								
								$("#modal-register").modal();
								
								$(".btn-loss").click(function() {
		 							alert("선택하신 책이 분실 처리되었습니다.");
		 							$(location).attr("href", "changeToDamOrLos.nds?book_id=" + $(this).val() + "&state=분실");
		 						});
								
								$(".btn-damage").click(function() {
		 							alert("선택하신 책이 파손 처리되었습니다.");
		 							$(location).attr("href", "changeToDamOrLos.nds?book_id=" + $(this).val() + "&state=파손");
		 						});
							});
						});
					});
</script>
</html>