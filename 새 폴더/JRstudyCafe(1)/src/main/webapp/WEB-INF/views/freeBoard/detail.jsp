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
<script>
	$(document).ready(function() {

	});
	function likeClicked() {
		alert('이미 좋아요를 누르셨습니다');
	}
</script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

.card {
	position: fixed;
	top: 240px;
	left: 50px;
	z-index: 99999;
	width: 250px;
	border: 1px solid lightgray;
}

.card footer p a, tbody tr td a {
	color: #998675;
}

table {
	width: 950px;
	border: 1px solid gray;
	margin: 50px auto;
}

table td {
	padding: 20px;
}

table ul {
	overflow: hidden;
}

table ul li {
	float: left;
	padding-right: 15px;
}

#line_div {
	border-bottom: 1px dashed gray;
	width: 970px;
	box-sizing: border;
	margin: 10px 0;
}

#bottom_div {
	width: 970px;
	margin: 0 auto;
}

#content_div {
	text-align: left;
	padding: 10px;
}

b {
	font-weight: bold;
}

#bottom_div {
	width: 970px;
	margin: 0 auto 50px auto;
	text-align: right;
}
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
		<table>
			<tr>
				<td><b>${detail.fb_name }</b> | <c:if
						test="${detail.fb_status==-1}">
						<b>전체 공지사항</b>
					</c:if> <c:if test="${detail.fb_status==1}">
						<b>자유 게시판</b>
					</c:if>
					<div id="line_div"></div>
					<div>
						<img src="${conPath }/images/profile.png" alt="공지사항" width="22" />
						${detail.writer }
						<c:if test="${detail.fb_status==-1}"> (관리자) </c:if>
						<c:if test="${detail.fb_status==1}"> (이용자) </c:if>
					</div></td>
			</tr>
			<tr>
				<td><div id="content_div">${detail.fb_content }</div></td>
			</tr>
			<tr>
				<td><div>
						<ul>
							<li>댓글</li>
							<li>3</li>
							<li>|</li>
							<li>조회수</li>
							<li>${detail.fb_hit }</li>
							<li>|</li>
							<li>좋아요</li>
							<li>${detail.likecnt }</li>
							<c:if test="${not empty sessionScope.users }">
								<li><input type="button" value="♥"
										<c:if test="${freeLikesCnt != 0}">
											onclick="likeClicked();"
										</c:if>
										<c:if test="${freeLikesCnt == 0}">
											onclick="location.href='${conPath }/likeUp.do?u_id=${users.u_id }&fb_no=${detail.fb_no }'"
										</c:if>
									>
								</li>
							</c:if>
						</ul>
					</div></td>
			</tr>
		</table>
		<div id="bottom_div">
			<c:if
				test="${not empty sessionScope.admin or detail.writer eq users.u_nickname}">
				<input type="button" value="수정"
					onclick="location.href='${conPath }/freeBoardModifyView.do?fb_no=${detail.fb_no }'"
					class="button is-link is-focused">
				<input type="button" value="삭제"
					onclick="location.href='${conPath }/freeBoardDelete.do?fb_no=${detail.fb_no }'"
					class="button is-link is-focused">
			</c:if>
			<input type="button" value="목록"
				onclick="location.href='${conPath }/freeBoardList.do'"
				class="button is-link is-focused">
		</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>