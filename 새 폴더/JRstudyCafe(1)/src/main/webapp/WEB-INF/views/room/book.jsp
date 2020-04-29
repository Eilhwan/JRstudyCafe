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
<script src="${conPath }/js/script.js"></script>
<style>
*{
	text-align: center;
}
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
#content_wrap {
	height:800px;
	overflow:hidden;
	border-top:1px solid black;
}
#content_left, #content_right {
	float:left;
}
#content_left {
	border-right:1px solid black;
	height:800px;
	width:310px;
}
#content_left .content_detail {
	border:1px solid red;
	margin : 20px;
	width: 270px;
	height:280px;
	box-sizing: border-box;
}
#content_left .content_detail2 {
	border:1px solid red;
	margin : 20px;
	width: 270px;
	height:65px;
	box-sizing: border-box;
}
#content_right .content_detail {
	border:1px solid red;
	margin : 45px 40px;
	width: 1120px;
	height:700px;
	box-sizing: border-box;
	background-color: white;
	z-index: 99999999;
}
#content_right {
	position: relative;
	width: 1200px;
	height:850px;
	border-right: 1px solid black;
}
#background-image {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    background-color: #c7b299;
    opacity: 0.6;
    z-index: -9999;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"> </div>
	<div id="content_wrap">
		<div id="content_left">
			<div class="content_detail">달력</div>
			<div class="content_detail2">시계</div>
		</div>
		<div id="content_right">
			<div class="content_detail"> **달력게시판**  여기서 달력보고 스터디룸 예약</div>
			<div id="background-image"></div>
		</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>