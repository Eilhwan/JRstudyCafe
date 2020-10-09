<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
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
<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<style>
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
</style>
<script defer
	src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"
	integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script>
	WebFont.load({
		google : {
			families : [ 'Montserrat:300,400,700',
					'Raleway:300,400,500,600,700,800' ]
		}
	});
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://malsup.github.com/jquery.cycle2.js"></script>
		<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
		<script>$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';</script>

</head>
<body>
	<jsp:include page="../main/header.jsp" />
		<!-- 스터디룸 삭제 모달입니다. -->
		<div class="modal" id="room_delete_modal">
	        <div class="modal-background" onclick="is_unactive()"></div>
		        <div class="modal-card">
		          <header class="modal-card-head">
		            <p class="modal-card-title">스터디룸 삭제 설정</p>
		            <button class="delete" aria-label="close" onclick="is_unactive()"></button>
		          </header>
		          <section class="modal-card-body">
		            <h1>선택한 스터디룸을 삭제하시겠습니까?</h1>
		          </section>
		          <footer class="modal-card-foot">
		            <button class="button is-success" onclick="location.href='${conPath}/admin/deleteRoom.do?r_no=${room.r_no}'">확인</button>
		            <button class="button" onclick="is_unactive()">취소</button>
		          </footer>
		        </div>
	    </div>
	<div id="content_hole"></div>
	<div class="container">
		<img alt="" src="${conPath }/images/${room.r_image }">
		<div class="level-left">
		<h2>${room.r_name }</h2>
		<div class="level-left">
		<p>시간당 금액: ${room.r_pph }</p>
		<p>방 크기: ${room.r_ppr }</p>
		</div>
		</div>
		<div class="level">
			<h3>옵션</h3>
			<c:if test="${room.ro_air eq 1 }">
				<b>에어컨</b><img src="${conPath }/optionImages/aircon.png" class="image is-48x48	">
			</c:if>
			<c:if test="${room.ro_chair eq 1 }">
				<b>회의테이블</b><img src="${conPath }/optionImages/lib_table.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_chair eq 2 }">
				<b>소파</b><img src="${conPath }/optionImages/sofa.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_chair eq 3 }">
				<b>도서관</b><img src="${conPath }/optionImages/lib_table.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_print eq 1 }">
				<b>프린트/흑백</b><img src="${conPath }/optionImages/printer.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_print eq 2 }">
				<b>프린트/컬러</b><img src="${conPath }/optionImages/printer.png" class="image is-48x48">
			</c:if>
			
			<c:if test="${room.ro_smoke eq 0 }">
				<b>금연</b><img src="${conPath }/optionImages/no_smoke.png" class="image is-48x48">
			</c:if>
			
			<c:if test="${room.ro_print eq 1 }">
				<b>흡연가능</b><img src="${conPath }/optionImages/smoke.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_pc eq 1 }">
				<b>PC/노트북</b><img src="${conPath }/optionImages/pc.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_tv eq 1 || room.ro_tv eq 2 || room.ro_tv eq 3}">
				<b>TV/프로젝터</b><img src="${conPath }/optionImages/projector.png" class="image is-48x48">
			</c:if>
			
			<c:if test="${room.ro_wifi eq 1 }">
				<b>WI-FI</b><img src="${conPath }/optionImages/wifi.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_wifi eq 2 }">
				<b>100M 유선/WI-FI</b><img src="${conPath }/optionImages/wifi.png" class="image is-48x48">
			</c:if>
			<c:if test="${room.ro_wifi eq 3 }">
				<b>1G 광랜</b><img src="${conPath }/optionImages/wifi.png" class="image is-48x48">
			</c:if>
			
			<c:if test="${room.ro_board eq 1 }">
				<b>화이트보드</b><img src="${conPath }/optionImages/white_board.png" class="image is-48x48">
			</c:if>
		</div>
			<div class="level-right">
				<button class="button is-primary is-light" onclick="location.href='${conPath}/admin/studyroomModifyView.do?r_no=${param.r_no }'">수정하기</button>
				<button class="button is-primary is-light" onclick="is_active()">삭제하기</button>
			</div>
	</div>
		<script>
          let modal = document.getElementById('room_delete_modal');
          function is_active() {
              modal.setAttribute('class', 'is-active');
          }
          function is_unactive() {
              modal.setAttribute('class', "modal-close");
          }
      </script>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>