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
	function trClicked(ab_no) {
		location.href = '${conPath}/askContent.do?ab_no=' + ab_no;
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

caption {
	font-size: 1.8em;
	margin: 15px;
}

table {
	width: 1100px;
	margin: 10px auto;
}

table:not (#table_bottom ) {
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
	color: #998675;
}

.pagination-list b {
	background-color: #998675;
	border-color: #c7b299;
}
#998675
</style>
</head>
<body>
    <c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult==SUCCESS }">
		<script>alert('글쓰기 성공');</script>
	</c:if>
	<c:if test="${writeResult==FAIL }">
		<script>alert('글쓰기 실패');</script>
	</c:if>
	<c:if test="${modifyResult==SUCCESS }">
		<script>alert('글수정 성공');</script>
	</c:if>
	<c:if test="${modifyResult==FAIL }">
		<script>alert('글수정 실패');</script>
	</c:if>
	<c:if test="${askboard.ab_status==FAIL }">
		<script>alert('글삭제 성공');</script>
	</c:if>
	<c:if test="${askboard.ab_status==SUCCESS }">
		<script>alert('글삭제 실패');</script>
	</c:if>
	<c:if test="${replyResult==SUCCESS }">
		<script>alert('답변달기 성공');</script>
	</c:if>
	<c:if test="${replyResult==FAIL }">
		<script>alert('답변달기 실패');</script>
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
			<caption>문의 / 질문 게시판</caption>
			<c:set var="iNum" value="${inverseNum }"/>
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<td>역순</td>
					<th>작성자</th>
					<th>글제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
				<tbody>
					<c:forEach items="${askList}" var="askboard">
					  <c:if test="${not empty sessionScope.admin || (users.u_name eq askboard.writer  && not empty sessionScope.users)}">
						<tr onclick="trClicked('${askboard.ab_no}')">
							<td>${askboard.ab_no}</td>
							<td>${iNum }</td>
							<td>${askboard.writer}</td>
							<td class="left">
							        <c:forEach var="i" begin="1" end="${ab_indent }">
									<c:if test="${i==ab_indent }">
  								└─
  							</c:if>
									<c:if test="${i!=ab_indent }">
  								&nbsp; &nbsp; &nbsp;
  							</c:if>
								</c:forEach> ${askboard.ab_name}</td>
							<td><fmt:formatDate value="${askboard.ab_rdate}"
									pattern="yy/MM/dd" /></td>
							<td>${askboard.ab_hit}</td>
						</tr>
					  </c:if>
					  <c:if test="${empty sessionScope.admin && (users.u_name ne askboard.writer  || empty sessionScope.users)}">
					    <tr>
						    <td>${askboard.ab_no}</td>
						    <td colspan="4">비밀글입니다</td>
				    	</tr>
				      </c:if>
				      <c:set var="iNum" value="${iNum-1 }"/>
					</c:forEach>
				</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td><input type="button" value="글쓰기"
					onclick="location.href='${conPath }/askWriteView.do?u_id=${users.u_id }&u_name=${users.u_name }'"
					class="button is-link is-focused"> <input type="button"
					value="목록" onclick="location.href='${conPath }/askListView.do'"
					class="button is-link is-focused"></td>
			</tr>
			<tr>
				<td>
					<div class="paging">
						<nav class="pagination" role="navigation" aria-label="pagination">
							<c:if test="${paging.startPage>paging.blockSize }">
								<a class="pagination-previous" title="This is the first page"
									href="${conPath }/askListView.do?pageNum=${paging.startPage-1}">Previous</a>
							</c:if>
							<c:if test="${paging.endPage<paging.pageCnt }">
								<a class="pagination-next"
									href="${conPath }/askListView.do?pageNum=${paging.endPage+1}">Next
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
											href="${conPath }/askListView.do?pageNum=${i}">${i }</a>
									</c:if>
								</c:forEach>
							</ul>
						</nav>
					</div>
				</td>
			</tr>
		</table>



		<div id="select_div">
			<form action="${conPath }/askListView.do">
				<input type="hidden" name="method" value="list"> <select
					name="schItem">
					<option value=""
						<c:if test="${param.schItem=='' }">selected="selected"</c:if>>검색조건</option>
					<option value="all"
						<c:if test="${param.schItem=='all' }">selected="selected"</c:if>>글내용+글제목</option>
					<option value="ab_name"
						<c:if test="${param.schItem=='ab_name' }">selected="selected"</c:if>>글제목</option>
					<option value="ab_content"
						<c:if test="${param.schItem=='ab_content' }">selected="selected"</c:if>>글내용</option>
				</select> <input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" class="button is-small">
			</form>
		</div>

	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>