<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
</head>
<body>
	<div id = "content">
	  <form action="${conPath }/modify.do" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="u_id" value="${users.u_id }">
	    <table>
	      <caption>회원정보 수정</caption>
	      <tr><th>아이디</th><td>${users.u_id }</td></tr>
	      <tr><th>비밀번호</th><td><input type="password" name="u_pw" value="${users.u_pw }"></td></tr>
	      <tr><th>닉네임</th><td><input type="text" name="u_nickname" value="${users.u_nickname }"></td></tr>
	      <tr><th>핸드폰</th><td><input type="tel" name="u_phone" value="${users.u_phone }"></td></tr>
	      <tr><th>전화번호</th><td><input type="tel" name="u_tel" value="${users.u_tel }"></td></tr>
	      <tr><th>이메일</th><td><input type="email" name="u_email" value="${users.u_email }"></td></tr>
	      <tr><th>주소</th><td><input type="text" id="sample4_roadAddress" name="u_addr" value="${users.u_addr }">
	      <input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소">
	      <span id="guide"></span></td></tr>
	      <tr><th>생일</th><td><input type="date" name="u_birth" value="${users.u_birth }"></td></tr>
	      <tr><th>프로필</th><td><input type="file" name="file" value="${users.u_image }"></td></tr>
	      <tr><td colspan="2">
	      <input type="submit" value="수정">
	      <input type="reset" value="다시입력">
	      <input type="button" value="뒤로가기" onclick="history.back()">
	      </td></tr>
	    </table>
	  </form>
	</div>
</body>
</html>