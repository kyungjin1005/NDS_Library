<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도서상세정보</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


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

.sub-title {
	font-family: "맑은고딕";
	font-weight: bold;
	font-size: 20px;
	align-items: center;
	margin-top: 50px;
}

.icon {
	font-size: 25px;
}

.sub-title-line {
	border: 0px solid #888;
	margin-top: 5px;
	margin-bottom: 40px;
}

#book-img {
	width: 90%;
}

#info-table {
	width: 100%;
	margin: 0px auto;
	text-align: left;
}

#info-table th {
	width: 30%;
	font-weight: bold;
	font-size: 16px;
	text-align: left;
	margin-left: 5px;
}

#info-table td {
	vertical-align: middle;
	margin: 0px 10px;
	font-size: 16px;
	text-align: left;
	line-height: 1.9em;
}

#info-table th, #info-table td {
	font-family: "맑은고딕";
}

#borrow-table th, #reply-table th {
	font-weight: bold;
	font-size: 16px;
}

#borrow-table td, #reply-table td {
	font-size: 15px;
	vertical-align: middle;
	height: 40px;
}

#borrow-table th, #borrow-table td, #reply-table th, #reply-table td {
	text-align: center;
	font-family: "맑은고딕";
}

#btn-write {
	width: 100%;
	height: 100%;
	font-weight: bold;
	font-size: 15px;
}
</style>
<script>
	$(document).ready(function() {

	});

	function borrow() {
		var r = confirm("대여하시겠습니가?");
		if (r == true) {
		} else {
		}
	}

	function reserve() {
		var r = confirm("예약하시겠습니까?");
		if (r == true) {
		} else {
		}
	}
</script>
</head>
<body>


	<%-- 
	
 --%>
	<div class="container">

		<header>
			<%@include file="/include/header.jsp"%>
		</header>

		<div id="result">
			<div class="mTitle">
				<span>도서상세정보</span>

			</div>
			<hr class="title-line" />
		</div>


		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>도서정보</span>

			<hr class="sub-title-line" />
		</div>
		<section class="row">

			<div class="col-md-8 ">


				<table class="table text-center" id="info-table">
					<tbody>

						<tr>
							<th>제목</th>
							<td>이것이 자바다</td>
						</tr>
						<tr>
							<th>저자</th>
							<td>홍길동</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td>ㅇㅇ출판사</td>
						</tr>
						<tr>
							<th>ISBN</th>
							<td>432423</td>
						</tr>

						<tr>
							<th>발간일</th>
							<td>2016-02-04</td>
						</tr>
						<tr>
							<th>책소개</th>
							<td>『이것이 자바다』은 15년 이상 자바 언어를 교육해온 자바 전문강사의 노하우를 아낌 없이 담아낸 자바
								입문서이다. 자바 입문자를 배려한 친절한 설명과 배려로 1장에 풀인원 설치 방법을 제공하여 쉽게 학습환경을 구축할
								수 있다. 또한 중급 개발자로 나아가기 위한 람다식(14장), JAVAFX(17장), NIO(18~19장) 수록되어
								있으며 각 챕터마다 확인문제 제공. 풀이와 답은 인터넷 강의에서 친절한 해설을 통해 알려준다.</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<img src="pictures/booksample01.jpg" id="book-img" />
			</div>
		</section>

		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>소장정보</span>
			<span
				style="font-size: 13px; vertical-align: bottom; float: right; color: #0000ff;"><span>대여가능권수
			</span><span class="badge" style="margin-left: 3px">3</span></span>

			<hr class="sub-title-line" />
		</div>
		<section class="row">


			<table class="table table-hover text-center" id="borrow-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>BOOK ID</th>
						<th>청구기호</th>
						<th>도서상태</th>
						<th>반납예정일</th>
						<th>예약/대여하기</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>1</td>
						<td>4234</td>
						<td>100.x.x</td>
						<td>대출중</td>
						<td>2016-02-04</td>
						<td>
							<button class="btn btn-md btn-default btn-reserve"
								onclick="reserve()">예약하기</button>
							<button class="btn btn-md btn-warning btn-borrow"
								onclick="borrow()">대여하기</button>

						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>4234</td>
						<td>100.x.x</td>
						<td>대출중</td>
						<td>2016-02-04</td>
						<td>
							<button class="btn btn-md btn-default">예약하기</button>
							<button class="btn btn-md btn-warning">대여하기</button>

						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>4234</td>
						<td>100.x.x</td>
						<td>대출중</td>
						<td>2016-02-04</td>
						<td>
							<button class="btn btn-md btn-default">예약하기</button>
							<button class="btn btn-md btn-warning">대여하기</button>

						</td>
					</tr>
				</tbody>
			</table>
		</section>




		<div class="sub-title">
			<span class="glyphicon glyphicon-list-alt icon"></span> <span>리뷰<span
				class="badge" style="margin-left: 3px">3</span></span>


			<hr class="sub-title-line" />
		</div>
		<section class="row">


			<table class="table table-hover text-center" id="reply-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>평점</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td>이 책 정말 괜찮은 것 같네요!</td>
						<td>김혜원</td>
						<td>2016-02-05</td>

					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td>이 책 정말 괜찮은 것 같네요!</td>
						<td>김혜원</td>
						<td>2016-02-05</td>

					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td>이 책 정말 괜찮은 것 같네요!</td>
						<td>김혜원</td>
						<td>2016-02-05</td>

					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td>이 책 정말 괜찮은 것 같네요!</td>
						<td>김혜원</td>
						<td>2016-02-05</td>

					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td>이 책 정말 괜찮은 것 같네요!</td>
						<td>김혜원</td>
						<td>2016-02-05</td>

					</tr>

				</tbody>
			</table>

			<form role="form" method="post" action="">
				<div class="form-group">
					<div class="col-md-2" style="padding: 0px; margin: 0px;">
						<select class="form-control" id="star" name="star">
							<option value="0">☆☆☆☆★</option>
							<option value="1">☆☆☆★★</option>
							<option value="1">☆☆★★★</option>
							<option value="1">☆★★★★</option>
							<option value="1">★★★★★</option>
						</select>
					</div>
					<div class="col-md-9">
						<input type="text" placeholder="댓글을 입력해주세요(50)"
							required="required" maxlength="100" class="form-control"
							id="comment">
					</div>
					<div class="col-md-1" style="padding: 0px;">
						<button type="submit" class="btn btn-default btn-warning">등록</button>
					</div>
				</div>
			</form>
		</section>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>

</body>
</html>