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

</style>

<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('rv_content', {
			filebrowserUploadUrl : '${conPath }/reviewWriteFileupload.do'
		});
	});
</script>
<script>
	$(document).ready(function() {
			$('#bfile').change(function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop()
							.split('\\').pop();
				}
				$(this).siblings('.bfile').val(filename);
			});	

			$('form').submit(function(){
				 if($('.rv_name').val()==''){
			           alert("제목입력 필수");
			           $('.rv_name').focus();
			           return false;
			       }
				 if($('.rv_content').val()==''){
			           alert("본문입력 필수");
			           $('.rv_content').focus();
			           return false;
			       }
			
			});
		});
			
</script>

</head>
<body>
	<c:if test="${not empty reviewWriteResult }">
		alert('${reviewWriteResult }');
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<form action="${conPath }/reviewModify.do"  method="post" enctype="multipart/form-data">
		<input type="hidden" name="rv_no" value="${review_modify.rv_no }"> 	
		<table class="table is-striped is-narrow is-hoverable">
			<caption>${review_modify.rv_no }글수정</caption>
			<tbody>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="rv_name" class="rv_name" value="${review_modify.rv_name }"></td>
				</tr>
				<tr id="write_area">
					<th>본문</th>
					<td>
						<textarea rows="5" cols="30" name="rv_content" class="rv_content">${review_modify.rv_content }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td>
					<input type="submit" value="글수정" class="button is-link is-focused">
					<input type="button" value="목록" onclick="location.href='${conPath }/reviewListView.do'"
					class="button is-link is-focused"></td>
			</tr>
		</table>
	</form>
	</div>	
			
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>