<%@ page pageEncoding="UTF-8"%>

<footer>
	<hr />
	<div class="row">
		<ul class="list-inline">
			<li>
				<p class="logo">
					<img src="http://nds.nongshim.co.kr/web/images/new_main/logo02.gif"
						alt="NDS(로고)" />
				</p>
			</li>

			<li><span> 서울특별시 동작구 여의대방로 112 농심 도연관 11, 12층 TEL
					02)827-2114 FAX 02)827-2119<br /> COPYRIGHT(C) 2012 BY NDS RIGHTS
					RESERVED
			</span></li>
			<li class="family" style="float: right;">
				<form action="#this" class="form-inline" role="form"
					onsubmit="applyFamilyUrl()">
					<select id="family_select" name="family" class="form-control">
						<option value="">FAMILY SITES</option>
						<option value="http://www.nongshim.com">농심</option>
						<option
							value="http://www.nongshim.com/introduction/list_holdings_notice">농심홀딩스</option>
						<option value="http://www.megamart.com">메가마트</option>
						<option value="http://www.youlchon.com">율촌화학</option>
						<option value="http://www.itaekyung.com">태경농산</option>
						<option value="http://www.nongshimeng.com">농심엔지니어링</option>
						<option value="http://www.nscom.co.kr">농심기획</option>
						<option value="http://www.hotelnongshim.com">호텔농심</option>
						<option value="http://www.youlchon.org">율촌재단</option>
						<option value="http://www.ildonglakes.co.kr">농심개발</option>
					</select>

					<button class="btn btn-sm btn-danger">go</button>
					<a
						href="https://www.facebook.com/pages/%EB%86%8D%EC%8B%ACNDS%EB%86%8D%EC%8B%AC%EB%8D%B0%EC%9D%B4%ED%83%80%EC%8B%9C%EC%8A%A4%ED%85%9C/362411760515743"
						target="_blank"><img
						src="http://nds.nongshim.co.kr/web/images/new_main/bt_f.gif"
						alt="NDS 페이스북" /></a>

				</form>
			</li>
			<li class="last"></li>
		</ul>
	</div>
</footer>
<script>
	$(document).ready(function() {
	});

	function applyFamilyUrl() {
		window.open($("select[name = family]").val());
	}
</script>
