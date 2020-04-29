<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="modal-content">
		<div class="modal-header">
			<span class="close">&times;</span>
			<h2>${notice.sb_title }</h2>
		</div>
		<div class="modal-body">
			${notice.sb_content }
		</div>
		<div class="modal-footer">
		<div class="comment-form">
			<c:if test="${sessionScope.users.u_name ne null}">
				<label class="id">${sessionScope.users.u_name }</label>
				<div>
					<textarea rows="5" cols="20" name="c_content" id="${sb.sb_no }content" placeholder="내용을 입력하세요."></textarea>
					<button type="button" class="comment-writer" id="${sb.sb_no }cmt">등록</button>
				</div>
			</c:if>
			<c:if test="${sessionScope.users.u_name eq null}">
				<h3>로그인 후에 이용해 주세요.</h3>
			</c:if>
		</div>
			<c:forEach items="${comments }" var="sc">
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
			</c:forEach>
		</div>
	</div>		
</body>
</html>