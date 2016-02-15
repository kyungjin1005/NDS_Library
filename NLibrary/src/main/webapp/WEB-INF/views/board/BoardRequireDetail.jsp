<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>신청도서</title>

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

.sub-title {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 20px;
	align-items: center;
	margin-top: 50px;
}

.icon {
	font-size: 25px;
}

.sub-title-line {
	border: 1px solid #888;
	margin-top: 5px;
	margin-bottom: 40px;
}

#require-table {
	width: 100%;
	margin: 0px auto;
}

#require-table th {
	width: 30%;
}

#require-table td, #require-table th {
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
	font-family: "맑은고딕";
	height: 50px;
}

#img-book {
	width: 100%;
	border: 1px solid #eee;
	margin-bottom: 10px;
}

#alert-state {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 13px;
}

#reply-table th {
	font-weight: bold;
	font-size: 16px;
}

#reply-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 40px;
}

#reply-table th, #reply-table td {
	text-align: center;
	font-family: "맑은고딕";
}


#btn-write {
	width: 100%;
	height: 100%;
	font-weight: bold;
	font-size: 15px;
}
</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">

		<header>
			<%@include file="/include/header.jsp"%>
		</header>

		<div class="row" style="margin-top: 80px;">
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/boardpage.png" alt="책 이미지" />
				</div>
				<ul class="list-group">
					<li class="list-group-item">Java</li>
					<li class="list-group-item">Database</li>
					<li class="list-group-item">JSP/Servlet</li>
					<li class="list-group-item">Cloud</li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">신청도서</h1>
				<hr class="title-line" />
				<div class="row" style="margin: 20px 0px;">
					<div class="col-md-8">
						<table class="table text-center" id="require-table">
							<tbody>
								<tr>
									<th>신청인</th>
									<td>${board.name}</td>
								</tr>
								<tr>
									<th>신청일</th>
									<td>${board.registered_date}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td>${board.title}</td>
								</tr>
								<tr>
									<th>저자</th>
									<td>${board.author}</td>
								</tr>
								<tr>
									<th>출판사</th>
									<td>${board.publisher}</td>
								</tr>
								<tr>
									<th>발행일</th>
									<td>${board.pubdate}</td>
								</tr>
								<tr>
									<th>ISBN</th>
									<td>${board.isbn}</td>
								</tr>
								<tr>
									<th>신청한마디</th>
									<td colspan="3">${board.user_comment}</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-md-4" style="text-align: center; margin: 0px auto;" >
						<img src="pictures/booksample01.jpg" alt="" id="img-book" />
						<div class="alert alert-info" id="alert-state">
							신청상태 : <span>${board.current_state}</span>
						</div>

					</div>
				</div>


				<!-- 댓글 -->
				<div class="sub-title">
					<span class="glyphicon glyphicon-list-alt icon"></span> <span>댓글</span>
					<span class="badge" style="margin-left: 3px">${replyCount}</span>
					<hr class="sub-title-line" />
				</div>
				<table class="table table-hover text-center" id="reply-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>댓글</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<c:set var="replyCount" value="${replyCount}" />
					<%int replyCount=(Integer)pageContext.getAttribute("replyCount");%>		
					<tbody>
						<c:forEach var="reply" items="${replylist}">
								<tr>
									<td><%=replyCount-- %></td>
									<td>${reply.content}</td>
									<td>${reply.name}</td>
									<td>${reply.replyed_date}  
										<a id="modify" href="UpdateReply.nds?reply_id=${reply.reply_id}&board_id=${board.board_id}&type=notice">
								          <span class="glyphicon glyphicon-pencil"></span>
								        </a>
								        <a href="DeleteReply.nds?reply_id=${reply.reply_id}&board_id=${board.req_don_id}&type=require"> 
        								  <span class="glyphicon glyphicon-minus"></span>
      									</a>
							        </td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
				<form role="form" action="InsertReply.nds" method="post">
					
					<input type="hidden" value="require" name="type" />
					<input type="hidden" value="3" name="user_id" />
					<input type="hidden" value="${board.req_don_id}" name="req_don_id" />
					
					<div class="row">
						<div class="col-md-11">
							<div class="form-group">
								<input type="text" placeholder="댓글을 입력해주세요(50)"
									required="required" maxlength="100" class="form-control"
									id="comment" name="content">
							</div>
						</div>
						<div class="col-md-1" style="padding: 0px; margin: 0px;">
							<button class="btn btn-md btn-warning" id="btn-write">등록</button>
						</div>
					</div>
				</form>

			</div>
		</div>
<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>

	</div>
</body>
</html>