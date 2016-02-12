<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>

<style type="text/css">
img {
	width: 400px;
	height: 300px;
	padding: 20px;
}

.form-4 {
	/* Size and position */
	margin: 60px auto 30px;
	padding: 10px;
	position: relative;
	/* Font styles */
	color: black;
}

.form-4 h1 {
	font-family: 'Raleway', 'Lato', Arial, sans-serif;
	text-shadow: 0 2px 1px rgba(0, 0, 0, 0.3);
	font-size: 22px;
	font-weight: bold;
	padding-bottom: 20px;
}

.form-4 input[type=text], .form-4 input[type=password] {
	/* Size and position */
	padding: 8px 4px 8px 10px;
	margin-bottom: 15px;
	/* Styles */
	border: 1px solid #4e3043; /* Fallback */
	border: 1px solid rgba(78, 48, 67, 0.8);
	background: rgba(0, 0, 0, 0.15);
	border-radius: 2px;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2), inset 0 1px 1px
		rgba(0, 0, 0, 0.1);
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
	/* Font styles */
	font-family: 'Raleway', 'Lato', Arial, sans-serif;
	color: #fff;
	font-size: 13px;
}

.form-4 input::-webkit-input-placeholder {
	color: rgba(37, 21, 26, 0.5);
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.15);
}

.form-4 input:-moz-placeholder {
	color: rgba(37, 21, 26, 0.5);
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.15);
}

.form-4 input:-ms-input-placeholder {
	color: rgba(37, 21, 26, 0.5);
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.15);
}

.form-4 input[type=text]:hover, .form-4 input[type=password]:hover {
	border-color: #333;
}

.form-4 input[type=text]:focus, .form-4 input[type=password]:focus,
	.form-4 input[type=submit]:focus {
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2), inset 0 1px 1px
		rgba(0, 0, 0, 0.1), 0 0 0 3px rgba(255, 255, 255, 0.15);
	outline: none;
}

/* Fallback */
.no-boxshadow .form-4 input[type=text]:focus, .no-boxshadow .form-4 input[type=password]:focus
	{
	outline: 1px solid white;
}

.form-4 input[type=submit] {
	/* Size and position */
	padding: 8px 5px;
	/* Styles */
	/*   background: linear-gradient(rgba(99,64,86,0.5), rgba(76,49,65,0.7)); */
	background: red;
	border-radius: 5px;
	border: 1px solid #4e3043;
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.4), 0 2px 1px
		rgba(0, 0, 0, 0.1);
	cursor: pointer;
	transition: all 0.3s ease-out;
	/* Font styles */
	color: white;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.3);
	font-size: 16px;
	font-weight: bold;
	font-family: 'Raleway', 'Lato', Arial, sans-serif;
	border-radius: 5px;
}

.form-4 input[type=submit]:hover {
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.2), inset 0 20px 30px
		rgba(99, 64, 86, 0.5);
}

/* Fallback */
.no-boxshadow .form-4 input[type=submit]:hover {
	background: #594642;
}

.form-4 label {
	display: none;
	padding: 0 0 5px 2px;
	cursor: pointer;
}

.form-4 label:hover ~ input {
	border-color: #333;
}

.no-placeholder .form-4 label {
	display: block;
}
</style>
</head>
<body>
	<div class="content">
		<div style="margin: auto; width: 800px;">

			<div
				style="width: 50%; margin-top: 50px; padding: 10px; float: left;">
				<img src="pictures/login.png">
			</div>

			<div style="width: 50%; float: left;">
				<form class="form-4">
					<h1>
						<font color="red">N</font>-Library
					</h1>
					<p>
						<label for="login">Username</label> <input type="text"
							name="login" placeholder="사번" required>
					</p>
					<p>
						<label for="password">Password</label> <input type="password"
							name='password' placeholder="비밀번호" required>
					</p>

					<p>
						<input type="submit" name="submit" value="로그인">
					</p>
					<p>
						<font color="green">시스템 문의 : 010-2711-6904</font>
					</p>
				</form>
			</div>
		</div>
	</div>



</body>
</html>
