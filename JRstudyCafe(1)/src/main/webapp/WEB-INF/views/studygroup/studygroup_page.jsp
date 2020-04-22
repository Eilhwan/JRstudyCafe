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
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
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
	<jsp:include page="../main/header.jsp"/>
	<div id="content_hole"></div>
	<div class="container">
		<div class="is-one-quarter">
			<ul>
				<li>나의 스터디그룹</li>
				<li>스터디그룹 개설</li>
			</ul>
		</div>
		<div>
				
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>