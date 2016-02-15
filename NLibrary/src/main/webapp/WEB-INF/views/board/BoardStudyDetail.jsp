<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>스터디모집</title>

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

.content-line {
	border: 1px solid silver;
	margin-top: 5px;
	margin-bottom: 40px;
}
</style>



</head>
<body>

	<div class="container">
		<div class="row" style="margin-top: 80px;">
			<div class="col-md-2">

				<div id="list-title">
					<img src="pictures/boardpage.png" alt="" />
				</div>
				<%@include file="/include/BoardSide.jsp"%>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">스터디모집</h1>
				<hr class="title-line" />

				<!-- 타이틀 -->
				<div class="title">
					<div style="width: 50%; float: left">
						<p>${board.title}</p>
					</div>
					<div style="width: 50%; float: left">
						<p style="font-size: 11px; text-align: right">${board.boarded_date}</p>
					</div>
				</div>

				<!-- 내용	 -->
				<div class="content" style="height: 400px">
					<p>${board.content}</p>

				</div>
				<hr class="content-line" />

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
										<a href="UpdateReply.nds?reply_id=${reply.reply_id}&board_id=${board.board_id}&type=study">
								          <span class="glyphicon glyphicon-pencil"></span>
								        </a>
								        <a href="DeleteReply.nds?reply_id=${reply.reply_id}&board_id=${board.board_id}&type=study"> 
        								  <span class="glyphicon glyphicon-minus"></span>
      									</a>
							        </td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
				<form role="form" action="InsertReply.nds" method="post">
					
					<input type="hidden" value="study" name="type" />
					<input type="hidden" value="3" name="user_id" />
					<input type="hidden" value="${board.board_id}" name="board_id" />
					
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
<script>
	$(document).ready(function() {

	});
</script>
</html>