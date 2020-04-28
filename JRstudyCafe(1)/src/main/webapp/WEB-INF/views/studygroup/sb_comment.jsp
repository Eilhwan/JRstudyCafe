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
</head>
<body>

	<div id="comment_area">
		<div class="comment_inner">
			<div id="user_img">
				<img src="" alt="댓글 사진" width="50" height="50">
			</div>
		</div>
		<div class="comment_inner">
			<div class="comment1">댓글이름</div>
			<div class="comment2">댓글내용</div>
			<div class="comment3">댓글시간</div>
		</div>
	</div>
</body>
</html>