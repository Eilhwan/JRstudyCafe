<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
}
ul{
	list-style: none;
}
a{
	text-decoration: none;
	color: black;
}
.login_wrap{
	max-width: 400px;
    margin: 0 auto;
}
.users_title{
	margin-bottom: 20px;
    color: #000;
    font-size: 25px;
    font-weight: 500;
    text-align: center;
	
}
.tab_cnt{
	width:100%;
	padding-top: 18px;
    border-top: 4px solid #000;
}
.inpbx{
	width: 100%;
    height: 48px;
    border: 1px solid lightgray;
    margin-top: 10px;
    margin-bottom: 10px;
}
.inpbx input{
	box-sizing:border-box;
	display: block;
    width: 100%;
    height: 100%;
    font-size: 14px;
    border: none;
    outline: none;
    padding: 0 14px;
    font-size: 1.1em;
}
.insub{
	width: 100%;
    height: 60px;
    margin: 30px 0;
    background: #000;
    color: #fff;
    font-size: 16px;
    line-height: 60px;
    font-weight: 500;
    border: none;
}
.tab_cnt ul{
    display: flex;
    justify-content: center;
}
.tab_cnt ul li{
	position: relative;
    display: inline-block;
    padding: 0 20px;
}
.li1{
	border-right: 1px solid lightgray;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div id="container" style="height: 821px;">
		<!-- CONTENTS -->
<!-- CONTENTS -->
<div id="content" class="non_sign inquiry ">
	<div class="content_header">
		<h2><img src="https://static.nid.naver.com/images/user/images/user/h_find_id.gif" width="67" height="16" alt="아이디 찾기"></h2>
	</div>
	
	
	<p class="content_summary">고객님의 정보와 일치하는 아이디 목록입니다.</p>
	<form name="fm1" action="" method="POST">
	<input type="hidden" name="nv_id" value="">
	<input type="hidden" name="token_help" value="BGXHbeDiwtfTQeS3">
	<input type="hidden" id="authType" name="authType" value="RM">
	<div class="section section_find">
		<div class="box6" style="text-align:center">
			<ul class="list_id">
				<li>
					<strong>
						<input type="radio" name="select" id="select0" value="6f69c5f8c6523d5bfe451d04933a9cd9"> 
						<label for="select0" class="label_rd">jkh30125</label>
					</strong>
					<span>가입 : 2006.06.02</span>
					<input type="hidden" name="nv_id0" value="jkh30125">
				</li><li>
					<strong>
						<input type="radio" name="select" id="select1" value="b883d017c5687d57a5326279d9cd66e3"> 
						<label for="select1" class="label_rd">jkh301251</label>
					</strong>
					<span>가입 : 2014.06.06</span>
					<input type="hidden" name="nv_id1" value="jkh301251">
				</li>
			</ul>
		</div>
		<!-- 버튼 영역 -->
		<div class="btn_area">
			<a href="#" onclick="login();clickcr(this,'uid.login','','',event);" class="btn_login2"><span class="blind">로그인하기</span></a>
			<a href="#" onclick="popup_change_passwd();clickcr(this,'uid.pwinquiry','','',event);" class="btn_findpw"><span class="blind">비밀번호 찾기</span></a>
		</div>
		<!-- 버튼 영역 -->
		<!-- 상세내용 영역 -->

		
		<div id="div_joinGuide_close" class="find_dsc">
			<h3>가입한 아이디가 보이지 않나요? <a href="javascript:showDetail('1','div_joinGuide_close');" onclick="clickcr(this,'uid.missed','','',event);">상세내용 펼치기<em class="ico_arr"></em></a></h3>
			<div class="find_dsc_sub">
				<p>다른 방법으로 아이디 찾기를 해 보세요.<br>아이핀, 본인 명의 휴대전화를 이용하면 본인 명의로 가입된 아이디를 찾을 수 있고,<br>회원정보에 등록된 정보로 아이디 찾기를 하면, 명의와는 관계 없이 등록한 정보가 일치하는 아이디를 찾을 수 있습니다.</p>
				<p>다른 방법으로도 아이디를 찾지 못했다면 아이디가 원래 없었을 수 있습니다. <a target="_blank" href="https://nid.naver.com/user/join.html?url=http://www.naver.com" onclick="clickcr(this,'uhl.missjoin','','',event);">아이디를 새로 만드세요.</a></p>
			</div>
		</div>
		<div id="div_joinGuide_open" class="find_dsc open" style="display:none">
			<h3>가입한 아이디가 보이지 않나요? <a href="javascript:showDetail('1','div_joinGuide_open');" onclick="clickcr(this,'uhl.missfold','','',event);">상세내용 접기<em class="ico_arr"></em></a></h3>
			<div class="find_dsc_sub">
				<p>다른 방법으로 아이디 찾기를 해 보세요.<br>아이핀, 본인 명의 휴대전화를 이용하면 본인 명의로 가입된 아이디를 찾을 수 있고,<br>회원정보에 등록된 정보로 아이디 찾기를 하면, 명의와는 관계 없이 등록한 정보가 일치하는 아이디를 찾을 수 있습니다.</p>
				<p>다른 방법으로도 아이디를 찾지 못했다면 아이디가 원래 없었을 수 있습니다. <a target="_blank" href="https://nid.naver.com/user/join.html?url=http://www.naver.com" onclick="clickcr(this,'uhl.missjoin','','',event);">아이디를 새로 만드세요.</a></p>
			</div>
		</div>

		<div id="div_leaveGuide_close" class="find_dsc">
			<h3>내가 가입하지 않은 아이디가 보인다면? <a href="javascript:showDetail('2','div_leaveGuide_close');" onclick="clickcr(this,'uid.notmine','','',event);">상세내용 펼치기<em class="ico_arr"></em></a></h3>
			<div class="find_dsc_sub">
				<p>직접 가입하지 않은 아이디가 있어, 신고를 원하시면 도움말을 참고해 주세요. <a target="_blank" href="https://help.naver.com/support/alias/membership/p.membership/p.membership_24.naver" onclick="clickcr(this,'uhl.nomyhelp','','',event);">도움말 바로가기</a>
				<br>직접 가입하지 않은 아이디는 아이디 선택 후 본인 명의 휴대전화로 인증을 받으면, 바로 탈퇴할 수 있습니다. <a href="javascript:leaveId();" onclick="clickcr(this,'uhl.nomyquit','','',event);">탈퇴하러가기</a></p>
			</div>
		</div>
		<div id="div_leaveGuide_open" class="find_dsc open" style="display:none">
			<h3>내가 가입하지 않은 아이디가 보인다면? <a href="javascript:showDetail('2','div_leaveGuide_open');" onclick="clickcr(this,'uhl.nomyfold','','',event);">상세내용 접기<em class="ico_arr"></em></a></h3>
			<div class="find_dsc_sub">
			<!--휴대전화나 이메일로 인증시 문구-->
				<p>직접 가입하지 않은 아이디가 있어, 신고를 원하시면 도움말을 참고해 주세요. <a target="_blank" href="https://help.naver.com/support/alias/membership/p.membership/p.membership_24.naver" onclick="clickcr(this,'uhl.nomyhelp','','',event);">도움말 바로가기</a>
			</p></div>
		</div>
		<!-- 상세내용 영역 -->
	</div>
	</form>
</div>
<hr>
<!-- CONTENTS -->
<form name="op" method="POST" action="https://nid.naver.com/user/help.nhn?a=idInquiry&amp;m=getIdList">
	<input type="hidden" name="token_help" value="BGXHbeDiwtfTQeS3">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="authRes" value="">
</form>	
		<!-- //CONTENTS -->
		<div class="aside"></div>
	</div>
</body>
</html>