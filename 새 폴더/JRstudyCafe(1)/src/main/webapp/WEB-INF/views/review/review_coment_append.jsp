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
	<c:if test="${empty noMore }">
		<c:forEach items="${appendList}" var="coment_list">
			<div id="${coment_list.c_no }">
			${coment_list.u_nickname }님
			<br>
			${coment_list.c_content }
			<br>
			작성일${coment_list.c_rdate}
			<br>
			<c:if test="${users.u_id eq coment_list.u_id }">
			<a id="reviewcoment_modify" type="button" data-rno="${coment_list.c_no}">수정</a>						    											    				
			<button id="reviewcoment_delete" type="button" data-rno="${coment_list.c_no}">삭제</button>	
			</c:if>
			</div>
		</c:forEach>
		<input type="hidden" name="pageNum" class="pageNum" value="${param.pageNum }">
	</c:if>
</body>
</html>