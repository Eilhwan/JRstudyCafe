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
<style>
*{
	margin: 0;
	padding: 0;
}
ul{
	list-style: none;
}
a{
	text-decoration: none;
	color: black;
}
.login_wrap{
	max-width: 400px;
    margin: 0 auto;
    padding: 20px 0;
}
.users_title{
	margin-bottom: 20px;
    color: #000;
    font-size: 25px;
    font-weight: 500;
    text-align: center;
	
}
.tab_cnt{
	width:100%;
	padding-top: 18px;
    border-top: 4px solid #000;
}
.inpbx{
	width: 100%;
    height: 40px;
    border: 1px solid lightgray;
    margin-top: 10px;
    margin-bottom: 10px;
}
.inpbx input{
	box-sizing:border-box;
	display: block;
    width: 100%;
    height: 100%;
    font-size: 14px;
    border: none;
    outline: none;
    padding: 0 14px;
    font-size: 1.1em;
}
.insub{
	width: 100%;
    height: 60px;
    margin: 30px 0;
    background: #000;
    color: #fff;
    font-size: 16px;
    line-height: 60px;
    font-weight: 500;
    border: none;
}
.tab_cnt ul{
    display: flex;
    justify-content: center;
}
.tab_cnt ul li{
	position: relative;
    display: inline-block;
    padding: 0 20px;
}
.li1{
	border-right: 1px solid lightgray;
}
b{
	color: red;
}
#idConfirmResult, #pwChkResult, #pwResult{
	color: red;
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${conPath }/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#datepicker" ).datepicker(
	    		{	dateFormat : 'yy-mm-dd',
	    			changeMonth : true, //월 셀렉트박스
	    			changeYear : true,  //년도 셀렉트박스
					monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					showMonthAfterYear : true,
					yearSuffix : '년', // "2018년 7월"
					yearRange: "1900:true",
					showOtherMonths : true, // 다른 달도 화면에 출력
					dayNamesMin : ['일','월','화','수','목','금','토']
	    		}
	    	);
		} );
	$(document).ready(function(){
		 var idPattern = /^[a-zA-Z0-9]{4,12}$/;
	     var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
	     var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	     var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
			$('.u_id').keyup(function(){
				var u_id = $('.u_id').val();
				if(!idPattern.test($('.u_id').val())) {
					$('#idConfirmResult').html('아이디는 4~12자의 영문 대소문자와 숫자로만 입력');
				}else{
					$.ajax({
						url : '${conPath}/idConfirm.do',
						dataType : 'html',
						data : "u_id="+u_id,
						success : function(data){
							$('#idConfirmResult').html(data);
						}
					});
				}
			});
			$('.u_pw').keyup(function(){
				var u_pw = $('.u_pw').val();
				 if(!pwPattern.test($('.u_pw').val())){
					 $('#pwResult').html('비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력');
				 }else{
					 $('#pwResult').html('');
				 }		 
			});
			$('.u_pwChk').keyup(function(){
				var u_pw = $('.u_pw').val();
				var u_pwChk = $(this).val();
				if(u_pw == u_pwChk){
					$('#pwChkResult').html('');
				}else{
					$('#pwChkResult').html('비밀번호 불일치');
				}
			});
			
			$('form').submit(function(){
				 var idPattern = /^[a-zA-Z0-9]{4,12}$/;
			     var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
			     var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			     var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
			       if($('.u_id').val()==''){
			           alert("ID를 입력하세요");
			           $('.u_id').focus();
			           return false;
			       }
			       if(!idPattern.test($('.u_id').val())) {
			           alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력");
			           $('.u_id').focus();
			           return false;
			       }
			       if($('.u_pw').val()==''){
				       alert("비밀번호를 입력하세요");
				       $('.u_pw').focus();
				       return false;
				   }
			       if($('.u_pwChk').val()==''){
				       alert("비밀번호를 입력하세요");
				       $('.u_pwChk').focus();
				       return false;
				   }
			       if($('.u_pw').val()!=$('.u_pwChk').val()){
			    	   alert("비밀번호가 다릅니다.");
			    	   $('.u_pwChk').focus();
				       return false;
			       }
			       if(!pwPattern.test($('.u_pw').val())){
			    	   alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력 ");
			    	   $('.u_pw').focus();
				       return false;
			       }
			       if($('.u_name').val()==''){
				       alert("이름을 입력하세요");
				       return false;
				       $('.u_name').focus();
				   }
			       if($('.u_nickname').val()==''){
				       alert("닉네임 을 입력하세요");
				       $('.u_nickname').focus();
				       return false;
				   }
			       if($('.u_tel').val()==''){
				       alert("전화번호를 입력하세요");
				       return false;
				       $('.u_tel').focus();
				   }
			       if(!phonePattern.test($('.u_tel').val())){
			    	   alert("전화번호(-)빼고 입력 ");
			    	   $('.u_tel').focus();
				       return false;
			       }
				   
			       if($('.u_email').val()==''){
				       alert("e-mail 를 입력하세요");
				       $('.u_email').focus();
				       return false;
				   }
			       if(!emailPattern.test($('.u_email').val())){
			    	   alert("e-mail을 잘못입력하셨습니다 ");
			    	   $('.u_email').focus();
				       return false;
			       }
			       if($('.u_addr').val()==''){
				       alert("주소 를 입력하세요");
				       $('.u_addr').focus();
				       return false;
				   }
			       if($('#datepicker').val()==''){
				       alert("생일을 입력하세요");
				       $('#datepicker').focus();
				       return false;
				   }
			       
			});
	});
</script>	
</head>
<body>
	<div class="login_wrap">
    <h4 class="users_title">회원가입</h4>

    <div class="tab_cnt">
        <form action="${conPath }/join.do" method="post"  enctype="multipart/form-data">
        	<div>프로필 사진 <input type="file" name="file" class="u_img" ></div>
        	<br>
        	<div>아이디<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_id" class="u_id" placeholder="(4~12자의 영문 대소문자와 숫자로만 입력)">
    		</div>
    		<div id="idConfirmResult"></div>
    		<div>비밀번호<b>*</b></div>
            <div class="inpbx">
    			<input type="password" name="u_pw" class="u_pw" placeholder="(4~12자의 영문 대소문자와 숫자로만 입력)">
    		</div>
    		<div id="pwResult"></div>
    		<div class="inpbx">
    			<input type="password" name="u_pwChk" class="u_pwChk" placeholder="비밀번호 확인">
    		</div>
    		<div id="pwChkResult"></div>
    		<div>이름<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_name" class="u_name">
    		</div>
    		
    		<div>닉네임<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_nickname" class="u_nickname">
    		</div>
    		
    		<div>전화번호<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_tel" class="u_tel" >
    		</div>
    		
    		<div>비상연락</div>
            <div class="inpbx">
    			<input type="text" name="u_phone" class="u_phone" >
    		</div>
    		
    		<div>이메일<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_email" class="u_email" >
    		</div>
    		
    		<div style="display: inline;">주소<b>*</b></div> &nbsp;
    		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" >
            <div class="inpbx">
    			<input type="text" id="sample4_postcode" class="text_box"  placeholder="우편번호" readonly="readonly" style="width: 80%;">
				
    		</div>
    		<div class="inpbx">
    		<input type="text" id="sample4_roadAddress" name="u_addr" class="u_addr" placeholder="도로명주소" class="maddr">
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
    		</div>
    		<div>생일<b>*</b></div>
            <div class="inpbx">
    			<input type="text" name="u_birth" id="datepicker" >
    		</div>
    		<input type="submit" value="가입완료" class="insub">
        </form>
		</div>
	</div>
</body>
</html>