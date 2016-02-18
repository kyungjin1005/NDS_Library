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
<title>메세지함</title>
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

#msg-table tbody tr:HOVER {
	cursor: pointer;
}

#msg-table th {
	font-weight: bold;
	font-size: 16px;
	background-color: #eee;
}

#msg-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 70px;
}

#msg-table th, #msg-table td {
	text-align: center;
	font-family: "맑은고딕";
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
				<h1 id="mTitle">메세지함</h1>
				<hr class="title-line" />



				<form class="form-inline" role="form" method="post"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="borrow-filter"
						name="borrow-filter">
						<option value="0">전체</option>
						<option value="1">읽은 메세지</option>
						<option value="2">안읽은 메세지</option>
					</select>
				</form>


				<table class="table text-center" id="msg-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>보낸사람</th>
							<th>받은날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msg" items="${msgList}">
							<tr data-url="MypageMemberMsg.nds?msg_id=${msg.message_id}">
								<td>${msg.message_id}</td>
								<td>${msg.title}</td>
								<td>관리자</td>
								<td>${msg.sended_date}</td>
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
		$("table tr").click(function() {
			window.document.location = $(this).data("url");
		});
	});
</script>
</html>