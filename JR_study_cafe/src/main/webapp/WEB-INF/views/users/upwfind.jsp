<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin-top: 50px;
	color: #7d7d7d;
	font-weight: lighter;
}

#idfind2 {
	font-size: 2.5em;
	margin-left: 270px;
	margin-top: 70px;
	color: #4d4d4d;
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
	margin: 50px auto 0 auto;
	width: 990px;
}

legend {
	color: #4d4d4d;
	font-weight: bold;
	font-size: 1.2em;
	padding: 10px;
}

ul {
	background-color: #f0f0f0;
	height: 215px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

li {
	list-style: none;
	height: 30px;
	margin: 10px 0;
}

.li3 {
	font-size: 1.2em;
	margin-right: 50px;
}

input[type="text"] {
	width: 300px;
	height: 32px;
	padding-left: 10px;
	background-color: #d9d9d9;
	border: 0;
	outline: 0;
}
input[type="text"]:focus {
	background-color: white;
	border:1px solid red;
}
.subtn {
	margin:50px auto;
	width:600px;
}
.btnClass,.resetbtn {
	margin-left: 20px;
}
.insub, .btnClass,.resetbtn {
	width:180px;
	height:50px;	
	font-weight: bold;
	font-size:1.1em;
	border:none;
}
.insub {
	background-color: black;
	color:white;
}
.btnClass {
	background-color: gray;
	color:white;
}
.resetbtn {
	background-color: red;
	color:white;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<form action="${conPath}/pwfind.do" method="get">
	<div id="wrap">
		<div id="caption">
			<a href="${conPath}/main.do"><img
				src="${conPath }/images/logo_dark.png" alt="logo"></a>
			<hr>
			<div id="idfind">비밀번호 찾기</div>
			<div id="idfind2">
				아이디 확인 후<br>비밀번호를 찾으실 수 있습니다.
			</div>
		</div>
		<div class="left">
				<hr color="black">
				<fieldset>
					<legend class="hidden"> 【 이메일 주소로 찾기 】</legend>
					<ul id="u_findId">
						<li>&nbsp;</li>
						<li><label class="li3">아이디</label><input type="text"
							class="u_id" name="u_id" placeholder="아이디를 입력해주세요." value="${u_id }" autocomplete="off">
						<li>
						<li><label class="li3">이메일</label><input type="text"
							class="u_email" name="u_email" placeholder="이메일을 입력해주세요."
							value="${u_email }" autocomplete="off">
						<li>
						<li>&nbsp;</li>
					</ul>
				</fieldset>
			<div class="subtn">
				<input class="insub" type="submit" value="비밀번호 찾기"> 
				<input type="button" value="아이디 찾기" class="btnClass" onclick="location.href='${conPath }/idfindView.do'">
				<input type="button" value="이전" class="resetbtn" onclick="history.go(-1)">
				
			</div>
		</div>
	</div>
	</form>
</body>
</html>