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
			<img src="pictures/managerpage.png" alt="" />
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a href="">회원관리</a></li>
			<li class="list-group-item"><a href="">대출관리</a></li>
			<li class="list-group-item"><a data-toggle="collapse"
				href="#collapse1">도서관리<span
					class="glyphicon glyphicon-menu-right"
					style="margin-left: 5px; font-size: 10px;"></span></a></li>
			<li>
				<div id="collapse1" class="panel-collapse collapse">
					<ul class="list-group"
						style="margin: 0px; padding: 0px; text-align: center;">
						<li class="list-group-item"><a href="">- 모든도서</a></li>
						<li class="list-group-item"><a href="">- 신청도서</a></li>
						<li class="list-group-item"><a href="">- 기증도서</a></li>
					</ul>
				</div>
			</li>
			<li class="list-group-item"><a href="">게시판관리</a></li>
			<li class="list-group-item"><a href="MessageList.nds">메세지관리</a></li>
		</ul>
	</div>
</body>
</html>