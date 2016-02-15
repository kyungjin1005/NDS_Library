<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- css -->
<link type="text/css"
	href="http://www.nsgportal.net/style/docs/lib/jquery/css/jquery-ui-1.9.0.custom.css"
	rel="stylesheet" />

<link type="text/css"
	href="http://www.nsgportal.net/style/docs/common/css/basic.css"
	rel="stylesheet" />

<link type="text/css"
	href="http://www.nsgportal.net/style/_project/nongshim/customize/css/nongshim.css"
	rel="stylesheet" />
<link type="text/css"
	href="http://www.nsgportal.net/style/_skin/nongshim/gnb/red/gnb.css"
	rel="stylesheet" />
<link type="text/css"
	href="http://www.nsgportal.net/style/_skin/nongshim/nav/red/nav.css"
	rel="stylesheet" />
<link type="text/css"
	href="http://www.nsgportal.net/style/_skin/nongshim/tab/red/tab.css"
	rel="stylesheet" />

<link type="text/css"
	href="http://www.nsgportal.net/style/_skin/nongshim/portlet/red/default.css"
	rel="stylesheet" />

<link type="text/css"
	href="http://www.nsgportal.net/style/docs/skin_new/button/gray/button.css"
	rel="stylesheet" />

<title>Insert title here</title>

<style type="text/css">
header {
	border: 0px solid red;
	height: 100px;
	position: relative;
	z-index: 1;
	padding-top: 10px;
}

header .row {
	height: 100%;
	vertical-align: middle;
}

header .row .col-md-4 {
	vertical-align: middle;
}

#logo a {
	border: 0px solid blue;
	float: left;
}

#logo img {
	border: 0px solid red;
	width: 130px;
}

.logout a {
	color: #ff0000;
}

header .list-inline {
	float: right;
}
</style>
<script>
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<header>
		<div class="row">

			<div class="col-md-4" id="logo">
				<a href="#"><img src="pictures/logo.png" alt="엔디에스" /></a>
			</div>
			<div class="col-md-4">
				<div class="gnbContainer gnbResize">
					<form action="" method="POST" class="form-inline" role="form">
						<div class="tsrch" style="left: 25%; background: none;">
							<select name="" id="" class="">
								<option value="">도서제목</option>
								<option value="">저자</option>
								<option value="">출판사</option>
							</select>
						</div>
						<div class="tsrch">


							<fieldset>

								<legend>통합검색</legend>
								<input name="searchWord" id="searchWord" type="text"
									class="tsrch_input"
									onkeydown="javascript:if(event.keyCode ==13) fnSearchUser();"
									style="outline: none; height: 20px;" />
								<button type="button" class="tsrch_btn">
									<span>검색</span>
								</button>
							</fieldset>
						</div>
					</form>
				</div>
			</div>

			<div class="col-md-4">

				<ul class="list-inline">
					<li><a href="http://www.nsgportal.net/">NDS Portal</a></li>

					<li class="userName"><a href="#userMenu"><strong>김혜원</strong>
							님</a>
					<li class="logout"><a href="#">로그아웃</a></li>
				</ul>
			</div>
		</div>


		<div class="lnbContainer">
			<div id="lnbInner" class="lnbInner">
				<div class="navBox">
					<div class="nav">
						<ul onMouseOut="wmStartOffTimer();">

							<li class="lnb1"><a href="#" class="tmOff" title="자료검색"><span><strong
										class="el">자료검색</strong></span></a></li>

							<li class="lnb5"><a href="#" class="tmOff" title="마이페이지"><span><strong
										class="el">마이페이지</strong></span></a></li>


							<li class="lnb9"><a href="#" class="tmOff" title="이용안내"><span><strong
										class="el">이용안내</strong></span></a></li>


							<li class="lnb13"><a href="#" class="tmOff" title="커뮤니티"><span><strong
										class="el">커뮤니티</strong></span></a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>