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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
<script>
	$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';
</script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<script src="${conPath }/js/script.js"></script>
<style>
#content_hole {
	height:50px;
}
#content_wrap {
	height:450px;
	background-color: #f5f5f5;
	margin: 120px 0;
	padding:50px;
}
#content_inner {
	width:1100px;
	margin:0 auto;
	overflow:hidden;
}
#left_div, #right_div {
	float:left;
	width:50%;
}
#right_div {
	line-height:400px;
	height:400px;
}
#right_div img {
	margin-left:10px;
}
#bottom_div {
	clear:both;
}
#caption {
	padding-bottom:5px;
	font-weight: bold;
	font-size:1.4em;
	margin-bottom:20px;
}
table tr td:nth-child(1) {
	font-weight: bold;
}
table tr td {
	height:60px;
}
table tr input[type="text"],input[type="password"] {
	height:55px;
	width:400px;
	padding-left:10px;
	font-size: 15px;
}
table tr input[type="submit"] {
	height:115px;
	width:115px;
	margin-left:10px;
	font-size: 1.2em;
	background-color: black;
	color:white;
	font-weight: bold;
} 
#table_ul {
	overflow:hidden;
	margin-left: 270px;
}
#table_ul > li:nth-child(2n+1) {
	float:left;
	text-align:center;
}
#table_ul > li:nth-child(2n) {
	float:left;
	margin:0 10px;
}
#table_ul > li a {
	font-size:0.9em;
	color:black;
}
</style>
</head>
<body>
	<c:if test="${not empty result }">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<div id="content_inner">
	<div id="caption">
	회원 / 비회원
	<hr style="border:1px solid black; width:1050px; ">
	</div>
	<form action="${conPath }/login.do" method="post">	
	<div id="left_div">
		<table>
			<tr>
			<!-- <td colspan="2">JRstudy는 카카오톡 ID로 별도의 회원가입 없이 이용 가능합니다.</td> -->
			</tr> 
			<tr>
				<td>
					<input type="text" name="u_id" required="required" value="${u_id }" placeholder="아이디를 입력해주세요.">
				</td>
				<td rowspan="2"><input type="submit" value="로그인"></td>
			</tr>
			<tr>
			<td>
				<input type="password" name="u_pw" required="required" value="${u_pw }" placeholder="비밀번호를 입력해주세요.">
			</td>
			</tr>
			<tr><td colspan="2">
				<ul id="table_ul">
					<li><a href="${conPath}/joinView.do">회원가입</a></li>
					<li>|</li>
		  			<li><a href="${conPath }/idfindView.do">ID찾기</a></li>
		  			<li>|</li>
		  			<li><a href="${conPath }/pwfindView.do">비밀번호찾기</a></li>
				</ul>
			</td></tr>
		</table>
		</div>
		<div id="right_div">
			<img src="${conPath }/images/로그인광고.jpg" alt="광고사진">
		</div>
	</form>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>