<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#wrap {
	height: 600px;
}

#caption {
	padding: 25px;
}

#caption a {
	margin-left: 270px;
}
#idfind {
	font-size: 1.7em;
	margin-left: 270px;
	margin-top:50px;
	color:#7d7d7d;
	font-weight: lighter;
}
#idfind2 {
	font-size: 2.5em;
	margin-left: 270px;
	margin-top:70px;
	color:#4d4d4d;
	font-weight: lighter;
}
.left {
	width: 70%;
	margin: 0 auto;
	background-color: white;
	padding-top: 30px;
	height: 600px;
}
fieldset {
	margin:50px auto 0 auto;
	width:990px;
}
legend {
	color:#4d4d4d;
	font-weight:bold;
	font-size:1.2em;
	padding:10px;
}
ul {
	background-color: #f0f0f0;
	height:215px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}
li{
	list-style: none;
	height:30px;
	margin: 10px 0;
}
.li1 {
	font-size : 1.2em;
	margin-right:20px;
}
.li2 {
	font-size : 1.2em;
	margin-right:102px;
}
input[type="text"] {
	width:300px;
	height:32px;
	padding-left:10px;
	background-color: #d9d9d9;
	border: 0;
	outline:0;
}
input[type="text"]:focus {
	background-color: white;
	border:1px solid red;
}
input[type="submit"] {

}
.subtn {
	width:380px;
	margin:50px auto;
}
.submitbtn, .resetbtn {
	width:180px;
	height:50px;	
	font-weight: bold;
	font-size:1.1em;
	border:1px solid black;
}
.resetbtn {
	background-color: #fafafa;
}
.submitbtn {
	background-color: black;
	color:white;
	margin-right: 20px;
}
</style>
<script src="../js/jquery-1.10.1.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('form').submit(function(){ 
   		if($('.u_email').val()==''){
		       alert("e-mail 를 입력하세요");
		       $('.u_email').focus();
		       return false;
		   }
   		if($('.u_name').val()==''){
		       alert("이름 를 입력하세요");
		       $('.u_name').focus();
		       return false;
		   }
	  });
 
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="caption">
			<a href="${conPath}/main.do"><img
				src="${conPath }/images/logo_dark.png" alt="logo"></a>
			<hr>
			<div id="idfind">아이디 찾기</div>
			<div id="idfind2">등록된 회원정보로<br>아이디를 찾으실 수 있습니다.</div>
		</div>
			
			<div class="left">
				<form action="${conPath }/idfind.do" method="post">
					<hr color="black">
					<fieldset>
						<legend class="hidden"> 【 이메일 주소로 찾기 】</legend>
						<ul id="u_findId">
							<li>&nbsp;</li>
							<li><label class="li1">입력한 이메일</label><input type="text" id="u_email" placeholder="이메일주소를 입력해주세요"
								name="u_email" autocomplete="off"/>
							<li>
							<li><label class="li2">이름</label><input type="text" id="u_name" placeholder="한글 또는 영문으로 입력해주세요"
								name="u_name" autocomplete="off"/>
							<li>
							<li>&nbsp;</li>
						</ul>
					</fieldset>
					<div class="subtn"><input type="submit" name="btnFindUid" id="btnFindUid"
								value="아이디 찾기" class="submitbtn"/><input
						type="button" value="이전" class="resetbtn"
						onclick="history.go(-1)"></div>
				</form>
			</div>
		</div>
</body>
</html>