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
			<div class="search-box">
				<input type="text" placeholder="글 내용, 작성자 검색" class="search-bar">
				<input type="button" class="search-btn">
			</div>
			<div class="content-box">
				<div class="head-line">
					<h2>그룹 소개</h2>
					<!-- <div class="icon-box">
						<button type="button" class="menu-icon"></button>
					</div> -->
				</div>
				<div class="content-line">${sg.sg_explain }</div>
				<div class="btn"
					onclick="location.href='${conPath}/studyIntro?sg_no=${param.sg_no}'">상세보기</div>
			</div>
			<div class="content-box">
				<div class="head-line">
					<h2>공지사항</h2>
				</div>
				<div class="content-line" id="notice-box">
					<c:if test="${empty notice }">
						<h4 class="notice-line-none">등록된 공지사항이 없습니다.</h4>
					</c:if>
					<c:forEach items="${notice }" var="no">
						<h4 class="notice-line" id="${no.sb_no }">${no.sb_title }</h4>
					</c:forEach>

				</div>
				<div class="btn" id="btn_notice"
					onclick="location.href='${conPath}/studyNotice.do?sg_no=${param.sg_no}'">더
					보기</div>
			</div>
			<h2 class="content-head">글 목록</h2>
			<c:if test="${empty list }">
				<div class="content-box">
					<div class="content-line" id="notice-box">
						<h4 class="notice-line-none">새 글이 없습니다. 어서 작성해보세요!</h4>
					</div>
				</div>
			</c:if>
			<c:forEach items="${list }" var="sb">
				<div class="content-box">
					<div class="head-line">
						<div>
							<img src="${conPath }/usersImgFileUp/${sb.u_image}" alt="사람사진"
								class="user-img">
						</div>
						<div>
							<div class="user-name">
								<p>
									<a href="${conPath }/userProfile.do?u_id=${sb.u_id}">${sb.u_name }</a>
								</p>
							</div>
							<div class="post-time">${sb.sb_rdate }</div>
						</div>
					</div>
					<div class="content-line">
						<pre>${sb.sb_content }</pre>
						<div>
							댓글 10<span>▼</span> 공유 1
						</div>
						<div class="btn" style="border-bottom: 1px solid #ccc">공유하기</div>
					</div>
					<div class="comment-footer">
						<div class="comment-form">
							<c:if test="${sessionScope.users.u_name ne null}">
								<label class="id">${sessionScope.users.u_name }</label>
								<div>
									<textarea rows="5" cols="20" name="c_content" id="${sb.sb_no }content" placeholder="내용을 입력하세요." class="textarea"></textarea>
									<button type="button" class="comment-writer" id="${sb.sb_no }cmt">등록</button>
								</div>
							</c:if>
							<c:if test="${sessionScope.users.u_name eq null}">
								<h3>로그인 후에 이용해 주세요.</h3>
							</c:if>
						</div>
						<c:forEach items="${comments }" var="sc">
							<c:if test="${sc.sb_no eq sb.sb_no }">
								<div id="comment_area">
									<div class="comment_inner">
										<div id="user_img">
											<img src="${conPath }/usersImgFileUp/${sc.u_image}"
												alt="댓글 사진" width="50" height="50">
										</div>
									</div>
									<div class="comment_inner">
										<div class="comment1">${sc.u_name }</div>
										<div class="comment2">${sc.c_content }</div>
										<div class="comment3">${sc.c_rdate }</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				
			</c:forEach>
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
				var sb_no = $(this).attr('id').subString(0, $(this).attr('id').length - 3);
				var sb_no_content = ('#')+sb_no + "content";
				if($(sb_no_content).text("")){
					alert('댓글을 입력해주세요.');
					return false;
					}
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
	<!-- Notice Page Open -->
	<script>
		$(function(){
			$('.notice-line').click(function(){
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
			$('#write-btn').click(function(){
				$(location).attr('href','${conPath}/sbWriteView.do?sg_no=${param.sg_no}');
				

			});

	
		}); //jquery
	</script>
</body>

</html>