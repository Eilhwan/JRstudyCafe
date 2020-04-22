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
</head>
<body>
	<header> 
			<div class="container clearfix">
				<h1 class="logo"><a href="${conPath }/main.do">JRstudy logo</a></h1>
				<nav class="clearfix">
					<ul class="main-menu">
						<li><a href="${conPath }/main.do">메인</a></li>
						<li><a href="">소개</a></li>
						<li><a href="">이용안내</a></li>
						<li><a href="${conPath }/board.do">자유게시판</a></li>
						<li><a href="">사용후기</a></li>
						<li><a href="">스터디모집</a></li>
						<li><a href="${conPath }/book.do">스터디룸 예약</a></li>
						<li><a href="">Q&A</a></li>
					</ul>
					<ul class="user-menu">
						<!-- 사용자 로그인 상태일때 -->
						<c:if test="${empty users}">
						<li><a href="${conPath }/loginView.do">로그인</a></li>
						<li><a href="${conPath }/joinView.do">회원가입</a></li>
						</c:if>
						<c:if test="${not empty users}">
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<li><a href="${conPath }/modifyView.do">정보수정</a></li>
						<li><a href="">내 스터디룸</a></li>
						</c:if>
						<!-- 관리자 로그인 상태일때 -->
<!-- 						<li><a href="">회원검색</a></li> -->
<!-- 						<li><a href="">회원리스트</a></li> -->
					</ul>
					<span class="toggle"><i class="fas fa-bars"></i></span>		
				</nav>
				
			</div>			
		</header>
</body>
</html>