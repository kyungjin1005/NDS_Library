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

</head>
<body>
	<div class="container">
		<%@include file="/include/topMenu.jsp"%>
		<div class="row" style="margin-top: 80px;">
			<%@include file="/include/managerSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">게시판 관리</h1>
				<hr class="title-line" />
				<div style="margin-bottom: 1%;">
					<div>
						<ul class="nav nav-pills nav-justified ">
							<li class="active"><a href="ManageBoard.jsp">글관리</a></li>
							<li><a href="CommentList.jsp">댓글관리</a></li>
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
							<option value="0">모든카테고리</option>
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
							<th>제목</th>
							<th>ID</th>
							<th>카테고리</th>
							<th>등록날짜</th>
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
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
						<tr>
							<td>
								<form class="form-inline" role="form">
									<input type="checkbox">
								</form>
							</td>
							<td>1</td>
							<td>자바스터디 모집합니다</td>
							<td>1510010</td>
							<td>스터디모집</td>
							<td>2016-02-02</td>
						</tr>
					</tbody>
				</table>
				<div id="member-footer">
					<hr />
					<button class="btn btn-md btn-warning btn-msg">새글 작성</button>
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