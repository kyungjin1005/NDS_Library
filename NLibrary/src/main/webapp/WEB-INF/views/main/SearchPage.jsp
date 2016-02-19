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
<title>자료검색</title>


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

#filter {
	border: 0px solid blue;
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

#filter span {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
	color: #2C2255;
}

#result-table tbody tr:HOVER {
	cursor: pointer;
}

#result-table th {
	font-weight: bold;
	font-size: 16px;
}

#result-table td {
	font-size: 15px;
	vertical-align: middle;
}

#result-table td:nth-child(2) {
	text-align: left;
}

#result-table td img {
	width: 60px;
	margin-right: 15px;
	border: 0px solid red;
	/* float: left; */
}

#result-table th, #borrow-table td {
	text-align: center;
	font-family: "맑은고딕";
}
</style>
<script>
   $(document).ready(
         function() {

            $("#borrow-filter2 option:eq(${filter})").attr("selected",
                  "selected");

            $("#borrow-filter2").change(
                  function() {
                     $(location).attr(
                           "href",
                           "SearchPage.nds?category_id="
                                 + $("#category_id").val()
                                 + "&filter="
                                 + $("#borrow-filter2").val());
                  });

            $('table tr').click(function() {
               window.location = $(this).attr('href');
               return false;
            });
         });
</script>
</head>
<body>

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

	<%-- 
   
 --%>
	<div class="container">


		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div class="row" style="margin-top: 80px;">
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/searchpage.png" alt="" />
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=1">JAVA</a></li>
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=2">웹프로그래밍</a></li>
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=3">데이터베이스</a></li>
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=4">프레임워크</a></li>
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=5">클라우드</a></li>
					<li class="list-group-item"><a
						href="SearchPage.nds?category_id=6">기타</a></li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">자료검색 -> ${category}</h1>
				<hr class="title-line" />

				<div id="filter">
					<span> 검색 결과가 총 <span>${totalCount}</span> 권 있습니다.
					</span>

					<form class="form-inline" role="form" method="get"
						style="display: inline-block; float: right;">
						<input type="hidden" id="category_id" value="${category_id}">
						<select class="form-control" id="borrow-filter2"
							name="borrow-filter2">
							<option value="0">전체</option>
							<option value="1">대출가능</option>
						</select>
					</form>
				</div>

				<table class="table table-hover text-center" id="result-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>발행일</th>
							<th>대출상태</th>
							
						</tr>
					</thead>

					<tbody>
						<c:forEach var="data" items="${data}">
							<tr href="BookInfo.nds?isbn=${data.isbn}&book_id=${data.book_id}" style="cursor: pointer;">
								<td><%= index--%></td>
								<td><img src="${data.image}" alt="" /><span>${data.title}</span></td>
								<td>${data.author}</td>
								<td>${data.publisher}</td>
								<td>${data.pubdate}</td>
								<td>${data.current_state}</td>
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
						<li><a href="SearchPage.nds?pageNum=1&category_id=${category_id }">«</a></li>
						<%
							}
						%>
						<%
							if (isPrev) {
									int goPrevPage = startPage - pagePerBlock;
						%>
						<li><a href="SearchPage.nds?pageNum=<%=goPrevPage%>&category_id=${category_id }">«</a></li>
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
						<li><a href="SearchPage.nds?pageNum=<%=i%>&category_id=${category_id }"><%=i%></a></li>
						<%
							}
								}
								if (isNext) {
									int goNextPage = startPage + pagePerBlock;
						%>
						<li><a href="SearchPage.nds?pageNum=<%=goNextPage%>&category_id=${category_id }">»</a></li>
						<%
							} else {

								}
								if (totalNumOfPage > pageNumTemp) {
						%>
						<li><a
							href="SearchPage.nds?pageNum=<%=totalNumOfPage%>&category_id=${category_id }">»</a></li>
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
</html>