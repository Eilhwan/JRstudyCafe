<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty admin }">
	<script>
		alert('비정상적인 접근입니다.');
		history.back();
	</script>
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

.card {
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
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
	margin-top:50px;
}
</style>
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<form action="${conPath }/admin/studyroomModify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="r_no" value=${param.r_no }> 
	<div class="container">
		<table class="table">
			<tr>
				<th>방 이름</th>
				<th><input type="text" name="r_name" value="${room.r_name }"></th>
			</tr>
			<tr>
				<th>이미지</th>
				<th><input type="file" name="image" accept=".jpg, .png, .gif"></th>
			</tr>
			<tr>
				<th>최대인원</th>
				<td><input type="number" name="r_ppr" value="${room.r_ppr }"></td>
				<th>시간당 가격</th>
				<td><input type="number" name="r_pph" value="${room.r_pph }"></td>
			</tr>
			<tr>
				<th>옵션선택</th>
				<td>
					에어컨<select name="ro_air">
						<option value="0" <c:if test="${room.ro_air eq 0 }">selected="selected"</c:if>>없음</option>
						<option value="1" <c:if test="${room.ro_air eq 1 }">selected="selected"</c:if>>있음</option>
					</select>
				
					의자/테이블<select name="ro_chair">
						<option value="1" <c:if test="${room.ro_chair eq 0 }">selected="selected"</c:if>>목재</option>
						<option value="2" <c:if test="${room.ro_chair eq 1 }">selected="selected"</c:if>>쇼파</option>
						<option value="3" <c:if test="${room.ro_chair eq 2 }">selected="selected"</c:if>>독서실</option>
					</select>
				
					복사/인쇄<select name="ro_print">
						<option value="0" <c:if test="${room.ro_print eq 0 }">selected="selected"</c:if>>없음</option>
						<option value="1" <c:if test="${room.ro_print eq 1 }">selected="selected"</c:if>>흑백</option>
						<option value="2" <c:if test="${room.ro_print eq 2 }">selected="selected"</c:if>>컬러</option>
					</select>
				
					흡연여부<select name="ro_smoke">
								<option value="0" <c:if test="${room.ro_smoke eq 0 }">selected="selected"</c:if>>불가능</option>
								<option value="1" <c:if test="${room.ro_smoke eq 1 }">selected="selected"</c:if>>가능</option>
						</select>
				
					pc/노트북<select name="ro_pc">
								<option value="0" <c:if test="${room.ro_pc eq 0 }">selected="selected"</c:if>>없음</option>
								<option value="1" <c:if test="${room.ro_pc eq 1 }">selected="selected"</c:if>>있음</option>
						</select>
				
					TV/프로젝터<select name="ro_tv">
						<option value="0" <c:if test="${room.ro_tv eq 0 }">selected="selected"</c:if>>없음</option>
						<option value="1" <c:if test="${room.ro_tv eq 1 }">selected="selected"</c:if>>프로젝터</option>
					 	<option value="2" <c:if test="${room.ro_tv eq 2 }">selected="selected"</c:if>>TV</option>
						<option value="3" <c:if test="${room.ro_tv eq 3 }">selected="selected"</c:if>>TV/프로젝터</option>
					</select>
				
					인터넷/WI-FI<select name="ro_wifi">
						<option value="0" <c:if test="${room.ro_wifi eq 0 }">selected="selected"</c:if>>없음</option>
						<option value="1" <c:if test="${room.ro_wifi eq 1 }">selected="selected"</c:if>>WIFI ONLY</option>
						<option value="2" <c:if test="${room.ro_wifi eq 2 }">selected="selected"</c:if>>100M/유선랜</option>
						<option value="3" <c:if test="${room.ro_wifi eq 3 }">selected="selected"</c:if>>1G광랜</option>
					</select>
				
					화이트보드	<select name="ro_board">
								<option value="0" <c:if test="${room.ro_board eq 0 }">selected="selected"</c:if>>없음</option>
								<option value="1" <c:if test="${room.ro_board eq 1 }">selected="selected"</c:if>>있음</option>
						</select>
				</td>
			</tr>
			<tr><td colspan="3"><input type="submit" value="수정"></td></tr>
		</table>
	</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>