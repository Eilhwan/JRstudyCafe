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

ul {
	text-decoration: none;
}

.dummy {
	text-align: center;
	padding: 20px 0;
	border-bottom: 1px solid lightgray;
	margin-bottom: 20px;
}

.introduction {
	width: 60%;
	height: 1600px;
	margin: 20px auto;
}

.introduction_title {
	margin-top: 40px;
	border-bottom: 1px solid lightgray;
	overflow: hidden;
	height: 80px;
	line-height: 110px;
}

.introduction_title h3 {
	width: 160px;
	border-bottom: 1px solid black;
	float: left;
	font-size: 1.3em;
}

.introduction_img {
	height: 600px;
	overflow: hidden;
}

.introduction_img_left {
	border: 1px solid black;
	height: 600px;
	margin-left: 20px;
	float: left;
	box-sizing: border-box;
}

.introduction_img_right {
	height: 600px;
	margin-left: 15px;
	float: left;
}

.introduction_img_left {
	width: 60%;
	background-image: url('${conPath }/images/mainslide_01.jpg');
	background-position: center;
}

.introduction_img_right {
	width: 35%;
}

.introduction_img_right1, .introduction_img_right2 {
	height: 295px;
	border: 1px solid black;
	box-sizing: border-box;
}

.introduction_img_right2 {
	margin-top: 10px;
	background-image: url('${conPath }/images/room1.jpg');
}
.introduction_img_right1 {
	background-image: url('${conPath }/images/room4.jpg');
}
.introduction_content_operatingtime1 {
	height: 350px;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	margin: 20px 0;
	text-align: center;
}

.introduction_content_operatingtime2 {
	margin-top: 50px;
}

.price_table {
	margin: 20px 0;
	padding-bottom: 60px;
}

.price_table table {
	width: 90%;
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto;
}

.price_table table td {
	width: 45%;
	height: 60px;
}

.price_table .td1 {
	border: 1px solid lightgray;
	border-width: 1px 1px 1px 0;
}

.price_table .td2 {
	border: 1px solid lightgray;
	border-width: 1px 0 1px 1px;
}

#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

#main_content {
	font-weight: bold;
	font-size: 1.2em;
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
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/main.css" />
<script src="${conPath }/js/script.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="introduction">
		<div class="introduction_title">
			<h3>이용안내</h3>
		</div>
		<div class="dummy">
			<p>3인실부터~18인실까지 "독립된 모임공간" (회의실, 스터디룸, 강의실,세미나실) 입니다.</p>
		</div>
		<div class="introduction_img">
			<div class="introduction_img_left">
			</div>
			<div class="introduction_img_right">
				<div class="introduction_img_right1">
				</div>
				<div class="introduction_img_right2">
				</div>
			</div>

		</div>
		<div class="introduction_content">
			<div class="introduction_content_operatingtime1">
				<div class="introduction_content_operatingtime2">
					<h3 id="main_content">스터디룸 운영시간</h3>
					<br>
					<p>연중무휴 24시간</p>
					<br>
					<p>밤 22:00~다음날 오전 10:00 이용은 미리 예약 필수. * 심야시간은 예약 없이 당일 방문 이용 불가
						*</p>
					<br>
					<p>예약 가능 시간 10:00~22:00 ( 카톡ID : 7022110 )</p>
					<br>
					<p>[채움 스탭 근무시간] 월 ~ 일 10:00~22:00</p>
				</div>
			</div>
		</div>
		<div class="introduction_title">
			<h3>요금안내</h3>
		</div>
		<div class="price_table">
			<table>
				<tr>
					<td class="td1">평일 10:00~24:00</td>
					<td class="td2">1시간 2,000원</td>
				</tr>
				<tr>
					<td class="td1">평일 24:00~10:00</td>
					<td class="td2">1시간 1,500원</td>
				</tr>
				<tr>
					<td class="td1">주말 10:00~24:00</td>
					<td class="td2">1시간 2,500원</td>
				</tr>
				<tr>
					<td class="td1">주말 24:00~10:00</td>
					<td class="td2">1시간 2,000원</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>