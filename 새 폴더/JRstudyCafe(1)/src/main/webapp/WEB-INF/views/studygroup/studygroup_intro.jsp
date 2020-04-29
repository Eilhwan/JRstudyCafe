<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/studygroup.css">
<script src="${conPath }/js/jquery.js"></script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

header {
	padding: 0;
}

.card {
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
}

.card-image {
	width: 1000px;
	height: 500px;
	background-image: url('images/프로필.gif');
	position: relative;
}

#card_button {
	position: absolute;
	bottom: 0;
	right: 30px;
	margin: 20px;
}

.media-left figure img {
	border-radius: 50px;
}

.message {
	margin-top: 50px;
}
</style>
</head>

<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container">
	
		<div class="content-wrap side-bar">
			<div>
				<img src="${conPath }/studygroupUpload/${sg.sg_img}" alt="스터디그룹 이미지"
					width="240" height="224">
			</div>
			<div>
				<a class="sg-title">${sg.sg_name }</a>
			</div>
			<div>
				<span><a>맴버 ${sm_cnt }</a> | <a ::before>리더 ${sg.u_id } </a></span>
			</div>
			<div>
				<button class="join-btn">그룹 가입하기</button>
			</div>
		</div>
		
		<div class="content-wrap midContent">
			<div class="content-box">
				<div class="head-line">
					<h2>그룹 소개</h2>
				</div>
				<div class="content-line">${sg.sg_explain }</div>
			</div>
			<div>
				<h3>이 그룹의 활동 정보</h3>
				<ul>
					<li>개설일: </li>
					<li>작성된 글: </li>
					<li>가입자 수:</li>
				</ul>
			</div>
			
		</div>
	</div>
</body>

</html>