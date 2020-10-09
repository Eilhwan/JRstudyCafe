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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$( function() {
		var stime = Number(($('#stime').val()).substring(0,2));
		alert(stime);
		var etime = Number(($('#etime').val()).substring(0,2));
		alert(etime);
		var tt = etime - stime;
		var pph = ${roomdetail.r_pph };
		$('#tt').val(tt);
		var tp = pph*tt;
		$('#tp').val(tp);
	});
</script>
</head>
<body>
	<form action="bookfinal.do" method="post">
	이름
	<input type="text" name="u_id" value="${users.u_id }" readonly="readonly">
	예약날짜
	<input type="text" name="bk_date" value="${bookList.bk_date }" readonly="readonly">
	<br>
	방번호
	<input type="text" name="r_no"  value="${bookList.r_no }" readonly="readonly">
	
	<br>
	<input type="hidden" name="bk_stime" value="${bookList.bk_stime }">
	<input type="hidden" name="bk_etime" value="${bookList.bk_etime }">
	시작시간
	<input type="text" id="stime"   value="<fmt:formatDate value="${bookList.bk_stime }" pattern="HH:mm"/>" readonly="readonly">
	<br>
	끝나는 시간
	<input type="text" id="etime"  value="<fmt:formatDate value="${bookList.bk_etime }" pattern="HH:mm"/>" readonly="readonly">
	<br>
	총시간
	<input id="tt" name="bk_tt" type="text" readonly="readonly">
	전체 가격
	<input id="tp" name="bk_tp" type="text" readonly="readonly">
	<input type="submit" value="예약하기">
	</form>
	<button id="booking">예약하기</button>
</body>
</html>