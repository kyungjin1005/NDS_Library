<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div class="row">
	<div class="col-md-4" id="logo">
		<a href="Main.nds"><img src="pictures/logo.png" alt="엔디에스" /></a>
	</div>
	<div class="col-md-4">
		<div class="gnbContainer gnbResize">
			<form method="get" class="form-inline" role="form">
				<div class="tsrch" style="left: 25%; background: none;">
					<select name="key" id="key" class="">
						<option value="1">도서제목</option>
						<option value="2">저자</option>
						<option value="3">출판사</option>
					</select>
				</div>
				<div class="tsrch">


					<fieldset>
						<legend>통합검색</legend>
						<input name="searchWord" id="searchWord" type="text"
							class="tsrch_input" style="outline: none; height: 20px;" />
						<button id="search" type="button" class="tsrch_btn">
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
			<li class="userName"><sec:authorize ifAnyGranted="ROLE_ADMIN">
					<a href="ManagerBookRequire.nds"><strong>${pageContext.request.userPrincipal.name}</strong>
						님</a>
				</sec:authorize> <sec:authorize ifAnyGranted="ROLE_USER">
					<a href="MypageRequire.nds"><strong>${pageContext.request.userPrincipal.name}</strong>
						님</a>
				</sec:authorize>
			<li class="logout"><a href="j_spring_security_logout">로그아웃</a></li>
		</ul>
	</div>
</div>
<div class="lnbContainer">
	<div id="lnbInner" class="lnbInner">
		<div class="navBox">
			<div class="nav">
				<ul onMouseOut="wmStartOffTimer();">
					<li class="lnb1"><a href="SearchPage.nds" class="tmOff"
						title="자료검색"><span><strong class="el">자료검색</strong></span></a></li>
					<sec:authorize ifAnyGranted="ROLE_ADMIN">
						<li class="lnb5"><a href="ManagerBookRequire.nds"
							class="tmOff" title="관리자페이지"><span><strong class="el">
										관리자페이지 </strong></span></a></li>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_USER">
						<li class="lnb5"><a href="MypageRequire.nds" class="tmOff"
							title="마이페이지"><span><strong class="el"> 마이페이지
								</strong></span></a></li>
					</sec:authorize>
					<li class="lnb9"><a href="UseInformation.nds" class="tmOff" title="이용안내"><span><strong
								class="el">이용안내</strong></span></a></li>
					<li class="lnb13"><a href="BoardNoticeList.nds" class="tmOff"
						title="커뮤니티"><span><strong class="el">커뮤니티</strong></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(
			function() {
				$("#search").on(
						"click",
						function() {
							//boardAppend(parseInt($(this).val()));

							$(location).attr(
									"href",
									"SearchResult.nds?key=" + $("#key").val()
											+ "&searchWord="
											+ $("#searchWord").val()
											+ "&filter=0");
						});

			});
</script>