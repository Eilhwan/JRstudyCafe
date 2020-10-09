<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<c:if test="${not empty sessionScope.admin || not empty sessionScope.users }">
	<script>
		alert('로그아웃 후에 이용해주세요.');
	</script>	
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${conPath }/css/bulma.css">
<script>
	$(function() {

	});
</script>
</head>
<body>
	<form action="${conPath }/admin/adminLogin.do" method="post">
	<div class="container">
		<h1 class="title">관리자 로그인</h1>
		<div class="field">
			<label class="label">아이디</label>
			<div class="control">
				<input class="input" type="text" placeholder="Id" name="a_id">
			</div>
		</div>

		<div class="field">
			<label class="label">비밀번호</label>
			<div class="control">
				<input class="input" type="password" placeholder="Password" name="a_pw">
			</div>
		</div>

		<div class="field is-grouped">
			<div class="control">
				<button class="button is-link">Login</button>
			</div>
		</div>
	</div>
	</form>
</body>
</html>