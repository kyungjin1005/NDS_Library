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
<title>이용안내</title>


<style type="text/css">
#result {
	margin-top: 120px;
}

.title-line {
	border: 1px solid red;
	margin-top: 5px;
	margin-bottom: 20px;
}

.mTitle {
	font-weight: bold;
	font-size: 25px;
	vertical-align: middle;
	background-image: url("pictures/title.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
}

.mTitle span {
	margin-left: 20px;
}


</style>
<script>
	$(document).ready(

	);
</script>
</head>
<body>

	<div class="container">

		<header>
			<%@include file="/include/topMenu.jsp"%>
		</header>
		<div id="result">
			<div class="mTitle">
				<span>이용안내</span>

			</div>
			<hr class="title-line" />
		</div>

		<div style="width: 100%;">
		<img src="pictures/useInfo.png" alt="" style="width: 80%;"/>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>