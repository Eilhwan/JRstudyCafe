<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/studygroup.css">
<link rel="stylesheet" href="${conPath }/css/modal.css">
<script src="${conPath }/js/jquery.js"></script>
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

header {
	padding: 0;
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
	margin-top: 50px;
}
</style>
</head>

<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container">
		<div class="content-wrap side-bar">
			<div>
				<img src="${conPath }/studygroupUpload/${sg.sg_img}" alt="스터디그룹 이미지"
					width="240" height="224">
			</div>
			<div>
				<a class="sg-title">${sg.sg_name }</a>
			</div>
			<div>
				<span><a>맴버 ${sm_cnt }</a> | <a ::before>리더 ${sg.u_id } </a></span>
			</div>
			<c:if test="${not empty users }">
				<c:if test="${member.u_id ne sessionScope.users.u_id }">
					<div>
						<button class="join-btn" id="join-btn">그룹 가입하기</button>
					</div>
				</c:if>
				<c:if test="${member.u_id eq sessionScope.users.u_id }">
					<div>
						<button class="join-btn" id="write-btn">글 작성하기</button>
					</div>
				</c:if>
			</c:if>
			<c:if test="${empty users }">
				<div>
					<button class="join-btn" id="join-btn">그룹 가입하기</button>
					<input type="hidden" id="login_status" value="1">
				</div>
			</c:if>
		</div>
		<div class="content-wrap midContent">
			<div class="content-box">
				<div class="head-line">
					<h2>공지사항</h2>
				</div>
			</div>

			<c:if test="${empty notices }">
				<div class="content-box">
					<div class="content-line" id="notice-box">
						<h4 class="notice-line">등록된 공지사항이 없습니다.</h4>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty notices }">
				<c:forEach items="${notices }" var="notice">
					<div class="content-box" id="${notice.sb_no }">
						<div class="content-line" id="notice-box">
							<h4 class="notice-line">${notice.sb_content }</h4>
						</div>
						<div>
							<img ><span>글쓴이 ${notice.u_id } </span> <span> ${notice.sb_hit } 읽음</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2></h2>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<h3>댓글</h3>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$('#join-btn').click(function(){
				if($('#login_status').val() > 0){
						alert('로그인 후에 이용해주세요.');
						$(location).attr('href','${conPath}/loginView.do');
					}else{
						var result = confirm('정말로 ${sg.sg_name} 그룹에 가입하시겠습니까?' );
						if(result){
							$.ajax({
								  type: 'POST',
								  url: '${conPath}/studygroupJoin.do',
								  dataType: 'html',
								  data: 'u_id=${users.u_id}&sg_no=${param.sg_no}',
								  success: function(data){
									alert('가입 성공!');
								  }
								  
								});
						}else{ //yes
				
						}// no
						}
			});
			//join-btn
			
			$('.comment-writer').click(function(){
				if($('#'+sb_no+'content').text("")){
					alert('댓글을 입력해주세요.');
					return false;
					}
				var sb_no = $(this).attr('id').subString(0, $(this).attr('id').length - 3);
				var c_content = $('#'+$(this).attr('id').subString(0, $(this).attr('id').length - 3)+'content').text();
				$.ajax({
					url: "${conPath}/sbCommentWrite.do",
					type : "POST",
					dataType : "html",
					data : "sb_no=" + sb_no + "&c_content=" + c_content + "&sg_no=" + "${param.sg_no}",
					success : function(data){
						
					}
				});
			});
				
		});
	</script>
	<script>
	
		$(function(){
			$('.content-box').click(function(){
				var sb_no = $(this).attr('id');
				$.ajax({
				    url: "${conPath}/studyNoticeDetail.do",
				    type: "GET",
				    dataType: "html",
				    data: "sb_no="+sb_no,
				    success: function(data){
					    $('.modal').html(data);
				    }
				  }); //ajax - 테이블 받아오기
				setTimeout(function(){
					$('.modal').css('display', 'block');
				}, 500);
			});	
			$('.close').click(function(){
				$('.modal').css('display', 'none');
			});	
			$('.modal').click(function(){
				$('.modal').css('display', 'none');				
			});
			$(this).keyup(function(e) {
			     if (e.keyCode == 27) {
					$('.modal').css('display', 'none');								     
			    }
			});
			
	
		}); //jquery
		
	</script>
</body>

</html>