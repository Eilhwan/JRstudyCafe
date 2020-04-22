<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
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
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/main.css" />
<script src="${conPath }/js/script.js"></script>
<style>
#list_td {
	border: 2px double black;
}
.paging {text-align: center;}
.list_div {
	height:450px;
}
table {
	width:1000px;
	margin:10px auto;
}
caption{
	margin:20px;
	font-size: 1.5em;
	font-weight: bold;
}
#list_td p {
	text-align: center;
	font-size:1.2em;
}
</style>
</head>
<body>
	<c:if test="${not empty deleteResult }">
		<script>alert('${deleteResult}');</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div class="slider">
		<ul class="slider-list cycle-slideshow" data-cycle-fx="scrollHorz"
			data-cycle-timeout="0" data-cycle-slides="> li"
			data-cycle-prev=".slider .prev" data-cycle-next=".slider .next"
			data-cycle-pager=".pager">
			<li class="slide1">
				<div class="contents">
					<h3>THE PREMIUM STUDY CAFE</h3>
					<h1>JRstudy Cafe</h1>
					<p>제이알스터디카페는 여러분의 성공을 위하여 차별화된 시스템과 최적의 공간을 제공하고 있습니다. 보다 '더'
						집중할 수 있는 최고의 환경을 체험하세요.</p>
					<a href="" class="btn">스터디룸 보기</a>
				</div>

			</li>
			<li class="slide2">
				<div class="contents">
					<h3>THE PREMIUM STUDY CAFE</h3>
					<h1>JRstudy Cafe</h1>
					<p>제이알스터디카페는 여러분의 성공을 위하여 차별화된 시스템과 최적의 공간을 제공하고 있습니다. 보다 '더'
						집중할 수 있는 최고의 환경을 체험하세요.</p>
					<a href="" class="btn">스터디룸 보기</a>
				</div>
			</li>
		</ul>
		<p class="controls">
			<a href="" class="prev">prev</a> <a href="" class="next">prev</a>
		</p>
		<p class="pager clearfix"></p>

	</div>
	<div class="list_div">
	<table>
		<caption>관리자 리스트</caption>
		<tr>
			<c:forEach items="${admins }" var="admin">
				<td id="list_td">
					<p id="aId">${admin.a_id }<br>(${admin.a_name })</p>
					<c:if test="${admin.a_id != 'admin' }">
					<p><img src="${conPath }/images/관리자.png" alt="관리자사진"></p>
					<p><button class="button is-small is-fullwidth" onclick="location='${conPath}/admin/adminDelete.do?a_id=${admin.a_id }'">삭제하기</button></p>
					</c:if>
					<c:if test="${admin.a_id == 'admin' }">
					<p><img src="${conPath }/images/최고관리자.jpg" alt="최고관리자사진"></p>
					</c:if>
				</td>
			</c:forEach>
		</tr>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage>paging.blockSize }">
			[ <a href="${conPath }/admin/listAdmin.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentPage!=i }">
				[ <a href="${conPath }/admin/listAdmin.do?pageNum=${i}"> ${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/admin/listAdmin.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div>
	<c:if test="${not empty admin}">
		<ul>
			<li><a href="${conPath }/admin/adminEnrollView.do">관리자등록페이지가기</a></li>
			<li><a href="${conPath }/admin/listAdmin.do">관리자목록가기</a></li>
		</ul>
	</c:if>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>