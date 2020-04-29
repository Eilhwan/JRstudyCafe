<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이알스터디 카페</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
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


		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<script src="${conPath }/js/script.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="slider">
		<ul class="slider-list cycle-slideshow" data-cycle-fx="scrollHorz"
			data-cycle-timeout="0" data-cycle-slides="> li"
			data-cycle-prev=".slider .prev" data-cycle-next=".slider .next"
			data-cycle-pager=".pager">
			<li class="slide1">
				<div class="contents">
					<h3>THE PREMIUM STUDY CAFE</h3>
					<h1>JRstudy Cafe</h1>
					<p>제이알스터디카페는 여러분의 성공을 위하여 차별화된 시스템과 최적의 공간을 제공하고 있습니다. 보다 '더'
						집중할 수 있는 최고의 환경을 체험하세요.</p>
					<a href="" class="btn">스터디룸 보기</a>
				</div>

			</li>
			<li class="slide2">
				<div class="contents">
					<h3>THE PREMIUM STUDY CAFE</h3>
					<h1>JRstudy Cafe</h1>
					<p>제이알스터디카페는 여러분의 성공을 위하여 차별화된 시스템과 최적의 공간을 제공하고 있습니다. 보다 '더'
						집중할 수 있는 최고의 환경을 체험하세요.</p>
					<a href="" class="btn">스터디룸 보기</a>
				</div>
			</li>
		</ul>
		<p class="controls">
			<a href="" class="prev">prev</a> <a href="" class="next">prev</a>
		</p>
		<p class="pager clearfix"></p>

	</div>

	<main class="content">

		<section class="latest_projects container">

			<div class="room_wrap">

				<input type="radio" value="all" id="filter-all" name="filter"
					checked /> <label for="filter-all">All</label> <input type="radio"
					value="filter-one" id="filter-one" name="filter" /> <label
					for="filter-one">2인실</label> <input type="radio"
					value="filter-two" id="filter-two" name="filter" /> <label
					for="filter-two">4인실</label> <input type="radio"
					value="filter-three" id="filter-three" name="filter" /> <label
					for="filter-three">6인실</label> <input type="radio"
					value="filter-four" id="filter-four" name="filter" /> <label
					for="filter-four">오픈형</label>

				<ul class="project_list clearfix">
					<li class="one">
						<div class="imgWarp">
							<img src="images/room1.jpg" alt="room1" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>나무 StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
					<li class="one">
						<div class="imgWarp">
							<img src="images/room2.jpeg" alt="room2" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>10인실 StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
					<li class="two">
						<div class="imgWarp">
							<img src="images/room3.jpg" alt="room3" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>회의실/강의실 StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
					<li class="three">
						<div class="imgWarp">
							<img src="images/room4.jpg" alt="room4" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>오픈형 StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
					<li class="four">
						<div class="imgWarp">
							<img src="images/room5.jpg" alt="room5" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>PPT사용 StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
					<li class="one">
						<div class="imgWarp">
							<img src="images/room6.jpg" alt="room6" />
							<div class="hover_contents">
								<a href=""><i class="fas fa-search"></i></a>
							</div>
						</div>
						<div class="contents">
							<h4>Potential StudyRoom</h4>
							<p>스터디룸 설명</p>
						</div>
					</li>
				</ul>
			</div>
		</section>
		<!--//latest_projects -->
	</main>
	<div>
         <a href="${conPath }/admin/adminLoginView.do">admin 로그인</a>      
      </div>
	<jsp:include page="side.jsp" />
	<c:if test="${not empty admin}">
		<ul>
			<li><a href="${conPath }/admin/adminEnrollView.do">관리자등록페이지가기</a></li>
			<li><a href="${conPath }/admin/listAdmin.do">관리자목록가기</a></li>
		</ul>
	</c:if>
	<jsp:include page="footer.jsp" />
</body>
</html>