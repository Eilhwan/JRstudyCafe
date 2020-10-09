<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${conPath }/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
			$('.a_id').keyup(function(){
				var a_id = $('.a_id').val();
				$.ajax({
					url : '${conPath}/admin/adminIdConfirm.do',
					dataType : 'html',
					data : "a_id="+a_id,
					success : function(data){
							$('#idConfirmResult').html(data);
					}
				});
			});
			
			$('.a_pwChk').keyup(function(){
				var mPw = $('.a_pw').val();
				var mPwchk = $(this).val();
				if(mPw == mPwchk){
					$('#pwChkResult').html('비밀번호 일치');
				}else{
					$('#pwChkResult').html('비밀번호 불일치');
				}
			});
			
			$('form').submit(function(){
			   
			       if($('.a_id').val()==''){
			           alert("ID를 입력하세요");
			           $('.a_id').focus();
			           return false;
			       }
			       if($('.a_pw').val()==''){
				       alert("비밀번호를 입력하세요");
				       $('.a_pw').focus();
				       return false;
				   }
			       if($('.a_pwChk').val()==''){
				       alert("비밀번호를 입력하세요");
				       $('.a_pwChk').focus();
				       return false;
				   }
			       if($('.a_pw').val()!=$('.a_pwChk').val()){
			    	   alert("비밀번호가 다릅니다.");
			    	   $('.a_pwChk').focus();
				       return false;
			       }
			       if($('.a_name').val()==''){
				       alert("이름을 입력하세요");
				       return false;
				       $('.a_name').focus();
				   }
			       
			});
	});
</script>	
</head>
<body>
	<c:if test="${not empty insertResult }">
		<script>alert('${insertResult}');</script>
	</c:if>
	<div id ="wrap">
			<div class="join">
				<form action="${conPath }/admin/adminEnroll.do" method="post">
					<h3>관리자등록</h3>
					<hr>
					<br>
						<table>
							<tr>
								<th>
									<p class="info">기본정보</p>
								</th>
								<td>
									<p class="required"><b>*</b>필수 입력사항</p>
								</td>
							</tr>
							<tr>
								<th>
									아이디<b>*</b>
								</th>
								<td>
									<input type="text" name="a_id" class="a_id" >
									<span id="idConfirmResult"></span>
								</td>

							</tr>
							<tr>
								<th>
									비밀번호<b>*</b>
								</th>
								<td>
									<input type="password" name="a_pw" class="a_pw">
								</td>
							</tr>
							<tr>
								<th>
									비밀번호 확인<b>*</b>
								</th>
								<td>
									<input type="password" name="a_pwChk" class="a_pwChk">
									<span id="pwChkResult"></span>
								</td>
							</tr>
							<tr>
								<th>
									이름<b>*</b>
								</th>
								<td>
									<input type="text" name="a_name" class="a_name">
								</td>
							</tr>
						</table>
						<br>
						<br>
						<br>
						<br>
						<p class="subtn">
							<input type="submit" value="관리자등록" class="joinbtn">
							&nbsp;
							<input type="button" value="메인으로" class="resetbtn"
								onclick="location.href='${conPath}/main.do'"
							>
						</p>			
				</form>
			</div>
		</div>
</body>
</html>