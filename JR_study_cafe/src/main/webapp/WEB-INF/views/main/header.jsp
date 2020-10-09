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
<script>
	function open_messanger (){
		window.open('${conPath}/MessangerList.do', '메시지 리스트', 'width=400, height=450')
		}
</script>
</head>
<body>
	<header> 
			<div id="mySidebar" class="sidebar">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
			  <a href="${conPath }/studygroupPage.do">My 스터디그룹</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/bookListView_past.do">스터디룸 예약이력</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/bookListView_present.do">스터디룸 예약현황</a>
			  <div class="line_div"></div>
			  <a href="${conPath }/modifyView.do">정보수정</a>
			  <div class="line_div"></div>
			  <a onclick="open_messanger()">메시지확인<c:if test="${not empty sessionScope.users }">(${msgcnt })</c:if></a>
			  
			</div>
			<div class="container clearfix">
				<h1 class="logo"><a href="${conPath }/main.do">JRstudy logo</a></h1>
				<nav class="clearfix">
					<ul class="main-menu">
						<li><a href="${conPath }/main.do">메인</a></li>
						<li><a href="${conPath }/introCafe.do">소개</a></li>
						<li><a href="${conPath }/infoCafe.do">이용안내</a></li>
						<li><a href="${conPath }/freeBoardList.do">자유게시판</a></li>
						<li><a href="${conPath }/reviewListView.do">사용후기</a></li>
						<li><a href="${conPath }/recruitBoard.do">스터디모집 게시판</a></li>
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
						<li><a class="openbtn" id="openbtn" onclick="openNav()">${users.u_nickname }의 스터디룸</a></li>
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