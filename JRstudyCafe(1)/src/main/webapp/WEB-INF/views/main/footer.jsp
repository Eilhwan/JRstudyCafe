<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* footer */
footer p {color:#555; font-size:14px;}
.footer_div {background:#191919; padding:80px 0;}
.col-one-forth {width:270px; margin-right:30px; float:left;}
.col-one-forth:last-child{margin-right:0;}
.footer_logo a { width:181px; height:56px; background:url('images/logo_dark.png') no-repeat; text-indent:-9999em; display:block; margin-bottom:24px;}

.col-one-forth:first-child p{ line-height:24px; margin-bottom:20px;}
.col-one-forth:first-child a {font-size:14px;  color:#d1d1d1; text-decoration:none;}
.col-one-forth:first-child a span{margin-left:6px;}

#small_p {font-size:0.8em;}
.footer_div h3{font-size:24px; font-weight:bold; line-height:40px; margin-top:16px; color:#fff;}

.footer_div ul {margin-top:20px;}
.footer_div .footer_list li {border-bottom:1px solid #252525; padding-bottom:20px; margin-bottom:20px;}
.footer_div .footer_list li:last-child{border-bottom:0;}
.footer_div .footer_list li p { line-height:20px; word-break:break-all;}

.footer_div .footer_list li:hover p{color:#c7b299;}

.using_time, .address{ color:#00bff3; }
.footer_div .phone li{width:130px; float:left; margin:0 10px 10px 10px; color:white; font-size:1.2em;}
.footer_div .phone li:last-child {font-size:1em;}
#image_li {padding-left:5px;}
</style>
<script src="${conPath }/js/script.js"></script>
</head>
<body>
	<footer>
			<div class="footer_div">
				<div class="container clearfix">
					<div class="col-one-forth">
						<h3>About Us</h3>
						<br>
						<p>
						JRstudy카페는 2020년 01월 01일 새로 오픈한 스터디카페로서, 3인실부터~18인실까지 "독립된  모임공간" (회의실, 스터디룸, 강의실,세미나실)을 제공하고 있습니다. 탁 트인 전망, 밝고 쾌적한 시스템, 내 집처럼 아늑한 공간에서 편안하고 기분 좋은 모임을 즐겨 보세요.
						</p>
						<a href="${conPath }/introduction.do">Read More <span><i class="fas fa-caret-right"></i></span></a>
					</div>
					<div class="col-one-forth">
						<h3>Come to US</h3>
						<ul class="footer_list">
							<li>
								<span class="address"> @오시는 길</span> 
								<p>
								&nbsp; 서울 종로구 수표로 105, 8-9층
								</p>
								<p id="small_p">
								&nbsp; (지번) 종로2가 40(우) 03140
								</p>
							</li>
							<li id="image_li">
								<img src="images/지도1.PNG" alt="스터디룸 위치">
							</li>													
						</ul>
					</div>
					<div class="col-one-forth">
						<h3>Hours of use</h3>
						<ul class="footer_list">
							<li>
								<p>
								<span class="using_time"> @운영시간</span> <br> 밤 22:00~다음날 오전 10:00 (이용은 미리 예약 필수)<br> * 심야 : 예약 없이 당일 방문 이용 불가 *
								</p>
							</li>
							<li>
								<p>
								<span class="using_time"> @운영시간</span> <br> 예약 가능 시간 10:00~22:00<br> ( 카톡ID : 7022110 )
								</p>
							</li>
							<li>
								<p>
								<span class="using_time"> @운영시간</span> <br> [채움 스탭 근무시간]<br> 월 ~ 일   10:00~22:00
								</p>
							</li>							
						</ul>					
					</div>
					<div class="col-one-forth">
						<h3>Call Us Free</h3>
						<ul class="phone">
							<li><img src="images/전화기.png" alt="전화기아이콘" width="55"/></li>
							<li></li>
							<li> (+123)<br> 456 789</li>	
							<li> </li>	
							<li> Fax.02-123-4567</li>			
						</ul>					
					</div>
				</div>
			</div>
			</footer>
</body>
</html>