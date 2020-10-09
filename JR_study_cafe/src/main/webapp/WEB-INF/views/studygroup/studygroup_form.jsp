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
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<script src="${conPath }/js/script.js"></script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

.card-image {
	width: 1000px;
	height: 500px;
	background-image: url('images/프로필.gif');
	position: relative;
}

#card_button {
	position: absolute;
	bottom: 0;
	right: 30px;
	margin: 20px;
}

.media-left figure img {
	border-radius: 50px;
}

.message {
	margin-top: 50px;
}
.td-btn{
	text-align: center;
}
.td-btn nth:first-child {
	margin-left: 10px;
}
</style>
<script src="https://kit.fontawesome.com/922bc593e5.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container text-center">
		<form action="${conPath }/studygroupOpen.do" method="post"
			enctype="multipart/form-data">
			<h1 class="is-large">스터디 모임 개설</h1>
			<table class="table is-fullwidth">
				<tr>
					<td>
						<div id="image_result">
							<img id="thumbnail" width="500" height="300">
						</div>
					</td>
					<td>

						<div class="file">
							<label class="file-label"> <input type="file"
								class="file-input" name="img1" id="sg_img" accept="image/*"
								onchange="setThumbnail(event)"> <span class="file-cta">
									<span class="file-icon"> <i class="fas fa-upload"></i>
								</span> <span class="file-label"> Choose a file… </span>
							</span>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>모임명</td>
					<td><input type="text" name="sg_name" class="input is-medium"></td>
				</tr>
				<tr>
					<td>모임분류</td>
					<td>
						<div class="select">
							<select name="st_no">
								<option value="1">영어회화</option>
								<option value="2">컴퓨터</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>모임설명</td>
					<td><textarea rows="5" cols="20" name="sg_explain"
							class="textarea" style="resize: none"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="td-btn" style="text-align: center"><input type="submit"
						value="신청하기" class="button is-dark" style="margin-right: 10px;"><input type="button"
						value="뒤로 가기" class="button is-dark"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			var img = document.getElementById('thumbnail');
			reader.onload = function(event) {
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_result").replaceChild(img);
				$('#thumbnail').width('300px');
			};

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
</body>
</html>