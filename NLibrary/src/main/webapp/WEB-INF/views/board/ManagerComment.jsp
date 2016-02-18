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
}

#member-table th {
	height: 30px;
	background-color: #ddd;
	font-weight: bold;
	font-size: 15px;
}

#member-table th, #member-table td {
	font-family: "맑은고딕";
	text-align: center;
	vertical-align: middle;
}

#member-table td {
	font-size: 15px;
	height: 50px;
}

#member-footer {
	text-align: right;
	margin: 15px 0px;
}
</style>
</head>
<body>


	<c:set var="totalCount" value="${totalCount}" />
	<c:set var="indexCount" value="${indexCount}" />	
	<c:set var="filter" value="${filter}" />
	<%	
		int pageNumTemp = 1;
		int listCount = 10;
		int pagePerBlock = 10;
		int totalCount = (Integer)pageContext.getAttribute("totalCount");
		String pageNum = request.getParameter("pageNum");
		if (pageNum != null) {
			pageNumTemp = Integer.parseInt(pageNum);
		}
		int index = (Integer)pageContext.getAttribute("indexCount");
	/*  	int filter = (Integer)pageContext.getAttribute("filter");  */
		
	%>  

 


	<div class="container">
		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">게시판 관리</h1>
				<hr class="title-line" />
				<!-- <div id="member-header">
					Count <span class="badge">10</span>
					<button class="btn btn-sm btn-default">일괄선택</button>
				</div> -->
				<div style="margin-bottom: 1%;">
					<div>
						<ul class="nav nav-pills nav-justified ">
							<li><a href="ManagerBoard.nds">글관리</a></li>
							<li class="active"><a href="ManagerComment.nds">댓글관리</a></li>
							<!-- <li><a href="Logout.nds" style="color: red"> 로그아웃</a></li> -->
						</ul>
					</div>
				</div>
				<br>


				<div id="filter">
					&nbsp;
					
					<form class="form-inline" role="form" method="get" action="ManagerComment.nds"
						style="display: inline-block; float: right;">
						
						<select class="form-control filter" id="borrow-filter"
							name="category">
							<option value="0">모든카테고리</option>
							<option value="1">공지</option>
							<option value="2">스터디</option>	
						</select> 
						<select class="form-control filter" id="align-filter"
							name="date">
							<option value="0">모든날짜</option>
							<option value="1">최근일주일</option>
							<option value="2">최근한달</option>
						</select>
						<button class="btn btn-large btn-default">일괄선택</button>
					</form>
				</div>
				<br/>



				<table class="table table-hover" id="member-table">
					<thead>
						<tr>							
							<th>번호</th>
							<th>댓글</th>
							<th>이름</th>
							<th>등록날짜</th>
							<th>댓글이 달린 글</th>
							<th>블라인드</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach var="reply" items="${boardreplylist}">
								<tr>
									<td><%=index-- %></td>
									<td>${reply.content}</td>
									<td>${reply.name}</td>
									<td>${reply.replyed_date}</td>
									<td>${reply.title}</td>
									<td><form class="form-inline" role="form">
									<input type="checkbox" value="${reply.reply_id}" class="blind" 
									${reply.blind==1?"checked=\"checked\"":""}>
								</form>
								</td>
								</tr>
						</c:forEach>
						
						
					</tbody>
				</table>

				<!-- 페이징 시작 -->
	<div>
	<% 
	if(totalCount > 0) {
		int totalNumOfPage = (totalCount % listCount == 0) ? 
				totalCount / listCount :
				totalCount / listCount + 1;
		
		int totalNumOfBlock = (totalNumOfPage % pagePerBlock == 0) ?
				totalNumOfPage / pagePerBlock :
				totalNumOfPage / pagePerBlock + 1;
		
		int currentBlock = (pageNumTemp % pagePerBlock == 0) ? 
				pageNumTemp / pagePerBlock :
				pageNumTemp / pagePerBlock + 1;
		
		int startPage = (currentBlock - 1) * pagePerBlock + 1;
		int endPage = startPage + pagePerBlock - 1;
		
		if(endPage > totalNumOfPage)
			endPage = totalNumOfPage;
		boolean isNext = false;
		boolean isPrev = false;
		if(currentBlock < totalNumOfBlock)
			isNext = true;
		if(currentBlock > 1)
			isPrev = true;
		if(totalNumOfBlock == 1){
			isNext = false;
			isPrev = false;
		}
		StringBuffer sb = new StringBuffer();
		%>
		<br/><br/><br/><br/>
		 <div align="center">
         <ul class="pagination pagination-style-2">
		<% 
		if(pageNumTemp > 1){
			%>
				<li><a href="ManagerComment.nds?pageNum=1&category=${category }&date=${date}">«</a></li>
			<% 
		}
%><% 
          
		if (isPrev) {
			int goPrevPage = startPage - pagePerBlock;
			
			%>
				<li><a href="ManagerComment.nds?pageNum=<%=goPrevPage%>&category=${category }&date=${date}">«</a></li>
			<% 
		} else {
			
		}
		for (int i = startPage; i <= endPage; i++) {
			if (i == pageNumTemp) {
				%>
					<li class="active"><a href="#"><%=i %></a></li>
				<% 
			} else {
				%>
					<li><a href="ManagerComment.nds?pageNum=<%=i%>&category=${category }&date=${date}"><%=i %></a></li>
				<% 
			}
		}
		if (isNext) {
			int goNextPage = startPage + pagePerBlock;
			%>
				 <li><a href="ManagerComment.nds?pageNum=<%=goNextPage%>&category=${category }&date=${date}">»</a></li>
			<% 
		} else {
			
		}
		if(totalNumOfPage > pageNumTemp){
			%>
				<li><a href="ManagerComment.nds?pageNum=<%=totalNumOfPage%>&category=${category }&date=${date}">»</a></li>
			<%
		}
	}
	%>
			</div>	


				<!-- <div id="member-footer">
					<hr />
					<button class="btn btn-md btn-warning btn-msg">새글 작성</button>
				</div> -->
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

			$(".blind").on(
					"change",
					function() {

						var parent = this;
						if ($(this).is(":checked")) {
							//블라인드 처리(1) 액션 추가
							$.ajax({
								url : "AdminQACommentBlind.nds",
								data : {
									reply_id : $(parent).val(),
									blind : 1
								},
								success : function() {
									$(parent).parents("tr").css(
											"background-color", "#e5e5e5");
								}
							});
						} else {
							//블라인드 해제(0) 액션 추가
							$.ajax({
								url : "AdminQACommentBlind.nds",
								data : {
									reply_id : $(parent).val(),
									blind : 0
								},
								success : function() {
									$(parent).parents("tr").css(
											"background-color", "");
								}
							});
						}

					});
				
			$("#borrow-filter").find("option[value='${category}']").attr("selected" , true);
			$("#align-filter").find("option[value='${date}']").attr("selected" , true);
		});
</script>
</html>