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
					<li class="list-group-item"><a href="">공지사항</a></li>
					<li class="list-group-item"><a href="">도서신청</a></li>
					<li class="list-group-item"><a href="">기증도서</a></li>
					<li class="list-group-item"><a href="">스터디모집</a></li>
				</ul>

			</div>
			<div class="col-md-10">
				<h1 id="mTitle">스터디모집</h1>
				<hr class="title-line" />
			</div>

			<table>
				<tr>
					<td>

						<table>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제 목&nbsp;&nbsp;</td>
								<td><input class="form-control" id="focusedInput"
									type="text" size="80"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="5">
								<!-- <td colspan="4"></td> -->
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td align="center">파일첨부&nbsp;&nbsp;</td>
								<td>
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#myModal">사진</button>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr height="5">
							</tr>
							<!-- 
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td>&nbsp;</td>

							</tr>
							<tr height="1">
							</tr> -->

							<tr>
								<td>&nbsp;</td>
								<td align="center">내 용</td>
								<td><textarea class="form-control" id="focusedInput"
										cols="80" rows="13"></textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="9">
								<td colspan="4"></td>
							</tr>

							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type=button value="등록"> <input
									type=button value="취소">
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>



			<!-- Modal -->


			<div class="modal fade" id="myModal" role="dialog">
				<!-- <div class="modal fade" id="myModal" role="dialog"> -->
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">사진 업로드</h4>
						</div>
						<div class="modal-body">

							<form role="form" action="AdminPictureInsert.nds" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="birthday">사진등록 (only JPG, 500K byte 이내):</label> <input
										type="file" class="form-control" id="weddingboardPicFileName"
										name="weddingboardPicFileName" required="required">
								</div>
								<button type="submit" class="btn btn-default">Submit</button>
							</form>


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>

		<footer>
			<%@include file="/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>