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
		<table class="table is-striped is-narrow is-hoverable">
			<caption>Review</caption>
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<th>작성자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<c:set var="iNum" value="${inversNum }"/>
			<tbody>
				<c:forEach items="${reviewList}" var="review">
					<tr>
						<td>
							${iNum }
						</td>
						<td>
							${review.rv_name}
						</td>
						<td>
							${review.rv_content}
						</td>
						<td>
							${review.rv_hit}
						</td>
						<td>
							${review.likecnt}
						</td>
					</tr>
					<c:set var="iNum" value="${iNum-1 }"/>
				</c:forEach>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td><input type="button" value="글쓰기"
					onclick="location.href='${conPath }/reviewWriteView.do'"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/Write_view.do'"
					class="button is-link is-focused"></td>
			</tr>
			<tr>
				<td>
					<nav class="pagination" role="navigation" aria-label="pagination">
						<c:if test="${paging.startPage>paging.blockSize }">
							<a class="pagination-previous" title="This is the first page"
									disabled href="${conPath }/reviewListView.do?pageNum=${paging.startPage-1}&schItem=${param.schItem}&schWord=${param.schWord}">Previous</a> 
						</c:if>
						<ul class="pagination-list">
						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }">
								 <li><b class="pagination-link"> ${i }</b></li> 
							</c:if>
							<c:if test="${paging.currentPage!=i }">
								<li> <a class="pagination-link" href="${conPath }/reviewListView.do?&pageNum=${i}&schItem=${param.schItem}&schWord=${param.schWord}"> ${i }</a> </li>
							</c:if>
						</c:forEach>
						</ul>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a class="pagination-next" href="${conPath }/reviewListView.do?&pageNum=${paging.endPage+1}&schItem=${param.schItem}&schWord=${param.schWord}">Next page</a> 
						</c:if>
					</nav>
				</td>
			</tr>
		</table>
		
			
		
		<div id="select_div">
			<form action="${conPath }/reviewListView.do">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem=='' }">selected="selected"</c:if>>검색조건</option>
					<option value="all"
						<c:if test="${param.schItem=='all' }">selected="selected"</c:if>>글제목+작성자</option>
					<option value="rv_name"
						<c:if test="${param.schItem=='rv_name' }">selected="selected"</c:if>>글제목</option>
					<option value="rv_content"
						<c:if test="${param.schItem=='rv_content' }">selected="selected"</c:if>>작성자</option>
				</select> <input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" class="button is-small">
			</form>
		</div>

	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>