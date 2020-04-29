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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0 auto;
}

.dummy {
	height: 20px;
}

.introduction {
	width: 55%;
	height:900px;
	margin:20px auto;
}

.introduction_title {
	border-bottom: 1px solid lightgray;
	overflow: hidden;
	height:80px;
	line-height: 110px;
}

.introduction_title h3 {
	width: 160px;
	border-bottom: 1px solid black;
	float: left;
	font-size: 1.3em;
}

.introduction_img {
	width: 100%;
	height: 450px;
	border: 1px solid black;
	overflow: hidden;
}

.introduction_img img {
	display: block;
	max-width: 100%;
	height: auto;
}
.introduction_content {
	padding-left : 20px;
}
blockquote {
	margin: 20px 0;
	padding: 20px 0;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}

#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
#main_content {
	font-weight: bold;
	margin:10px 0;
}
</style>
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
<script src="${conPath }/js/script.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"> </div>
	<div class="introduction">
		<div class="introduction_title">
			<h3>스터디룸 소개</h3>
		</div>
		<div class="dummy"> </div>
		<div class="introduction_img">
			<img src="${conPath }/images/introduction.jpeg">
		</div>
		<div class="dummy"> </div>
		<div class="introduction_content">
			<blockquote>
				<p id="main_content">
					탁 트인 전망, 밝고 쾌적한 시스템, 내 집처럼 아늑한 공간, JRstudy Cafe에서 편안하고 기분 좋은 모임을
					즐겨 보세요.
				</p>
			</blockquote>
			<ul>
				<li>* 거품 없이 합리적인 가격</li>
				<li>* 종로3가역 도보 3분, 편리한 교통</li>
				<li>* 탁 트인 유리 전망</li>
				<li>* 공기 환기 시스템으로 쾌적한 실내</li>
				<li>* 다양한 음료 서비스</li>
				<li>* 외국인 친구들을 만날 수 있는 기회</li>
			</ul>
		</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>