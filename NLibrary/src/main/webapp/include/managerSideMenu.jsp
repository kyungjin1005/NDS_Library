<%@ page pageEncoding="UTF-8"%>

<div class="col-md-2">
		<div id="list-title">
			<img src="pictures/managerpage.png" alt="" />
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a href="ManagerMember.nds">회원관리</a></li>
			<li class="list-group-item"><a href="ManagerBorrow.nds">대출관리</a></li>
			<li class="list-group-item"><a data-toggle="collapse"
				href="#collapse1">도서관리<span
					class="glyphicon glyphicon-menu-right"
					style="margin-left: 5px; font-size: 10px;"></span></a></li>
		<li>
			<div id="collapse1" class="panel-collapse collapse">
				<ul class="list-group"
					style="margin: 0px; padding: 0px; text-align: center;">
					<li class="list-group-item"><a href="">- 모든도서</a></li>
					<li class="list-group-item"><a href="ManagerBookRequire.nds">- 신청도서</a></li>
					<li class="list-group-item"><a href="ManagerBookDonation.nds">- 기증도서</a></li>
				</ul>
			</div>
		</li>
		<li class="list-group-item"><a href="">게시판관리</a></li>
		<li class="list-group-item"><a href="MessageList.nds">메세지관리</a></li>
	</ul>
</div>
