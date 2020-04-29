<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty admin }">
	<script>
		alert('비정상적인 접근입니다.');
		history.back();
	</script>
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
<script>
	$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';
</script>

<script src="${conPath }/js/script.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
</style>
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.min.css" />
</head>
<body>

	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container">
	<ul>
		<li><a href="${conPath }/admin/studyroomList.do">스터디룸 리스트 페이지로</a></li>
		
	</ul>
	<table class="table">
		<tr>
			<th>아이디</th><th>이름</th><th>별명</th><th>전화번호</th><th>이메일</th><th>주소</th>
		</tr>
		<c:if test="${empty users }">
			<tr><th colspan="6">등록된 회원이 존재하지 않습니다.</th></tr>
		</c:if>
		<c:if test="${not empty users }">
			<c:forEach items="${users }" var="user">
				<tr>
					<th><a href="${conPath }/admin/userProfile.do?u_id=${user.u_id}">${user.u_id }</a></th>
					<th>${user.u_name }</th>
					<th>${user.u_nickname }</th>
					<th>${user.u_tel }</th>
					<th>${user.u_email }</th>
					<th>${user.u_addr }</th>			
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td class="text-center">
			<form action="${conPath }/admin/searchUser.do">
				<select name="key">
					<option value="u_id">ID</option>
					<option value="u_name">이름</option>
					<option value="u_tel">휴대폰</option>
					<option value="u_email">메일</option>
				</select><input type="text" name="keyword">
				<input type="submit" value="검색">
			</form>
			</td>
		</tr>
	</table>
	</div>
	<div class="paging">
		<c:if test="${paging.currentPage > paging.startPage } ">
			<a>[이전]</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:if test="${i eq paging.currentPage }">
				<b>${i }</b>
			</c:if>
			<c:if test="${i ne paging.currentPage }">
				<a href="${conPath }/admin/listUser.do?pageNum=${i}">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage eq paging.pageCnt } ">
			<a>[다음]</a>
		</c:if>	
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>