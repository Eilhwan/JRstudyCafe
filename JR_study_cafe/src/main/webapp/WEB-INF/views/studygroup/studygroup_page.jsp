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
	margin-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container">
		<div class="columns">
			<div class="column is-one-quarter">
				<ul>
					<li><a href="${conPath }/studygroupPage.do">나의 스터디그룹</a></li>
					<li><a href="${conPath }/studygroupCondition.do">스터디그룹 개설</a></li>
				</ul>
			</div>
			<div class="column">
				<h1>운영 중인 스터디룸</h1>
				<table class="table is-fullwidth">
					<c:if test="${not empty l_studygroups }">
						<c:forEach items="${l_studygroups }" var="ls">
							<tr>
								<td>
									<div
										onclick="location.href='${conPath }/studygroupView.do?sg_no=${ls.sg_no }'">
										<img src="${conPath }/studygroupUpload/${ls.sg_img}"
											alt="스터디사진" width="100" height="100"> <br> <label>${ls.sg_name }</label>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<h1>${sessionScope.users.u_nickname }회원님의스터디</h1>
				<table class="table is-fullwidth">
					<c:if test="${not empty u_studygroups }">
						<c:forEach items="${u_studygroups }" var="sg">
							<tr>
								<td>
									<div
										onclick="location.href='${conPath }/studygroupView.do?sg_no=${sg.sg_no }'">
										<img src="${conPath }/studygroupUpload/${sg.sg_img}"
											alt="스터디사진" width="100" height="100"> <br>
										<label>${sg.sg_name }</label>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>