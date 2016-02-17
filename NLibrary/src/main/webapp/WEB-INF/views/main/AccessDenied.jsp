<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 

<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page
	import="org.springframework.security.core.userdetails.UserDetails"%>
<%@ page
	import="org.springframework.security.core.userdetails.UserDetailsService"%> --%>

<%-- Ctrl+F11 직접 실행 하지 말 것! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/include/link.jsp"%>
<title>접근불가</title>



<style type="text/css">

.container{
	text-align: center;
	padding: 200px 200px;
}

#error-table tr th, #error-table tr td{
	text-align: center;
}
#error-table tr td{
	font-size: 15px;
	margin: 8px;
}
</style>
</head>
<body>


	<div class="container">

		<div class="panel panel-default" style=" width: 600PX; margin: 20px auto; padding: 10px;">
			<div class="panel-body" style="text-align: center;">
				<table id="error-table" style="margin: 0px auto; ">
					<tr>
						<th class="col-md-4"><img
							src="http://www.nsgportal.net/style/docs/common/img/error.gif"
							alt="Error" /></th>
						<td class="col-md-8">
							<h3>접근권한이 없습니다.</h3>
							<p>담당자에게 문의하여 주시기 바랍니다.</p>
							<p style="float: right; margin-top: 10px;">010-2711-6904 김혜원</p>
						</td>
					</tr>
				</table>
			</div>
		</div>


		<button class="btn btn-primary btn-md" onclick="location.href='Main.nds'">확인</button>

	</div>
</body>

<script>
	
</script>
</html>