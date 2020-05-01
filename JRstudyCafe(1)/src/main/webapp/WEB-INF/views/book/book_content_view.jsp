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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
<script>
	$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';
</script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.min.css" />
<script src="${conPath }/js/script.js"></script>
<style>
* {
	text-align: center;
}

#content_wrap {
	height: 1000px;
}

.card {
	position: fixed;
	top: 240px;
	left: 30px;
	z-index: 99999;
	width:250px;
	border:1px solid lightgray;
}

caption {
	font-size: 1.8em;
	margin: 15px;
}

table {
	width: 1100px;
	margin: 10px auto;
}

table:not(#table_bottom) {
	border-bottom: 2px solid black;
	border-top: 2px solid black;
}

#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

#table_bottom tr td {
	text-align: right;
}

#table_bottom tr {
	height: 70px;
}

#table_bottom tr td input {
	margin-right: 5px;
	height: 35px;
}

#table_bottom tr td nav a {
	height: 25px;
}

#table_bottom tr td nav {
	width: 620px;
	margin-left: 480px;
}

#select_div {
	margin-top: 20px;
}

#select_div select {
	height: 25px;
}

input[type='submit'] {
	height: 25px;
}
.card footer p a, tbody tr td a {
	color:#998675;
}
.pagination-list b{
	background-color: #998675;
	border-color: #c7b299;
}
.book_step{
	width: 1200px;
	padding: 50px 0 40px 0;
	margin: auto;
}
.book_step ul {
    padding: 30px 0 0 0;
    list-style: none;
    overflow: hidden;
}
.book_step li {
	float: left;
	text-align: center;
    width: 5%;
    padding: 10px 0;
}
.book_step li b{
	font-weight: bold;
	font-size: 20px;
}
.book_step li span{
	font-size: 0.8em;
}
.book_step .step_off {
    background: #e2e2e2;
    color: #333;
    width: 30%;
}
.book_step .step_arrow {
    font-size: 20px;
    font-weight: bold;
    padding: 20px 0 0 0;
}
.book_step .step_ov {
    background: #ffb400;
    color: #333;
    width: 30%;
    border-style: dashed;
}
#998675
</style>
<script>
	$(document).ready(function(){
		var stime = Number(($('input[name="bk_stimeStr"]').val()).substring(0,2));
		alert(stime);
		var etime = Number(($('input[name="bk_etimeStr"]').val()).substring(0,2));
		alert(etime);
		var tt = etime - stime;
		var pph = ${roomdetail.r_pph };
		alert(pph);
		alert(tt);
		$('input[name="bk_tt"]').val(tt);
		var tp = pph*tt;
		alert(tp);
		$('input[name="bk_tp"]').val(tp);
	});
		</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<div class="book_step">
				<ul>
					<li class="step_off"><b>STEP1</b> <br><span>이용인원 및 날짜선택</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_ov"><b>STEP2</b> <br><span>선택사항 확인 및 예약</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_off"><b>예약완료</b> <br><span></span></li>
				</ul>
	</div>
		<form action="${conPath}/bookingfinal.do" method="post">
		<input type="hidden" name="u_id" value="${users.u_id }">
		<input type="hidden" name="u_name" value="${users.u_name }">
		<input type="hidden" name="r_no" value="${room.r_no }">	
		<input type="hidden" name="tempbk_stime" value="${bookList.bk_stime }">
		<input type="hidden" name="tempbk_etime" value="${bookList.bk_etime }">			
		<table class="table is-striped is-narrow is-hoverable">
			<caption>예약확인</caption>
			<tbody>
				<tr><th>예약자</th><td><input type="text" value="${users.u_name }" name="u_name" readonly="readonly"></td></tr>
				<tr><th>사용예약일자</th><td ><pre><input type="text" value="${bookList.bk_date }" name="bk_date" readonly="readonly"></pre></td></tr>
				<tr><th>선택하신 방</th><td ><pre><input type="text" value="${roomdetail.r_name }" name="r_name" readonly="readonly"></pre></td></tr>
				<tr><th>사용시작시간</th><td>
				<input type="text" value="<fmt:formatDate value='${bookList.bk_stime }' pattern='HH:mm'/>" id="bk_stimeStr" name="bk_stimeStr"  readonly="readonly">
				</td></tr>
				<tr><th>사용종료시간</th><td id="etime">
				<input type="text" value="<fmt:formatDate value='${bookList.bk_etime }' pattern='HH:mm'/>" id="bk_etimeStr" name="bk_etimeStr" readonly="readonly">
				</td></tr>
				<tr><th>총 사용예정시간</th><td><input type="text" name="bk_tt" id="bk_tt" readonly="readonly"></td></tr>
				<tr><th>총 결제금액</th><td><input type="text" name="bk_tp" id="bk_tp" readonly="readonly"></td></tr>
				<tr>
				
		    	<th>
		    		예약일자
		    	</th>
		    	<td> 
		    		<c:set var="bk_rdate" value="<%=new java.util.Date()%>" />
					<c:set var="sysYear"><fmt:formatDate value="${bk_rdate}" pattern="yyyy-MM-dd hh:mm" /></c:set>
					<c:out value="${sysYear}" />

		    	</td>
		    </tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input type="submit" value="예약확인"><input type="button" value="다시 예약하기"
    					onclick="location.href='${conPath}/bookingView.do'"> </td>
				</tr>
			</tfoot>
		</table>
		</form>
<!-- 		<table id="table_bottom"> -->
<%-- 		  <c:if test="${empty admin && not empty users}"> --%>
<!-- 			<tr> -->
<!-- 				<td><input type="button" value="예약확인" -->
<!-- 					id="booking" -->
<%-- 					onclick="location.href='${conPath}/bookingfinal.do?u_id=${u_id }&bk_tt=${tt }&bk_tp=${tp }'" --%>
<!-- 					class="button is-link is-focused"> -->
<!-- 					<input type="button" value="다시 예약하기" -->
<%-- 					onclick="location.href='${conPath}/bookingView.do'" --%>
<!-- 					class="button is-link is-focused"> -->
<!-- 			</tr> -->
<%-- 		 </c:if> --%>
<!-- 		</table> -->
	</div>	
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>