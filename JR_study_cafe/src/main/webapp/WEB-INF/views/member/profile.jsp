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
<link rel="stylesheet" href="${conPath }/css/bulma.min.css" />
<script src="${conPath }/js/script.js"></script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
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
	margin-top:50px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content">
		<div class="card">
			<div class="card-image">
				<div id="card_button">
					<button class="button">전 게시글 보기</button>
					<button class="button">스터디로 초대하기</button>
				</div>
			</div>
			<div class="card-content">
				<div class="media">
					<div class="media-left">
						<figure class="image is-48x48">
							<img src="https://bulma.io/images/placeholders/96x96.png"
								alt="Placeholder image">
						</figure>
					</div>
					<div class="media-content">
						<p class="title is-4">John Smith</p>
						<p class="subtitle is-6">tjoeun@google.com</p>
					</div>
				</div>

				<div class="content">
					신촌, 홍대, 합정 근처 거주 / 컴퓨터대학교 컴퓨터공학과 4학년 재학중입니다. 같이 프로그래밍 할 팀원구하고 있습니다. <br>
					<a>@bulmaio</a>. <a href="#">#css</a> <a href="#">#spring</a> <br>
					<time datetime="2016-1-1">스터디 가능 시간 : (11:00 AM ~ 04:30 PM /
						2020-04-20 ~ 2020-06-01 )</time>
				</div>
				<div class="content">
					<article class="message">
						<div class="message-header">
							<p>최근 게시글</p>
							<button class="delete" aria-label="delete"></button>
						</div>
						<div class="message-body">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. <strong>Pellentesque
								risus mi</strong>, tempus quis placerat ut, porta nec nulla. Vestibulum
							rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et
							dictum <a>felis venenatis</a> efficitur. Aenean ac <em>eleifend
								lacus</em>, in mollis lectus. Donec sodales, arcu et sollicitudin
							porttitor, tortor urna tempor ligula, id porttitor mi magna a
							neque. Donec dui urna, vehicula et sem eget, facilisis sodales
							sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. <strong>Pellentesque
								risus mi</strong>, tempus quis placerat ut, porta nec nulla.
						</div>
					</article>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>