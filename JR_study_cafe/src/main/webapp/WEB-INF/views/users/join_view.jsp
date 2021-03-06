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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${conPath }/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					showMonthAferYear : true,
					yearSuffix : "년", //2020년 3월
					showOtherMonths : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
				});
	});
	$(document)
			.ready(
					function() {
						$('.u_id').keyup(function() {
							var u_id = $('.u_id').val();
							$.ajax({
								url : '${conPath}/idConfirm.do',
								dataType : 'html',
								data : "u_id=" + u_id,
								success : function(data) {
									$('#idConfirmResult').html(data);
								}
							});
						});

						$('.u_pwChk').keyup(function() {
							var mPw = $('.u_pw').val();
							var mPwchk = $(this).val();
							if (mPw == mPwchk) {
								$('#pwChkResult').html('비밀번호 일치');
							} else {
								$('#pwChkResult').html('비밀번호 불일치');
							}
						});

						$('form')
								.submit(
										function() {
											var idPattern = /^[a-zA-Z0-9]{4,12}$/;
											var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
											var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
											var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;

											if ($('.u_id').val() == '') {
												alert("ID를 입력하세요");
												$('.u_id').focus();
												return false;
											}
											if (!idPattern.test($('.u_id')
													.val())) {
												alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력");
												$('.u_id').focus();
												return false;
											}
											if ($('.u_pw').val() == '') {
												alert("비밀번호를 입력하세요");
												$('.u_pw').focus();
												return false;
											}
											if ($('.u_pwChk').val() == '') {
												alert("비밀번호를 입력하세요");
												$('.u_pwChk').focus();
												return false;
											}
											if ($('.u_pw').val() != $(
													'.u_pwChk').val()) {
												alert("비밀번호가 다릅니다.");
												$('.u_pwChk').focus();
												return false;
											}
											if (!pwPattern.test($('.u_pw')
													.val())) {
												alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력 ");
												$('.u_pw').focus();
												return false;
											}
											if ($('.u_email').val() == '') {
												alert("e-mail 를 입력하세요");
												$('.u_email').focus();
												return false;
											}
											if (!emailPattern
													.test($('.u_email').val())) {
												alert("e-mail을 잘못입력하셨습니다 ");
												$('.u_email').focus();
												return false;
											}
											if ($('.u_tel').val() == '') {
												alert("전화번호를 입력하세요");
												return false;
												$('.u_tel').focus();
											}
											if (!phonePattern.test($('.u_tel')
													.val())) {
												alert("전화번호(-)빼고 입력 ");
												$('.u_tel').focus();
												return false;
											}
											if ($('.u_name').val() == '') {
												alert("이름을 입력하세요");
												return false;
												$('.u_name').focus();
											}

										});
					});
</script>

<link rel="stylesheet" href="${conPath }/css/user.css" />

</head>
<body>
	<div id="wrap">
		<div class="gray"></div>
		<div class="join">
			<form action="${conPath }/join.do" method="post"
				enctype="multipart/form-data">
				<div id="caption">
					<a href="${conPath}/main.do"><img src="${conPath }/images/logo_dark.png" alt="logo"></a> <span id="join_span">회원가입</span>
				</div>
				<hr>
				<br>
				<table id="info">
				<caption><span id="caption_big">회원정보입력</span> <span id="caption_small"> *는 필수입력 항목입니다.</span></caption>
					<tr>
						<th> 프로필사진 <b>*</b>
						</th>
						<td colspan="2"><input type="file" name="file" class="u_image">
						</td>

					</tr>
					<tr>
						<th> 아이디 <b>*</b>
						</th>
						<td colspan="2"><input type="text" name="u_id" class="u_id" autocomplete="off"> <span
							id="idConfirmResult"></span> (4~12자의 영문 대소문자와 숫자로만 입력)</td>

					</tr>
					<tr>
						<th class="not_height"> 비밀번호 <b>*</b>
						</th>
						<td colspan="2" class="not_height"><input type="password" name="u_pw" class="u_pw" placeholder="비밀번호를 입력해주세요."> (4~12자의 영문 대소문자와 숫자로만 입력)<br>
						<input type="password" name="u_pwChk" class="u_pwChk" placeholder="입력하신 비밀번호를 다시 한번 입력해주세요.">
							<span id="pwChkResult"></span>
							</td>
					</tr>
					<tr>
						<th> 이름 <b>*</b>
						</th>
						<td colspan="2"><input type="text" name="u_name" class="u_name" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th> 닉네임 <b>*</b>
						</th>
						<td colspan="2"><input type="text" name="u_nickname" class="u_nickname" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th> 전화번호 <b>*</b>
						</th>
						<td colspan="2"><input type="tel" name="u_tel" class="u_tel" autocomplete="off"></td>
					</tr>
					<tr>
						<th> 예비번호</th>
						<td colspan="2"><input type="tel" name="u_phone" class="u_phone" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th> 이메일 <b>*</b>
						</th>
						<td colspan="2"><input type="email" name="u_email" class="u_email" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th> 주소 <b>*</b>
						</th>
						<td><input type="text" id="sample4_postcode" class="text_box"
							placeholder="우편번호" readonly="readonly"> <input
							type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" class="ext_btn"></td>
						<td><input type="text" id="sample4_roadAddress" name="u_addr"
							class="u_addr" placeholder="도로명주소" class="maddr"> <input
							type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide"></span></td>
					</tr>
					<tr>
						<th> 생일 <b>*</b>
						</th>
						<td colspan="2"><input type="text" name="u_birth" id="datepicker" autocomplete="off">
						</td>
					</tr>
				</table>
				<br> <br> <br>
				<p class="subtn">
					<input type="submit" value="회원가입" class="joinbtn">  &nbsp; <input
						type="button" value="취소" class="resetbtn"
						onclick="history.go(-1)">
				</p>
			</form>
		</div>
		<div class="gray"> </div>
	</div>
</body>
</html>