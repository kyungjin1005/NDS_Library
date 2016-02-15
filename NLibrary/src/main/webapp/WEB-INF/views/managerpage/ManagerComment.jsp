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
							<li><a href="ManageBoard.jsp">글관리</a></li>
							<li class="active"><a href="CommentList.jsp">댓글관리</a></li>
							<!-- <li><a href="Logout.nds" style="color: red"> 로그아웃</a></li> -->
						</ul>
					</div>
				</div>
				<br>


				<div id="filter">
					&nbsp;
					<button class="btn btn-large btn-default">일괄선택</button>
					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: left;">
						<select class="form-control filter" id="borrow-filter"
							name="borrow-filter">
							<option value="0">모든댓글형식</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>

						</select> <select class="form-control filter" id="align-filter"
							name="align-filter">
							<option value="0">모든날짜</option>
							<option value="1">최근일주일</option>
							<option value="2">최근한달</option>
						</select>
					</form>
				</div>




				<table class="table table-hover" id="member-table">
					<thead>
						<tr>
							<th>블라인드</th>
							<th>번호</th>
							<th>댓글</th>
							<th>ID</th>
							<th>등록날짜</th>
							<th>댓글이 달린 글</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>스터디 신청합니다</td>
							<td>1510010</td>
							<td>2016-02-02</td>
							<td>자바스터디 모집합니다</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>스터디 신청합니다</td>
							<td>1510010</td>
							<td>2016-02-02</td>
							<td>자바스터디 모집합니다</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>스터디 신청합니다</td>
							<td>1510010</td>
							<td>2016-02-02</td>
							<td>자바스터디 모집합니다</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>스터디 신청합니다</td>
							<td>1510010</td>
							<td>2016-02-02</td>
							<td>자바스터디 모집합니다</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>스터디 신청합니다</td>
							<td>1510010</td>
							<td>2016-02-02</td>
							<td>자바스터디 모집합니다</td>
						</tr>

					</tbody>
				</table>

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
	$(document).ready(function() {

	});
</script>
</html>