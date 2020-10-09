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
	<c:set var="tempRoomName" value=""/>
	<c:forEach items="${book_list}" var="book">
		<c:if test="${book.roomname!= tempRoomName}">
			<div><b>${book.roomname }</b> ${book.bk_date } &nbsp; / &nbsp;<b><fmt:formatDate value="${book.bk_stime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${book.bk_etime }" pattern="HH:mm"/></b>
			<div style="color: white; background-color: #ffb400; width: 20px; display: inline; font-size: 0.7em; border-radius: 2px; padding: 2px;" >예약중</div></div>
		</c:if>
		<c:if test="${book.roomname== tempRoomName}">
			<div> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;${book.bk_date } &nbsp; / &nbsp;<b><fmt:formatDate value="${book.bk_stime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${book.bk_etime }" pattern="HH:mm"/></b>
			<div style="color: white; background-color: #ffb400; width: 20px; display: inline; font-size: 0.7em; border-radius: 2px; padding: 2px;" >예약중</div></div>
		</c:if> 
		<c:set var="tempRoomName" value="${book.roomname }"/>	
	</c:forEach>
</body>
</html>