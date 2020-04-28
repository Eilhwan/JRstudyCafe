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
#998675
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
		<table class="table is-striped is-narrow is-hoverable">
			<caption>${detail.bk_no }번 예약확인</caption>
			<tbody>
				<tr><th>예약번호</th><td>${detail.bk_no }</td></tr>
				<tr><th>예약자</th><td>${subscriber }</td></tr>
				<tr><th>사용예약일자</th><td><pre>${detail.bk_date }</pre></td></tr>
				<tr><th>선택하신 방</th><td><pre>${roomname }</pre></td></tr>
				<tr><th>사용시간</th><td>${detail.bk_stime } ~ ${detail.bk_etime }</td></tr>
				<tr><th>총 사용예정시간</th><td>${detail.bk_tt }</td></tr>
				<tr><th>총 결제금액</th><td>${detail.bk_tp }</td></tr>
				<tr><th>예약일자</th><td>${detail.bk_rdate }</td></tr>
			</tbody>
		</table>
		<table id="table_bottom">
		  <c:if test="${empty admin && not empty users}">
			<tr>
				<td><input type="button" value="예약확인"
					onclick="location.href='${conPath }/askModifyView.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button" value="뒤로가기"
					onclick="location.href='${conPath }/askDelete.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		 </c:if>
		</table>
	</div>	
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>