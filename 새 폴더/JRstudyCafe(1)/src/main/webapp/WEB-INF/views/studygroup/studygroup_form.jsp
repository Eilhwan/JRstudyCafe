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

<script src="${conPath }/js/script.js"></script>




</head>
<body>
	<form action="${conPath }/studygroupOpen.do" method="post" enctype="multipart/form-data">
	<h1>스터디 모임 개설</h1>
	<table>
		<tr>
			<td>
				<div id="image_result">
					<img id="thumbnail">
				</div>			
			</td>
			<td>
					<input type="file" name="img1" id="sg_img" accept="image/*" onchange="setThumbnail(event)">
			</td>
		</tr>
		<tr>
			<td>모임명</td>
			<td><input type="text" name="sg_name"></td>
		</tr>
		<tr>
			<td>모임분류</td>
			<td><select name="st_no">
				<option value="1">영어회화</option>
				<option value="2">컴퓨터</option>
			</select></td>
		</tr>
		<tr>
			<td>모임설명</td>
			<td><textarea rows="5" cols="20" name="sg_explain"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="신청하기"><input type="button" value="뒤로 가기"></td>
		</tr>
	</table>
	</form>
<script> 
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		var img = document.getElementById('thumbnail');
		reader.onload = function(event) { 
			img.setAttribute("src", event.target.result);
            document.querySelector("div#image_result").replaceChild(img); 
	  	};
		  	
		   reader.readAsDataURL(event.target.files[0]); } 
</script>
</body>
</html>