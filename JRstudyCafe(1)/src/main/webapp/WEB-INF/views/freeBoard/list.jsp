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
	left: 50px;
	z-index: 99999;
	width:250px;
	border:1px solid lightgray;
}

caption {
	font-size: 1.9em;
	margin: 50px 25px 25px 25px;
}

table {
	width: 950px;
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
	margin-right: 120px;
	height: 37px;
}

table tr:hover {
	cursor: pointer;
}
#table_bottom tr td nav a {
	height: 25px;
}

#table_bottom tr td nav {
	width: 620px;
	margin-left: 480px;
}

#search_area {
	text-align: left;
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
.pagination-list li:first-child a{
	background-color: #998675;
	border-color: #c7b299;
}
.paging {
	margin-right: 95px;
}
b {
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {

	});
	function trClicked(fb_no){
		location.href='${conPath}/freeBoardDetail.do?fb_no='+fb_no+'&u_id=${users.u_id}';
	}
	function btnClicked() {
		alert('로그인 후 이용가능합니다!');
	}
</script>
</head>
<body>
	<c:if test="${not empty freeBoardDeleteResult }">
		<script>alert('${freeBoardDeleteResult}');</script>
	</c:if>
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
			<caption>자유게시판</caption>
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<th>작성자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${freeBoardList }" var="free">
					<tr onclick="trClicked('${free.fb_no}')">
						<td>${free.fb_no}</td>
						<td>${free.writer}</td>
						<td>
						<c:if test="${free.fb_status==-1}">
							<img src="${conPath }/images/공지사항.png" alt="공지사항" width="22"/> <b>${free.fb_name}</b>
						</c:if>
						<c:if test="${free.fb_status==1}">
							${free.fb_name}
						</c:if>
						<c:if test="${free.likecnt > 9}">
							<img src="${conPath }/images/best.png" alt="베스트 글" width="20" id="bestIcon"/>
						</c:if>
						</td>
						<td>${free.fb_hit}</td>
						<td>${free.likecnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="select_div">
			<form action="${conPath }/freeBoardList.do">
				<input type="hidden" name="method" value="list"> <select
					name="schItem">
					<option value=""
						<c:if test="${param.schItem=='' }">selected="selected"</c:if>>검색조건</option>
					<option value="fb_namecontent"
						<c:if test="${param.schItem=='fb_namecontent' }">selected="selected"</c:if>>글제목+글내용</option>
					<option value="fb_content"
						<c:if test="${param.schItem=='fb_content' }">selected="selected"</c:if>>글내용</option>
					<option value="fb_name"
						<c:if test="${param.schItem=='fb_name' }">selected="selected"</c:if>>글제목</option>
					<option value="fb_writer"
						<c:if test="${param.schItem=='fb_writer' }">selected="selected"</c:if>>작성자</option>
				</select> <input type="text" name="schWord" value="${param.schWord }" id="search_area">
				<input type="submit" value="검색" class="button is-small">
			</form>
		</div>
		<table id="table_bottom">
			<tr>
				<td><input type="button" value="글쓰기"
					<c:if test="${not empty sessionScope.users && empty sessionScope.admin}">
					onclick="location.href='${conPath }/freeBoardUsersWriteView.do?u_nickname=${users.u_nickname }&u_id=${users.u_id }'"
					</c:if>
					<c:if test="${empty sessionScope.users && not empty sessionScope.admin}">
					onclick="location.href='${conPath }/freeBoardAdminWriteView.do?a_id=${admin.a_id }&a_name=${admin.a_name }'"
					</c:if>
					<c:if test="${empty sessionScope.users && empty sessionScope.admin}">
					onclick="btnClicked()"
					</c:if>
					class="button is-link is-focused"></td>
			</tr>
			<tr>
				<td>
					<div class="paging">
					<nav class="pagination" role="navigation" aria-label="pagination">
					<c:if test="${paging.startPage>paging.blockSize }">
						<a class="pagination-previous" title="This is the first page"
							 href="${conPath }/freeBoardList.do?pageNum=${paging.startPage-1}">Previous</a>
					</c:if>
					<c:if test="${paging.endPage<paging.pageCnt }">
							 <a class="pagination-next" href="${conPath }/freeBoardList.do?pageNum=${paging.endPage+1}">Next page</a>
					</c:if>
					<ul class="pagination-list">				
					<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }">
							<a class="pagination-link is-current"
								aria-label="Page 1" aria-current="page">${i }</a>
						</c:if>
						<c:if test="${paging.currentPage!=i }">
							<a class="pagination-link" aria-label="Goto page 2" href="${conPath }/freeBoardList.do?pageNum=${i}">${i }</a>
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