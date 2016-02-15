<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도서신청</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
#list-title {
	text-align: center;
	padding: 0px;
}

#list-title img {
	width: 100%;
	margin: 0px;
}

.list-group-item {
	font-family: "맑은고딕";
	font-weight: bold;
	color: #555555;
	height: 50px;
	display: list-item;
	vertical-align: middle;
}

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
</style>
<script>
	$(document).ready(function() {
		  $('table tr').click(function(){
		        window.location = $(this).attr('href');
		        return false;
		    });
	});
</script>
</head>
<body>

	<c:set var="totalCount" value="${totalCount}" />
	<c:set var="indexCount" value="${indexCount}" />	
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
		
	%>  


	<div class="container">

		<header>
			<%@include file="/include/header.jsp"%>
		</header>

		<div class="row" style="margin-top: 80px;">
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/boardpage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="BoardNoticeList.nds">공지사항</a></li>
					<li class="list-group-item"><a href="BoardRequireList.nds">도서신청</a></li>
					<li class="list-group-item"><a href="BoardDonationList.nds">기증도서</a></li>
					<li class="list-group-item"><a href="BoardStudyList.nds">스터디모집</a></li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">도서신청</h1>
				<hr class="title-line" />
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>승인상태</th>
							<th>신청인</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="req" items="${list}">
								<tr href="ReqAndDonDetail.nds?req_don_id=${req.req_don_id}&type=require" style="cursor:pointer;">
									<td>${req.req_don_id}</td>
									<td>${req.title}</td>
									<td>${req.current_state}</td>
									<td>${req.name}</td>
									<td>${req.registered_date}</td>
								</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			
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
				<li><a href="BoardRequireList.nds?pageNum=1">«</a></li>
			<% 
		}
%><% 
          
		if (isPrev) {
			int goPrevPage = startPage - pagePerBlock;
			
			%>
				<li><a href="BoardRequireList.nds?pageNum="<%=goPrevPage%>">«</a></li>
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
					<li><a href="BoardRequireList.nds?pageNum=<%=i%>"><%=i %></a></li>
				<% 
			}
		}
		if (isNext) {
			int goNextPage = startPage + pagePerBlock;
			%>
				 <li><a href="BoardRequireList.nds?ageNum=<%=goNextPage%>">»</a></li>
			<% 
		} else {
			
		}
		if(totalNumOfPage > pageNumTemp){
			%>
				<li><a href="BoardRequireList.nds?pageNum=<%=totalNumOfPage%>">»</a></li>
			<%
		}
	}
	%>
			</div>	
			
				<br/><br/><br/>
				
				<div style="text-align: right">
					<form action="AddBoard.nds" method="get">
						<input type="hidden" name="type" value="study" />
						<label><input type="submit" value="글쓰기" /></label>
					</form>
				</div>
			

			<footer>
				<%@include file="/include/footer.jsp"%>
			</footer>
		</div>
</body>
</html>