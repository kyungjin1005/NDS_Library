<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메세지관리</title>

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

#msg-table {
	margin-top: 20px;
}

#msg-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 70px;
	text-align: left;
	font-size: 15px;
	font-family: "맑은고딕";
	line-height: 2em;
	font-family: "맑은고딕";
}

#msg-table td:nth-child(1) {
	width: 10%;
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}

#msg-table td:nth-child(2) {
	padding: 10px;
}

#btn-back {
	margin: 30px;
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
			<div class="col-md-10">
				<h1 id="mTitle">메세지관리</h1>
				<hr class="title-line" />

				<table class="table" id="msg-table">

					<tbody>
						<c:forEach var="msg" items="${msg}">
							<tr>
								<td>번호</td>
								<td>${msg.message_id}</td>
							</tr>
							<tr>
								<td>보낸날짜</td>
								<td>${msg.sended_date}</td>
							</tr>

							<tr>
								<td>받는사람___(일단id만)</td>
								<td>${msg.user_id}</td>
							</tr>

							<tr>
								<td>제목</td>
								<td>${msg.title}</td>
							</tr>

							<tr>
								<td>내용</td>
								<td>${msg.content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div style="text-align: center;">
					<button class="btn btn-md btn-warning" id="btn-back">목록으로</button>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
<script>
	$(document).ready(function() {

		$(".btn-register").on("click", function() {
			$("#modal-dam-los").modal();
		});
	});
</script>
</html>