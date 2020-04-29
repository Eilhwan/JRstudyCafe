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
			<caption>${content.ab_no }번 문의글 보기</caption>
			<tbody>
				<tr><th>작성자</th><td>${writer }</td></tr>
				<tr><th>제 목</th><td>${content.ab_name }</td></tr>
				<tr><th>문의내용</th><td><pre>${content.ab_content }</pre></td></tr>
				<tr><th>작성일</th><td><fmt:formatDate value="${content.ab_rdate }" pattern="MM/dd(E)"/>
				<tr><th>조회수</th><td>${content.ab_hit }</td></tr>
				<tr><th>그룹</th><td>${content.ab_group }</td></tr>
			</tbody>
		</table>
		<table id="table_bottom">
		  <c:if test="${empty admin && not empty users}">
			<tr>
				<td><input type="button" value="수정하기"
					onclick="location.href='${conPath }/askModifyView.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button" value="글 지우기"
					onclick="location.href='${conPath }/askDelete.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		 </c:if>
		 <c:if test="${not empty admin}">
		    <tr>
				<td><input type="button" value="답변하기"
					onclick="location.href='${conPath }/askReplyView.do?ab_no=${content.ab_no }'"
					class="button is-link is-focused">
					<input type="button" value="글 지우기"
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