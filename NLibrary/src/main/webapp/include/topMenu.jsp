<%@ page pageEncoding="UTF-8"%>

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