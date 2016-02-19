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

<title>회원관리</title>

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

#member-header {
	font-weight: bold;
	font-size: 15px;
}

#member-header button {
	margin: 0px 10px;
}

#member-table {
	margin: 20px auto;
	padding: 0px 20px;
}

#member-table tbody tr:HOVER {
	cursor: pointer;
}

#member-table th {
	height: 30px;
	background-color: #ddd;
	font-weight: bold;
	font-size: 13px;
}

#member-table th, #member-table td {
	font-family: "맑은고딕";
	text-align: center;
	vertical-align: middle;
}

#member-table td {
	font-size: 13px;
	height: 50px;
}

#member-footer {
	text-align: right;
	margin: 15px 0px;
}

#member-table td:nth-child(1) { //
	번호 width: 20px;
}

#member-table td:nth-child(2) { //
	제목 width: 20px;
}

#member-table th:nth-child(3) { // 저자
	
}

#member-table th:nth-child(5) { // 출판사
	
}

#member-table th:nth-child(6) { // 기증인
	
}

#member-table th:nth-child(7) { // 기증일
	
}

#member-table th:nth-child(8) { // 기증사애
	
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
			<%@include file="/include/topMenu.jsp"%></header>

		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">회원관리</h1>
				<hr class="title-line" />
				<form class="form-inline" role="form" method="post"
					action="ManagerMemberMsg.nds">
					<div id="member-header">
						Count <span class="badge">${size}</span>
						<button type="button" class="btn btn-sm btn-default" id="btn-all" style="margin:0px">일괄선택</button>
						<button type="button" class="btn btn-sm btn-default" id="btn-clear" style="margin:0px">선택해제</button>

					</div>
					<table class="table table-hover" id="member-table">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>소속회사</th>
								<th>부서</th>
								<th>직위</th>
								<th>등록날짜</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="1"></c:set>
							<c:forEach var="user" items="${userList}">
								<tr>
									<td><input type="checkbox" class="form-control cb"
										name="user_id" value="${user.user_id }" ></td>
									<td><%-- ${count} --%> <%= index-- %></td>
									<td>${user.nds_number}</td>
									<td>${user.name}</td>
									<td>NDS</td>
									<td>${user.department}</td>
									<td>${user.position}</td>
									<td>${user.registered_date}</td>
									<td><button type="button" value="${user.user_id}"
											class="btn btn-sm btn-default btn-detail">상세보기</button></td>
								</tr>
								<c:set var="count" value="${count+1}"></c:set>
							</c:forEach>

						</tbody>
					</table>

					<div id="member-footer">
						<hr />
						<button type="submit" class="btn btn-md btn-warning btn-msg">메세지
							보내기</button>
					</div>
				</form>
			</div>

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
						<li><a href="ManagerMember.nds?pageNum=1">«</a></li>
						<%
							}
						%>
						<%
							if (isPrev) {
									int goPrevPage = startPage - pagePerBlock;
						%>
						<li><a href="ManagerMember.nds?pageNum=<%=goPrevPage%>">«</a></li>
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
						<li><a href="ManagerMember.nds?pageNum=<%=i%>"><%=i%></a></li>
						<%
							}
								}
								if (isNext) {
									int goNextPage = startPage + pagePerBlock;
						%>
						<li><a href="ManagerMember.nds?pageNum=<%=goNextPage%>">»</a></li>
						<%
							} else {

								}
								if (totalNumOfPage > pageNumTemp) {
						%>
						<li><a
							href="ManagerMember.nds?pageNum=<%=totalNumOfPage%>">»</a></li>
						<%
							}
							}
						%>
					
				</div>
	
	
	<footer>
		<%@include file="/include/footer.jsp"%>
	</footer>
</body>
<script>
	$(document).ready(
			function() {
				$(".btn-detail").on(
						"click",
						function() {
							$(location).attr(
									"href",
									"ManagerMemberInfo.nds?user_id="
											+ $(this).val());
						});

				$("#btn-all").on("click", function() {
					$(".cb").prop('checked', true); 

				});
				$("#btn-clear").on("click", function() {
					$(".cb").removeProp("checked"); 
				});
			});

	function goMemberInfo(member_id) {
		alert(member_id);
	}
</script>
</html>