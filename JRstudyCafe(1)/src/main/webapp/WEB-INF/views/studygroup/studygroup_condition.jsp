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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container text-center">
		<table width=960px align=center>
		     <tr>
		      <td align=center>
	          
	          <!--이용약관 테이블 시작-->
	          <table width=810>
	            <tr>
		              <td>
		                <div>
		                 <font color="#f67001" size=4>01</font> <font size=3>이용약관</font>
		                </div>
		             </td>
	           </tr>
	           <tr>
		             <td align=center>
		               <textarea name="tos" rows=15 cols=100>
		
		                </textarea>
		              </td>
	            </tr>
	            <tr>
		              <td>
		                <input type="checkbox">이용약관에 동의합니다.<br><br><br><br>
		              </td>
	            </tr>
	            <tr>
		              <td>
		                <div>
		                 <font color="#f67001" size=4>02</font> <font size=3>개인정보 수집 및 이용에 대한 안내</font>
		                </div>
		             </td>
	           </tr>
	           <tr>
		             <td align=center>
		               <textarea name="tos" rows=15 cols=100>
		                </textarea>
		              </td>
	            	</tr>
		            <tr>
			              <td>
				                <input type="checkbox">개인정보 수집 및 이용에 대한 안내에 동의합니다.
				              </td>
				            </tr>
			          </table>
			
			      </td>
			    </tr>
			</table>
			<br><br>
  <a href="#"> <button type = "button"  class="btn_order" id="btn_order" onclick="submit_form()" style="margin:10px;">그룹 개설</button></a>
  <a href="#"> <button type = "button"  class="btn_cancel" id="btn_cancel"style="margin:10px;">취 소 하 기</button></a>
	</div>
	<script>
		function submit_form(){
			var submit_btn = document.getElementById('btn_order');
				location.href='${conPath}/studygroupForm.do';
			}
	</script>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>