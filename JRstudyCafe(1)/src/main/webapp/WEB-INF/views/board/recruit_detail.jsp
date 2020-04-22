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
			<table class="table is-striped is-narrow is-hoverable">
				<caption>Review</caption>
				<tbody>
				<tr>
					<th>
						제목
					</th>
					<td>
						${rb.rb_name }
					</td>
				</tr>
				<tr>
					<th>
						조회수
					</th>
					<td>
						${rb.rb_hit }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						${rb.rb_content }
					</td>
				</tr>
				</tbody>
			</table>
		
			<table id="table_bottom">
			<tr>
				<td>
					<c:if test="${sessionScope.users.u_id eq rb.u_id }">
					<button onclick="location.href='${conPath }/rbModifyView.do?rb_no=${rb.rb_no }&pageNum=${pageNum }'" class="button is-link is-focused">글수정</button>
					<button class="button is-link is-focused" onclick='location.href="${conPath}/rbDelete.do?rb_no=${rb.rb_no}"'>글삭제</button>
					</c:if>
					<button onclick="location.href='${conPath }/recruitBoard.do?pageNum=${param.pageNum }'" class="button is-link is-focused">목록</button>
				</td>
			</tr>
			</table>
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
						<span>${rc.u_id}</span>
					</div>
					<div>
						<pre>${rc.c_content}</pre>
					</div>
					<div>
						<pre>${rc.c_rdate }</pre>
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