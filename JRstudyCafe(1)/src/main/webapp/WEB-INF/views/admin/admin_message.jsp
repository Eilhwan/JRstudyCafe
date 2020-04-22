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
<title>메시지 보내기</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/160');
    });
    $('#content').keyup();
});
</script>
</head>
<body>
	<form action="${conPath }/admin/adminMessagnerSend.do" method="post">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="m_title"></td>
		</tr>
		<tr>
			<th>수신자</th>
			<td><input type="text" name="m_reciever" readonly="readonly" value="${param.u_id }"></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea rows="20" cols="5" maxlength="160" id="content" name="m_content"></textarea> </td>
		</tr>
		<tr>

			<td><span id="counter">###</span></td>
			<td><input type="submit" value="메시지 전송"></td>
		</tr>
	</table>
	</form>
</body>
</html>