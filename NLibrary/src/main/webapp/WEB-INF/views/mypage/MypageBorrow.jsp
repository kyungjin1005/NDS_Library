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
<title>대출현황조회</title>


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

#borrow-table th {
	font-weight: bold;
	font-size: 16px;
}

#borrow-table td {
	font-size: 15px;
	vertical-align: middle;
}

#borrow-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

#borrow-table th, #borrow-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#borrow-table td:nth-child(2) {
	text-align: left;
}

#possible-book {
	border: 0px solid blue;
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

#possible-book span {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
	color: #2C2255;
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
				<h1 id="mTitle">대출현황조회</h1>
				<hr class="title-line" />

				<div id="possible-book">
					<span>＊현재 대출가능권수 : </span><span>${3-borrowing_count }</span><span> / 3권</span>

					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control" id="borrow-filter"
							name="borrow-filter">
							<option value="0">전체</option>
							<option value="1">대출승인대기</option>
							<option value="2">대출중</option>
							<option value="3">반납완료</option>
						</select>
					</form>
				</div>


				<table class="table table-hover text-center" id="borrow-table">
					<thead>
						<tr>
							<th>번호</th>
							<th></th>
							<th>제목</th>
							<th>대출일</th>
							<th>반납예정일</th>
							<th>반납일</th>
							<th>대출상태</th>
							<th>연장횟수</th>
							<th>연장하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="borrowing" items="${borrowList}">
							<tr>
								<td>${borrowing.borrowing_id }</td>
								<td><img src="${borrowing.image }" alt="" /></td>
								<td>${borrowing.title}</td>
								<td>${empty borrowing.borrowing_date?"-":borrowing.borrowing_date}</td>
								<td>${empty borrowing.scheduled_date?"-":borrowing.scheduled_date}</td>
								<td>${empty borrowing.returned_date?"-":borrowing.returned_date}</td>
								<td>${!empty borrowing.returned_date?"반납완료":borrowing.current_state}</td>
								<td>${borrowing.delay_count}</td>
								<td>
									<button class="btn btn-md btn-warning btn-delay"  value="${borrowing.borrowing_id }"
										${borrowing.delay_count==1 || borrowing.borrowing_date == null?"disabled=\"disabled\"":""}>연장하기</button>
								</td>
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
	$(document).ready(function() {
		$("#borrow-filter option:eq(${filter})").attr("selected",
		"selected");

		$("#borrow-filter").change(
				function() {
					$(location).attr(
							"href",
							"mypageBorrow.nds?filter="
									+ $("#borrow-filter").val());
				});
		
		$(".btn-delay").click(function() {
			$(location).attr("href", "delayBorrowing.nds?borrowing_id=" + $(this).val());
		});
	});
</script>
</html>