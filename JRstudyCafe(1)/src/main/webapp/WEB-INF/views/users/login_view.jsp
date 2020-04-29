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
	<c:if test="${not empty result }">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<form action="${conPath }/login.do" method="post">
		<table>
			<caption>로그인 화면</caption>
			<tr>
				<th>
					아이디
				</th>
				<td>
					<input type="text" name="u_id" required="required" value="${u_id }">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
			<td>
				<input type="text" name="u_pw" required="required" value="${u_pw }">
			</td>
			</tr>
			<tr><td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" onclick="location.href='${conPath}/joinView.do'" value="회원가입">
			</td></tr>
		</table>
		<ul>
		  <li><a href="${conPath }/idfindView.do">ID찾기</a></li>
		  <li><a href="${conPath }/pwfindView.do">비밀번호찾기</a></li>
		</ul>
	</form>
</body>
</html>