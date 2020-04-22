<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 읽기</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<td>${message.m_title }</td>
		</tr>
		<tr>
			<th>수신자</th>
			<td>${message.m_sender }</td>
		</tr>
		<tr>
			<th>본문</th>
			<td>${message.m_content }</td>
		</tr>
		<tr>
			<td><input type="button" value="삭제" onclick="location.href='${conPath}/messageDelete.do?checked=${param.m_no }'"></td>
		</tr>
	</table>
	
</body>
</html>