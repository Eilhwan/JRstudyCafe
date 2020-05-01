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
<script>
	$(document).ready(function() {

	});
	function trClicked(ab_no, writer) {
		location.href = '${conPath}/askContent.do?ab_no=' + ab_no + '&writer='
				+ writer;
	}
</script>
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
	width: 250px;
	border: 1px solid lightgray;
}

.left {
	text-align: left;
}

caption {
	font-size: 1.8em;
	margin: 15px;
}

table {
	width: 1100px;
	margin: 10px auto;
}

table
:not
 
(
#table_bottom
 
)
{
border-bottom
:
 
2
px
 
solid
 
black
;

	
border-top
:
 
2
px
 
solid
 
black
;


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
	color: #998675;
}

.pagination-list b {
	background-color: #998675;
	border-color: #c7b299;
}

.subtap2 {
	width: 1200px;
	margin: 0 auto;
}

.subtap2 ul {
	margin: 70px 0 30px 0;
	overflow: hidden;
	padding: 0;
}

.subtap2 .on {
	padding: 20px 0 0 0;
	border: 2px solid #ffb400;
	text-align: center;
	color: #333;
	width: 245px;
	height: 63px;
	font-weight: bold;
}

.subtap2 li {
	padding: 20px 0 0 0;
	color: #999999;
	font-size: 18px;
	float: left;
	border: 2px solid #d6d6d6;
	text-align: center;
	width: 245px;
	height: 63px;
}
#998675
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
		<div class="card">
			<div class="card-content">
				<p class="title">“토익스피킹, 오픽 스터디원 모집합니다 (~05/07)”</p>
				<p class="subtitle">* 팀장 닉네임</p>
			</div>
			<footer class="card-footer">
				<p class="card-footer-item">
					<span> Goto Profile <a href="#">닉네임</a>
					</span>
				</p>
				<p class="card-footer-item">
					<span> Share on <a href="#">Facebook</a>
					</span>
				</p>
			</footer>
		</div>
		<div class="subtap2">
			<ul>
				<li style="cursor: Pointer; width: 230px;" class=""><a
					href="${conPath }/bookListView_present.do"> 예약내역 </a></li>
				<li style="cursor: Pointer; width: 230px;" class="on"><a
					href="${conPath }/bookListView_past.do"> 과거이용내역 </a></li>
			</ul>
		</div>
		<table class="table is-striped is-narrow is-hoverable">

			<caption>예약이력</caption>
			<c:set var="oNum" value="${orderNum }" />
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<th>룸명</th>
					<th>사용일자</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>사용시간</th>
					<th>총 금액</th>
					<th>예약상태</th>
				</tr>
			</thead>

			<tbody>
				
					<c:if test="${not empty bookList_past }">	
					<c:forEach items="${bookList_past}" var="book">			
						<tr>
							<td>${oNum }</td>
							<td>${book.roomname}</td>
							<td>${book.bk_date}</td>
							<td>${book.bk_stime}</td>
							<td>${book.bk_etime}</td>
							<td>${book.bk_tt}</td>
							<td>${book.bk_tp}</td>
							<td><div
									style="color: white; background-color: gray; width: 20px; display: inline; font-size: 0.7em; border-radius: 2px; padding: 2px;">이용완료</div>
							</td>
						</tr>
						<c:set var="oNum" value="${oNum+1 }" />
						</c:forEach>
					</c:if>	
				
				<c:if test="${empty bookList_past }">
						<tr>
							<td colspan="8">예약내역이 없습니다.</td>
						</tr>
				</c:if>
			</tbody>
		</table>
		<table id="table_bottom">

			<tr>
				<td>
					<div class="paging">
						<nav class="pagination" role="navigation" aria-label="pagination">
							<c:if test="${paging.startPage>paging.blockSize }">
								<a class="pagination-previous" title="This is the first page"
									href="${conPath }/bookListView_past.do?pageNum=${paging.startPage-1}">Previous</a>
							</c:if>
							<c:if test="${paging.endPage<paging.pageCnt }">
								<a class="pagination-next"
									href="${conPath }/bookListView_past.do?pageNum=${paging.endPage+1}">Next
									page</a>
							</c:if>
							<ul class="pagination-list">
								<c:forEach var="i" begin="${paging.startPage }"
									end="${paging.endPage }">
									<c:if test="${paging.currentPage==i }">
										<a class="pagination-link is-current" aria-label="Page 1"
											aria-current="page">${i }</a>
									</c:if>
									<c:if test="${paging.currentPage!=i }">
										<a class="pagination-link" aria-label="Goto page 2"
											href="${conPath }/bookListView_past.do?pageNum=${i}">${i }</a>
									</c:if>
								</c:forEach>
							</ul>
						</nav>
					</div>
				</td>
			</tr>
		</table>





	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>