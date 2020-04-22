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
	<form action="${conPath }/studygroupOpen.do">
	<h1>스터디 모임 개설</h1>
	<table>
		<tr>
			<td>모임명</td>
			<td><input type="text" name="sg_name"></td>
		</tr>
		<tr>
			<td>모임분류</td>
			<td><select name="st_no">
				<option value="1">영어회화</option>
				<option value="2">컴퓨터</option>

			</select></td>
		</tr>
		<tr>
			<td>모임설명</td>
			<td><textarea rows="5" cols="20" name="sg_explain"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="신청하기"><input type="button" value="뒤로 가기"></td>
		</tr>
	</table>
	</form>
</body>
</html>