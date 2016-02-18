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
<title>도서상세정보</title>

<style type="text/css">
#result {
	margin-top: 120px;
}

.title-line {
	border: 1px solid red;
	margin-top: 5px;
	margin-bottom: 20px;
}

.mTitle {
	font-weight: bold;
	font-size: 25px;
	vertical-align: middle;
	background-image: url("pictures/title.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
}

.mTitle span {
	margin-left: 20px;
}

.sub-title {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 20px;
	align-items: center;
	margin-top: 50px;
}

.icon {
	font-size: 25px;
}

.sub-title-line {
	border: 0px solid #888;
	margin-top: 5px;
	margin-bottom: 40px;
}

#book-img {
	width: 90%;
}

#info-table {
	width: 100%;
	margin: 0px auto;
	text-align: left;
}

#info-table th {
	width: 30%;
	font-weight: bold;
	font-size: 16px;
	text-align: left;
	margin-left: 5px;
}

#info-table td {
	vertical-align: middle;
	margin: 0px 10px;
	font-size: 16px;
	text-align: left;
	line-height: 1.9em;
}

#info-table th, #info-table td {
	font-family: "맑은고딕";
}

#borrow-table th, #reply-table th {
	font-weight: bold;
	font-size: 16px;
}

#borrow-table td, #reply-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 40px;
}

#borrow-table th, #borrow-table td, #reply-table th, #reply-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#btn-write {
	width: 100%;
	height: 100%;
	font-weight: bold;
	font-size: 15px;
}
</style>
</head>
<body>


	<%-- 
   
 --%>
	<div class="container">

		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div id="result">
			<div class="mTitle">
				<span>도서상세정보</span>

			</div>
			<hr class="title-line" />
		</div>


		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>도서정보</span>

			<hr class="sub-title-line" />
		</div>
		<section class="row">

			<div class="col-md-8 ">
				<table class="table text-center" id="info-table">
					<tbody>
						<tr>
							<th>제목</th>
							<td>${bookInfo.title}</td>
						</tr>
						<tr>
							<th>저자</th>
							<td>${bookInfo.author}</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td>${bookInfo.publisher}</td>
						</tr>
						<tr>
							<th>ISBN</th>
							<td>${bookInfo.isbn}</td>
						</tr>

						<tr>
							<th>발간일</th>
							<td>${bookInfo.pubdate}</td>
						</tr>
						<tr>
							<th>책소개</th>
							<td>${bookInfo.explanation}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<img src="${bookInfo.image}" id="book-img" />
			</div>
		</section>

		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>소장정보</span>
			<span
				style="font-size: 13px; vertical-align: bottom; float: right; color: #0000ff;"><span>대여가능권수
			</span><span class="badge" style="margin-left: 3px">${BorrowN}</span></span>

			<hr class="sub-title-line" />
		</div>
		<section class="row">


			<table class="table table-hover text-center" id="borrow-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>BOOK ID</th>
						<th>청구기호</th>
						<th>도서상태</th>
						<th>반납예정일</th>
						<th>예약/대여</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="own" items="${ownInfo}">
						<tr>
							<td>${own.rownum}</td>
							<td>${own.book_id}</td>
							<td>${own.location}</td>
							<td>${own.current_state}</td>
							<td>${own.scheduled_date}</td>
							<td>
								<button class="btn btn-md btn-default btn-reserve"
									onclick="reserve()" value="${own.book_id }">예약</button>
								<button class="btn btn-md btn-warning btn-borrow"
									onclick="borrow()" value = "${own.book_id }">대여</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>

		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>리뷰<span
				class="badge" style="margin-left: 3px">${ReviewN}</span></span>


			<hr class="sub-title-line" />
		</div>
		<section class="row">


			<table class="table table-hover text-center" id="reply-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>평점</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bookReview" items="${bookReview}">
						<tr>
							<td>${bookReview.rownum}</td>
							<td>${bookReview.star}</td>
							<td>${bookReview.content}</td>
							<td>${bookReview.name}</td>
							<td>${bookReview.reviewed_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<form role="form" method="post" action="ReviewInsert.nds">
				<div class="form-group">
					<div class="col-md-2" style="padding: 0px; margin: 0px;">
						<select class="form-control" id="star" name="star">
							<option value="1">☆☆☆☆★</option>
							<option value="2">☆☆☆★★</option>
							<option value="3">☆☆★★★</option>
							<option value="4">☆★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>
					<div class="col-md-9">
						<input type="hidden" id="information_id" name="information_id"
							value="${bookInfo.information_id}"> <input type="hidden"
							id="isbn" name="isbn" value="${bookInfo.isbn}"> <input
							type="text" placeholder="댓글을 입력해주세요(50)" required="required"
							maxlength="100" class="form-control" id="content" name="content">
					</div>
					<div class="col-md-1" style="padding: 0px;">
						<button type="submit" class="btn btn-default btn-warning">등록</button>
					</div>
				</div>
			</form>
		</section>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>

</body>

<script>
   $(document).ready(function() {

   });

   function borrow() {
	   alert("대출이 신청되었습니다. 관리자의 승락을 기다리세요.");
		  $(location).attr("href", "borrowBook.nds?book_id=" + $(".btn-borrow").val());
   }

   function reserve() {
	   alert("책이 예약되었습니다.");
	  $(location).attr("href", "reserveBook.nds?book_id=" + $(".btn-reserve").val());
   }
</script>
</html>