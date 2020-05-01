<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="${conPath }/css/bulma.css">

</head>
<body>
<c:if test="${not empty resultmsg}">
		<div class="notification is-primary is-light">
	        <button class="delete"></button>
	        ${resultmsg }
      </div>
</c:if>
      <script>
            document.addEventListener('DOMContentLoaded', () => {
            (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
                $notification = $delete.parentNode;

                $delete.addEventListener('click', () => {
                $notification.parentNode.removeChild($notification);
                });
            });
            });
      </script>
	<form action="${conPath }/userMessagnerSend.do" method="post">
	<table class="table is-fullwidth">
		<tr>
			<th>제목</th>
			<td><input type="text" name="m_title" class="input"></td>
		</tr>
		<tr>
			<th>수신자</th>
			<td><input type="text" name="m_reciever" value="${param.u_id }" class="input"></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea rows="20" cols="5" maxlength="160" id="content" name="m_content" class="textarea" style="resize: none; overflow: scroll;"></textarea> </td>
		</tr>
		<tr>

			<td><span id="counter">###</span></td>
			<td class="btn-wrap"><input type="submit" value="메시지 전송" class="button is-dark"></td>
		</tr>
	</table>
	</form>
</body>
</html>