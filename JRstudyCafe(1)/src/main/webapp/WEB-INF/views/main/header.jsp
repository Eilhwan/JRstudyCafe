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
<link rel="stylesheet" href="${conPath }/css/listSlide.css">
</head>
<body>
	<header> 
			<div id="mySidebar" class="sidebar">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
			  <a href="${conPath }/studygroupCondition.do">스터디그룹 개설</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/bookListView_past.do">스터디룸 예약이력</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/bookListView_present.do">스터디룸 예약현황</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/modifyView.do">정보수정</a>
			  
			</div>
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
						<li><a href="${conPath }/bookingView.do">스터디룸 예약</a></li>
						<li><a href="${conPath }/askListView.do">Q&A</a></li>
					</ul>
					<ul class="user-menu">
						<!-- 사용자 로그인 상태일때 -->
						<c:if test="${empty sessionScope.users && empty sessionScope.admin}">
						<li><a href="${conPath }/loginView.do">로그인</a></li>
						<li>&nbsp;</li>
						<li><a href="${conPath }/joinView.do">회원가입</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.users}">
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<li>&nbsp;</li>
						<li><a class="openbtn" id="openbtn" onclick="openNav()">내 스터디룸</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.admin }">
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<li><a href="${conPath }/admin/listUser.do">이용자 관리</a></li> 
						<li><a href="${conPath }/admin/studyroomList.do">스터디룸 관리</a></li> 
						</c:if>
					</ul>
					<span class="toggle"><i class="fas fa-bars"></i></span>		
				</nav>
				
			</div>			
		</header>
		<script>
			function openNav() {
			  document.getElementById("mySidebar").style.width = "250px";
			  document.getElementById("main").style.marginRight = "250px";
			  document.getElememtById("openbtn").setAttribute('class', 'closebtn');
			}
			
			function closeNav() {
			  document.getElementById("mySidebar").style.width = "0";
			  document.getElementById("main").style.marginRight= "0";
			  document.getElememtById("openbtn").setAttribute('class', 'openbtn');
			}
		</script>
</body>
</html>