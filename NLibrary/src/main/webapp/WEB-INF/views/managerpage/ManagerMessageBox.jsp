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

#msg-table tbody tr:HOVER {
	cursor: pointer;
}

#msg-table th {
	font-weight: bold;
	font-size: 16px;
	background-color: #eee;
	height: 40px;
}

#msg-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 70px;
}

#msg-table td:nth-child(1) {
	width: 5%;
}

#msg-table td:nth-child(2) {
	width: 20%;
}

#msg-table td:nth-child(3) {
	width: 35%;
}

#msg-table td:nth-child(4) {
	width: 10%;
}

#msg-table td:nth-child(5) {
	width: 15%;
}

#msg-table td:nth-child(6) {
	width: 15%;
}

#msg-table th, #msg-table td {
	text-align: center;
	font-family: "맑은고딕";
}
</style>

<c:set var="indexCount" value="${indexCount}" />
	<c:set var="totalCount" value="${totalCount}" />
	<%
		int pageNumTemp = 1;
		int listCount = 10;
		int pagePerBlock = 10;
		int totalCount = (Integer) pageContext.getAttribute("totalCount");
		String pageNum = request.getParameter("pageNum");
		if (pageNum != null) {
			pageNumTemp = Integer.parseInt(pageNum);
		}
		int index = (Integer) pageContext.getAttribute("indexCount");
	%>
</head>

<body>
	<div class="container">
		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">메세지관리</h1>
				<hr class="title-line" />

				<form class="form-inline" role="form" method="get"
					style="display: inline-block; float: right; margin-bottom: 20px;">
					<select class="form-control" id="msg-filter" name="msg-filter">
						<option value="0">전체</option>
						<option value="1">읽은 메세지</option>
						<option value="2">안읽은 메세지</option>
					</select>
				</form>

				<table class="table table-hover text-center" id="msg-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>받는사람</th>
							<th>보낸날짜</th>
							<th>읽은날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msg" items="${messageList}">
							<c:choose>
								<c:when test="${empty msg.checked_date}">
									<tr data-url="ManagerMemberMsg.nds?msg_id=${msg.message_id}" style="font-weight: bold;" >
								</c:when>
								<c:otherwise>									
									<tr data-url="ManagerMemberMsg.nds?msg_id=${msg.message_id}"  style="background-color:#f5f5f5;">
								</c:otherwise>
							</c:choose>
								<td><%= index--%></td>
								<td>${msg.title}</td>
								<td>${msg.content}</td>
								<td>${msg.name }</td>
								<td>${msg.sended_date}</td>
								<td>${empty msg.checked_date?"-":msg.checked_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		
		<!-- 페이징 시작 -->
			<div>
				<%
					if (totalCount > 0) {
						int totalNumOfPage = (totalCount % listCount == 0)
								? totalCount / listCount
								: totalCount / listCount + 1;

						int totalNumOfBlock = (totalNumOfPage % pagePerBlock == 0)
								? totalNumOfPage / pagePerBlock
								: totalNumOfPage / pagePerBlock + 1;

						int currentBlock = (pageNumTemp % pagePerBlock == 0)
								? pageNumTemp / pagePerBlock
								: pageNumTemp / pagePerBlock + 1;

						int startPage = (currentBlock - 1) * pagePerBlock + 1;
						int endPage = startPage + pagePerBlock - 1;

						if (endPage > totalNumOfPage)
							endPage = totalNumOfPage;
						boolean isNext = false;
						boolean isPrev = false;
						if (currentBlock < totalNumOfBlock)
							isNext = true;
						if (currentBlock > 1)
							isPrev = true;
						if (totalNumOfBlock == 1) {
							isNext = false;
							isPrev = false;
						}
						StringBuffer sb = new StringBuffer();
				%>
				<br />
				<br />
				<br />
				<br />
				<div align="center">
					<ul class="pagination pagination-style-2">
						<%
							if (pageNumTemp > 1) {
						%>
						<li><a href="MessageList.nds?pageNum=1&filter=${filter}">«</a></li>
						<%
							}
						%>
						<%
							if (isPrev) {
									int goPrevPage = startPage - pagePerBlock;
						%>
						<li><a href="MessageList.nds?pageNum=<%=goPrevPage%>&filter=${filter}">«</a></li>
						<%
							} else {

								}
								for (int i = startPage; i <= endPage; i++) {
									if (i == pageNumTemp) {
						%>
						<li class="active"><a href="#"><%=i%></a></li>
						<%
							} else {
						%>
						<li><a href="MessageList.nds?pageNum=<%=i%>&filter=${filter}"><%=i%></a></li>
						<%
							}
								}
								if (isNext) {
									int goNextPage = startPage + pagePerBlock;
						%>
						<li><a href="MessageList.nds?pageNum=<%=goNextPage%>&filter=${filter}">»</a></li>
						<%
							} else {

								}
								if (totalNumOfPage > pageNumTemp) {
						%>
						<li><a
							href="MessageList.nds?pageNum=<%=totalNumOfPage%>&filter=${filter}">»</a></li>
						<%
							}
							}
						%>
					
				</div>
		
		
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>

<script>
	$(document).ready(
			function() {

				$("#msg-filter option:eq(${filter})").attr("selected",
						"selected");

				$(".btn-register").on("click", function() {
					$("#modal-dam-los").modal();
				});

				$("#msg-filter").change(
						function() {
							$(location).attr(
									"href",
									"MessageList.nds?filter="
											+ $("#msg-filter").val());
						});

				$("table tr").click(function() {
					window.document.location = $(this).data("url");
				});
			});
</script>
</html>