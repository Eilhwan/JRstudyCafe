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
	margin:0 auto 50px auto;
	text-align: right;
}
</style>
</head>
<script>
	$(document).ready(function() {
			$('#review_deleteBtn').click(function() {
				var confirmChk = confirm("정말 삭제 하시겠습니까?");
				if(confirmChk == true){
					location.href='${conPath }/reviewDelete.do?rv_no=${review_detail.rv_no }'
				}
			});
	});
			
</script>
<body>
	<c:if test="${not empty reviewDeleteResult }">
		<script>
		alert("${reviewDeleteResult }");
		</script>
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
		<table>
			<tr>
				<td><b>모집 | ${rb.rb_name }(<a href="${conPath }/userProfile.do?u_id=${rb.u_id}">${rb.u_id }</a>)</b>
				<div id="line_div"></div>
			</tr>
			<tr>
				<td><div id="content_div">${rb.rb_content }</div></td>
			</tr>
			<tr>
				<td><div>
						<ul>
							<li>댓글</li>
							<li>${cnt_rc }</li>
							<li>|</li>
							<li>조회수</li>
							<li>${rb.rb_hit }</li>
							
						</ul>
					</div></td>
			</tr>
		</table>
		<div id="bottom_div">
			<c:if test="${sessionScope.users.u_id eq rb.u_id }">
				<input type="button" value="수정"	 
					onclick="location.href='${conPath }/rbModifyView.do?rb_no=${rb.rb_no }&pageNum=${pageNum }'"
					class="button is-link is-focused">
				<input type="button" value="삭제"				
					onclick='location.href="${conPath}/rbDelete.do?rb_no=${rb.rb_no}"'
					class="button is-link is-focused">
			</c:if>
			<input type="button"
					value="목록" onclick="location.href='${conPath }/recruitBoard.do?pageNum=${param.pageNum }'"
					class="button is-link is-focused">
		</div>
	</div>
		<c:if test="${not empty users }">
		<div class="container">
			<form action="${conPath}/rcWrite.do" method="post">
			<input type="hidden" name="rb_no" value="${rb.rb_no }">
			<div>
				<div>
					<span>${sessionScope.users.u_nickname }</span>			
				</div>
				<div>
					<textarea rows="" cols="200" name="c_content" id="c_content"></textarea>
				</div>
				<div>
					<span id="counter"><strong>0/1000</strong></span>
				</div>
				<div>
					<button type="submit">댓글작성</button>
				</div>
			</div>
			</form>
		</div>
		</c:if>
			<div class="container">
				<c:forEach items="${rcs }" var="rc">
					<div>
						<span><a href='${conPath }/userProfile.do?u_id=${rc.u_id}'>${rc.u_id}</a></span>
					</div>
					<div>
						<pre>${rc.c_content}</pre>
					</div>
					<div>
						<pre>
							${rc.c_rdate }
							<c:if test="${rc.u_id eq users.u_id }">
								<button type="button" onclick="location.href='${conPath}/rcDelete.do?c_no=${rc.c_no }&rb_no=${param.rb_no }'">댓글삭제</button>
							</c:if>
						
						</pre>
					</div>
				</c:forEach>
			</div>

		<script>
$(function() {
    $('#c_content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/400');
    });
    $('#c_content').keyup();
});
</script>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>