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

<title>예약 관리</title>

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
				<h1 id="mTitle">예약 신청 관리</h1>
				<hr class="title-line" />
				
				<form class="form-inline" role="form" method="get"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="reserve-filter"
						name="reserve-filter">
						<option value="0">전체</option>
						<option value="1">승인 가능</option>
						<option value="2">승인 불가능</option>
					</select>
				</form>


				<table class="table table-hover text-center" id="book-table">
					<thead>
						<tr>
							<th>번호</th>
							<th></th>
							<th>제목</th>
							<th>책 상태</th>
							<th>예약날짜</th>
							<th>User</th>
							<th>대출</th>
							<th>처리 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reservation" items="${reservingList}">
								<c:choose>
									<c:when test="${reservation.processing_state == 0}">
										<tr>
									</c:when>
									<c:otherwise>									
										<tr style="background-color:#f5f5f5;">
									</c:otherwise>
								</c:choose>
								<td>${reservation.reservation_id}</td>
								<td><img src="${reservation.image }" alt="" /></td>
								<td>${reservation.title}</td>
								<td>${reservation.current_state }</td>
								<td>${reservation.reservated_date }</td>
								<td>${empty reservation.name?"-":reservation.name}</td>
								<td>
									<button class="btn btn-md btn-warning btn-borrow"
										value="${reservation.reservation_id }"
										 ${reservation.current_state != '대출가능'?"disabled=\"disabled\"":""}>대출승인</button>
								</td>								
								<td>${reservation.processing_state == 0?"처리전":"처리완료"}</td>
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
									"changeToBorrow.nds?reservation_id="
											+ $(this).val());
							alert("책이 대출되었습니다.");
						});
			});
</script>
</html>