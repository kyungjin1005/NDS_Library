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

.content-line {
	border: 1px solid silver;
	margin-top: 5px;
	margin-bottom: 40px;
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
				<h1 id="mTitle">스터디모집</h1>
				<hr class="title-line" />

				<!-- 타이틀 -->
				<div class="title">
					<div style="width: 50%; float: left">
						<p>java 스터디 모집합니다</p>
					</div>
					<div style="width: 50%; float: left">
						<p style="font-size: 11px; text-align: right">2016-02-25</p>
					</div>
				</div>

				<!-- 내용	 -->
				<div class="content" style="height: 400px">
					<p>강아지가 편히 쉴수 있는 포근한 집이 필요합니다. 강아지의 집은 강아지가 다 큰 후에도 계속 쓸 수 있는
						집으로 구입하세요. 집을 구입하실 때는 박음질이 잘 되어 있는지, 세탁이 같 편한 제품인지 꼭 확인하시고 고르시는 것이
						좋습니다</p>

				</div>
				<hr class="content-line" />

				<!-- 댓글 -->
				<div class="sub-title">
					<span class="glyphicon glyphicon-list-alt icon"></span> <span>댓글</span>
					<span class="badge" style="margin-left: 3px">3</span>
					<hr class="sub-title-line" />
				</div>
				<table class="table table-hover text-center" id="reply-tab
				+le">
					<thead>
						<tr>
							<th>번호</th>
							<th>댓글</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>
						<tr>
							<td>1</td>
							<td>좋은 책 감사드립니다!!</td>
							<td>김혜원</td>
							<td>2016-02-05</td>
						</tr>

					</tbody>
				</table>
				<form role="form">

					<div class="row">
						<div class="col-md-11">
							<div class="form-group">
								<input type="text" placeholder="댓글을 입력해주세요(50)"
									required="required" maxlength="100" class="form-control"
									id="comment">
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