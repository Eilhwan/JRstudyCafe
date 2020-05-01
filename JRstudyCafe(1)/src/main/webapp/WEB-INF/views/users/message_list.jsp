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
<script src="${conPath }/js/jquery.js"></script>
<script>
	var all_check = false;
	$(function() {
		$('#select_all').click(function() {
			if (!all_check) {
				$('input[class="chkbox"]').prop('checked', true);
				$('input[class="chkbox"]').prop('name', 'checked');
				var checkedcnt = $(".chkbox:checked").length + "개 선택";
				$('#checkedcnt').html(checkedcnt);
				all_check = true;
			} else {
				$('input[class="chkbox"]').prop('checked', false);
				$('input[class="chkbox"]').prop('name', '');
				var checkedcnt = $(".chkbox:checked").length + "개 선택";
				$('#checkedcnt').html(checkedcnt);
				all_check = false;
			}
		});

		$('.chkbox').click(function() {
			if ($(this).prop('checked')) {
				var checkedcnt = $(".chkbox:checked").length + "개 선택";
				$(this).attr('name', 'checked');
				$('#checkedcnt').html(checkedcnt);
			} else {
				$('#select_all').prop('checked', false);
				var checkedcnt = $(".chkbox:checked").length + "개 선택";
				$(this).removeAttr('name');
				$('#checkedcnt').html(checkedcnt);
				all_check = false;
			}
		});

	})
</script>
<style>
.content-wrap {
	height: 500px;
}
</style>
<link rel="stylesheet" href="${conPath }/css/bulma.css">
</head>
<body>
	<div class="container">
		<form action="${conPath}/messageDelete.do">
			<table class="table is-striped">
				<tr>
					<td colspan="4">
						<p id="checkedcnt">0</p> <input type="submit" value="삭제하기"
						class="button is-dark is-small">
						<button type="button"
							onclick='location.href="${conPath}/userMessagnerSendView.do"'
							class="button is-dark is-small">메시지작성</button>
					</td>
				</tr>
				<tr>
					<th><input type="checkbox" id="select_all"></th>
					<th>제목</th>
					<th>발신자</th>
					<th>발송일</th>
				</tr>
				<c:if test="${empty messages }">
					<tr>
						<th colspan="4">표시할 메시지가 없습니다.</th>
					</tr>
				</c:if>
				<c:if test="${not empty messages }">
					<c:forEach items="${messages }" var="message">
						<tr>
							<td><input type="checkbox" class="chkbox"
								value="${message.m_no }"></td>
							<c:if test="${message.m_status eq 2 }">
								<th><b><a
										href="${conPath }/messageDetail.do?m_no=${message.m_no}">${message.m_title }</a></b></th>
								<th>${message.m_sender }</th>
								<th>${message.m_sendtime }</th>
							</c:if>
							<c:if test="${message.m_status eq 1 }">
								<td><a
									href="${conPath }/messageDetail.do?m_no=${message.m_no}">${message.m_title }</a></td>
								<td>${message.m_sender }</td>
								<td>${message.m_sendtime }</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
			[ <a
						href="${conPath }/admin/MessangerList.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
				[ <b> ${i }</b> ]
			</c:if>
					<c:if test="${paging.currentPage!=i }">
				[ <a href="${conPath }/admin/MessangerList.do?pageNum=${i}"> ${i }</a> ]
			</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a
						href="${conPath }/admin/MessangerList.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
			</div>
		</form>
	</div>
</body>
</html>