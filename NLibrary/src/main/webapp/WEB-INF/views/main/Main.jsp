<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
#montly_book {
	margin-top: 100px;
}

#montly_book li div:HOVER {
	cursor: pointer;
	text-decoration: underline;
}

#montly_book .panel-heading {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 18px;
	background-color: #ffffff;
}

#montly_book ul {
	/* text-align: center; */
	
}

#montly_book .mb_number {
	position: absolute;
	left: 0px;
	top: 0px;
	font-weight: bold;
	font-size: 18px;
	margin: 0px 10px;
}

#montly_book .mb_img {
	width: 200px;
	margin: 0px 20px;
}

#montly_book .mb_info {
	position: absolute;
	display: inline-block;
	float: right;
	bottom: 0px;
}

#mBoard {
	margin-top: 60px;
}

.title-line {
	border: 1px solid red;
	margin-top: 5px;
	margin-bottom: 20px;
}

table td:HOVER {
	cursor: pointer;
	text-decoration: underline;
}

#mBoard table td:nth-child(2) {
	text-align: right;
}

.mTitle {
	font-weight: bold;
	font-size: 18px;
	vertical-align: middle;
	background-image: url("pictures/title.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
}

.mTitle span {
	margin-left: 20px;
}

#mKing {
	text-align: center;
	font-weight: bold;
	font-size: 15px;
}

#mKing img {
	width: 150px;
}

.mTitle a {
	float: right;
	margin-right: 5px;
}

.new-book :HOVER {
	text-decoration: underline;
	cursor: pointer;
}

.new-book {
	border: 0px solid red;
	text-align: center;
}

.new-book li {
	margin: 0px 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.new-book li div {
	font-weight: bold;
	font-size: 15px;
	margin-bottom: 3px;
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


		<div class="panel panel-default" id="montly_book">
			<div class="panel-heading">이달의 책</div>

			<div class="panel-body">

				<ul class="list-inline">

					<li class="col-md-4"><span class="mb_number">1.</span> <img
						src="pictures/booksample01.jpg" alt="" class="mb_img" />
						<div class="mb_info">
							<div>이것이 자바다</div>
							<div>신용권 저</div>
							<div>한빛미디어</div>
							<div>2015년 1월</div>
							<div>평점 : ★★★★☆</div>
						</div></li>

					<li class="col-md-4"><span class="mb_number">2.</span> <img
						src="pictures/booksample01.jpg" alt="" class="mb_img" />
						<div class="mb_info">
							<div>이것이 자바다</div>
							<div>신용권 저</div>
							<div>한빛미디어</div>
							<div>2015년 1월</div>
							<div>평점 : ★★★★☆</div>
						</div></li>
					<li class="col-md-4"><span class="mb_number">3.</span> <img
						src="pictures/booksample01.jpg" alt="" class="mb_img" />
						<div class="mb_info">
							<div>홍길동</div>
							<div>이것이 자바다</div>
							<div>신용권 저</div>
							<div>한빛미디어</div>
							<div>2015년 1월</div>
							<div>평점 : ★★★★☆</div>
						</div></li>
				</ul>
			</div>
		</div>

		<div class="row" id="mBoard">
			<div class="col-md-3" style="width: 20%">

				<div class="mTitle">
					<span>1월의 다독왕</span>
				</div>
				<hr class="title-line" />
				<div id="mKing">
					<img src="pictures/profile.JPG" alt="" />
					<div>NDS개발본부</div>
					<div>홍길동사원</div>
				</div>
			</div>


			<div class="col-md-4" style="width: 40%">

				<div class="mTitle">
					<span>공지사항</span> <a href=""><img
						src="http://www.nsgportal.net/style/_skin/nongshim/portlet/red/img/more.gif"
						alt="" /></a>
				</div>
				<hr class="title-line" />
				<table class="table">

					<tbody>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>공지사항1공지사항1공지사항1</td>
							<td>16-02-01</td>
						</tr>


					</tbody>
				</table>

			</div>
			<div class="col-md-4" style="width: 40%">

				<div class="mTitle">
					<span>스터디모집</span> <a href=""><img
						src="http://www.nsgportal.net/style/_skin/nongshim/portlet/red/img/more.gif"
						alt="" /></a>
				</div>
				<hr class="title-line" />
				<table class="table">

					<tbody>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
						<tr>
							<td>자바스터디모집합니다</td>
							<td>16-02-01</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>



		<div class="row">
			<div class="col-md-6">
				<div class="mTitle">
					<span>신간도서</span>

				</div>
				<hr class="title-line" />

				<ul class="list-inline new-book" style="">

					<li><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
					<li><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
					<li><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
				</ul>

			</div>
			<div class="col-md-6">
				<div class="mTitle">
					<span>입고도서</span>

				</div>
				<hr class="title-line" />
				<ul class="list-inline new-book" style="">

					<li s><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
					<li><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
					<li><img src="pictures/booksample01.jpg" alt=""
						style="width: 150px;" />
						<div>프로그래머로 사는법</div>
						<div>샘 라이트스톤 지음</div>
						<div>한빛미디어</div></li>
				</ul>
			</div>

		</div>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>

</body>
</html>