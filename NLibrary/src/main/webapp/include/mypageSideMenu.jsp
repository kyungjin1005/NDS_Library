<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


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
</style>
<script>
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<div class="col-md-2">

		<div id="list-title">
			<img src="pictures/mypage.png" alt="" />
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a href="">대출현황조회</a></li>
			<li class="list-group-item"><a href="">메세지함</a></li>
			<li class="list-group-item"><a href="MypageRequire.nds">도서신청현황</a></li>
			<li class="list-group-item"><a href="MypageDonation.nds">도서기증현황</a></li>
		</ul>

	</div>
</body>
</html>