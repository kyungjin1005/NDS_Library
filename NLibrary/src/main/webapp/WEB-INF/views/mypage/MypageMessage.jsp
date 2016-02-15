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
<title>메세지</title>


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
	width: 15%;
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
}

#btn-back {
	margin: 30px;
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
				<h1 id="mTitle">메세지</h1>
				<hr class="title-line" />


				<table class="table" id="msg-table">

					<tbody>

						<tr>
							<td>번호</td>
							<td>1</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td>2016-02-05</td>
						</tr>

						<tr>
							<td>보낸사람</td>
							<td>관리자</td>
						</tr>

						<tr>
							<td>제목</td>
							<td>안녕하세요. 홍길동님 반납해야할 도서입니다.</td>
						</tr>

						<tr>
							<td>내용</td>
							<td>내용입니다. 내용입니다.내용입니다.내용입니다.내용입니다. 내용입니다.내용입니다.내용입니다.내용입니다.
								내용입니다.내용입니다.내용입니다.내용입니다. 내용입니다.내용입니다.내용입니다.내용입니다.
								내용입니다.내용입니다.내용입니다.내용입니다. 내용입니다.내용입니다.내용입니다.내용입니다.
								내용입니다.내용입니다.내용입니다.</td>
						</tr>
					</tbody>
				</table>

				<div style="text-align: center;">
					<button class="btn btn-lg btn-warning" id="btn-back">목록으로</button>
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

	});
</script>
</html>