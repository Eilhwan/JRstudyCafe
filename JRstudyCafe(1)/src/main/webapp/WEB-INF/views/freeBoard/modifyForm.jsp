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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('fb_content', {
			filebrowserUploadUrl : '${conPath }/freeFileupload.do'
		});
	});
</script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<script src="${conPath }/js/script.js"></script>
<style>

#content_wrap {
	height: 800px;
}
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
caption {
	font-size: 1.9em;
	margin: 50px 25px 25px 25px;
}
table {
	width: 1100px;
	margin: 10px auto;
}
table:not(#table_bottom) {
	border:1px solid gray;
}
#write_area {
	height:300px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
		<form action="${conPath }/freeBoardModify.do"  method="post" enctype="multipart/form-data">
		<input type="hidden" value="${modifyView.fb_no }" name="fb_no">
		<table class="table is-striped is-narrow is-hoverable">
			<caption>수정하기</caption>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="${modifyView.writer }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="fb_name" value="${modifyView.fb_name }"></td>
				</tr>
				<tr id="write_area">
					<th>본문</th>
					<td><textarea rows="5" cols="30" name="fb_content">${modifyView.fb_content }</textarea>
				</tr>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td><input type="submit" value="수정하기"
					class="button is-link is-focused">
					<input type="button"
					value="목록" onclick="location.href='${conPath }/freeBoardList.do'"
					class="button is-link is-focused"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>