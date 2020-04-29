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