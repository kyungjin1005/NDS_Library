<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>대출현황조회</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


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

#borrow-table th {
	font-weight: bold;
	font-size: 16px;
}

#borrow-table td {
	font-size: 15px;
	vertical-align: middle;
}

#borrow-table td img {
	width: 60px;
	margin: 0px 6px;
	border: 0px solid red;
}

#borrow-table th, #borrow-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#borrow-table td:nth-child(2) {
	text-align: left;
}

#possible-book {
	border: 0px solid blue;
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

#possible-book span {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 15px;
	color: #2C2255;
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
			<%@include file="/include/mypageSideMenu.jsp"%>
			<div class="col-md-10">
				<h1 id="mTitle">대출현황조회</h1>
				<hr class="title-line" />

				<div id="possible-book">
					<span>＊현재 대출가능권수 : </span><span>2</span><span>/3권</span>

					<form class="form-inline" role="form" method="post"
						style="display: inline-block; float: right;">
						<select class="form-control" id="borrow-filter"
							name="borrow-filter">
							<option value="0">전체</option>

							<option value="1">예약중</option>
							<option value="2">대출대기</option>
							<option value="3">대출중</option>
							<option value="4">반납완료</option>
						</select>
					</form>
				</div>


				<table class="table table-hover text-center" id="borrow-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>대출일</th>
							<th>반납예정일</th>
							<th>반납일</th>
							<th>대출상태</th>
							<th>연장횟수</th>
							<th>연장하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>대출대기</td>
							<td>0/1</td>
							<td>
								<button class="btn btn-md btn-warning disabled">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>예약중</td>
							<td>0/1</td>
							<td>
								<button class="btn btn-md btn-warning disabled">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>2016-01-22</td>
							<td>2016-02-05</td>
							<td>-</td>
							<td>대출중</td>
							<td>0/1</td>
							<td>
								<button class="btn btn-md btn-warning">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>2016-01-22</td>
							<td>2016-02-05</td>
							<td>-</td>
							<td>대출중</td>
							<td>0/1</td>
							<td>
								<button class="btn btn-md btn-warning">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>2016-01-22</td>
							<td>2016-02-05</td>
							<td>-</td>
							<td>대출중</td>
							<td>1/1</td>
							<td>
								<button class="btn btn-md btn-warning disabled">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>2016-01-22</td>
							<td>2016-02-05</td>
							<td>2016-02-05</td>
							<td>반납완료</td>
							<td>1/1</td>
							<td>
								<button class="btn btn-md btn-warning disabled">연장하기</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="pictures/booksample01.jpg" alt="" /><span>이것이자바다</span></td>
							<td>2016-01-22</td>
							<td>2016-02-05</td>
							<td>2016-02-05</td>
							<td>반납완료</td>
							<td>1/1</td>
							<td>
								<button class="btn btn-md btn-warning disabled">연장하기</button>
							</td>
						</tr>



					</tbody>
				</table>
			</div>
		</div>
		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>

</body>
</html>