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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
<script>
	$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';
</script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="${conPath }/css/main.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.css" />
<link rel="stylesheet" href="${conPath }/css/bulma.min.css" />
<script src="${conPath }/js/script.js"></script>
<style>
* {
	text-align: center;
}

#content_wrap {
	height: 1000px;
}

.card {
	position: fixed;
	top: 240px;
	left: 30px;
	z-index: 99999;
	width:250px;
	border:1px solid lightgray;
}

caption {
	font-size: 1.8em;
	margin: 15px;
}

table {
	width: 1100px;
	margin: 10px auto;
}

table:not(#table_bottom) {
	border-bottom: 2px solid black;
	border-top: 2px solid black;
}

#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}

#table_bottom tr td {
	text-align: right;
}

#table_bottom tr {
	height: 70px;
}

#table_bottom tr td input {
	margin-right: 5px;
	height: 35px;
}

#table_bottom tr td nav a {
	height: 25px;
}

#table_bottom tr td nav {
	width: 620px;
	margin-left: 480px;
}

#select_div {
	margin-top: 20px;
}

#select_div select {
	height: 25px;
}

input[type='submit'] {
	height: 25px;
}
.card footer p a, tbody tr td a {
	color:#998675;
}
.pagination-list li:first-child a{
	background-color: #998675;
	border-color: #c7b299;
}
#998675
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
		<div class="card">
			<div class="card-content">
				<p class="title">“토익스피킹, 오픽 스터디원 모집합니다 (~05/07)”</p>
				<p class="subtitle">* 팀장 닉네임</p>
			</div>
			<footer class="card-footer">
				<p class="card-footer-item">
					<span> Goto Profile <a href="#">닉네임</a>
					</span>
				</p>
				<p class="card-footer-item">
					<span> Share on <a href="#">Facebook</a>
					</span>
				</p>
			</footer>
		</div>
		<table class="table is-striped is-narrow is-hoverable">
			<caption>자유게시판</caption>
			<thead>
				<tr>
					<th><abbr title="Position">No</abbr></th>
					<th>작성자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>좋아요</th>
					<th>IP</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Leicester_City_F.C."
						title="Leicester City F.C.">Leicester City</a> <strong>(C)</strong>
					</td>
					<td>23</td>
					<td>20/04/09</td>
					<td>+32</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>2</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Arsenal_F.C."
						title="Arsenal F.C.">Arsenal</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+29</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>3</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C."
						title="Tottenham Hotspur F.C.">Tottenham Hotspur</a></td>
					<td>19</td>
					<td>20/04/09</td>
					<td>+34</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>4</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Manchester_City_F.C."
						title="Manchester City F.C.">Manchester City</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+30</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>5</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Manchester_United_F.C."
						title="Manchester United F.C.">Manchester United</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+14</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>6</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Southampton_F.C."
						title="Southampton F.C.">Southampton</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+18</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>7</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/West_Ham_United_F.C."
						title="West Ham United F.C.">West Ham United</a></td>
					<td>16</td>
					<td>20/04/09</td>
					<td>+14</td>
					<td>198.12.68.31</td>
				<tr>
					<th>8</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Liverpool_F.C."
						title="Liverpool F.C.">Liverpool</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+13</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>9</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Stoke_City_F.C."
						title="Stoke City F.C.">Stoke City</a></td>
					<td>14</td>
					<td>20/04/09</td>
					<td>−14</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>10</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Chelsea_F.C."
						title="Chelsea F.C.">Chelsea</a></td>
					<td>12</td>
					<td>20/04/09</td>
					<td>+6</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>11</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Everton_F.C."
						title="Everton F.C.">Everton</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+4</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>12</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Swansea_City_A.F.C."
						title="Swansea City A.F.C.">Swansea City</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>−10</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>13</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Watford_F.C."
						title="Watford F.C.">Watford</a></td>
					<td>12</td>
					<td>20/04/09</td>
					<td>−10</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>14</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/West_Bromwich_Albion_F.C."
						title="West Bromwich Albion F.C.">West Bromwich Albion</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>−14</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>15</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/Crystal_Palace_F.C."
						title="Crystal Palace F.C.">Crystal Palace</a></td>
					<td>11</td>
					<td>20/04/09</td>
					<td>−12</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>16</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Southampton_F.C."
						title="Southampton F.C.">Southampton</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+18</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>17</th>
					<th>WRITER</th>
					<td><a
						href="https://en.wikipedia.org/wiki/West_Ham_United_F.C."
						title="West Ham United F.C.">West Ham United</a></td>
					<td>16</td>
					<td>20/04/09</td>
					<td>+14</td>
					<td>198.12.68.31</td>
				<tr>
					<th>18</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Liverpool_F.C."
						title="Liverpool F.C.">Liverpool</a></td>
					<td>38</td>
					<td>20/04/09</td>
					<td>+13</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>19</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Stoke_City_F.C."
						title="Stoke City F.C.">Stoke City</a></td>
					<td>14</td>
					<td>20/04/09</td>
					<td>−14</td>
					<td>198.12.68.31</td>
				</tr>
				<tr>
					<th>20</th>
					<th>WRITER</th>
					<td><a href="https://en.wikipedia.org/wiki/Chelsea_F.C."
						title="Chelsea F.C.">Chelsea</a></td>
					<td>12</td>
					<td>20/04/09</td>
					<td>+6</td>
					<td>198.12.68.31</td>
				</tr>
			</tbody>
		</table>
		<table id="table_bottom">
			<tr>
				<td><input type="button" value="글쓰기"
					onclick="location.href='${conPath }/Write_view.do'"
					class="button is-link is-focused"><input type="button"
					value="목록" onclick="location.href='${conPath }/Write_view.do'"
					class="button is-link is-focused"></td>
			</tr>
			<tr>
				<td>
					<nav class="pagination" role="navigation" aria-label="pagination">
						<a class="pagination-previous" title="This is the first page"
							disabled>Previous</a> <a class="pagination-next">Next page</a>
						<ul class="pagination-list">
							<li><a class="pagination-link is-current"
								aria-label="Page 1" aria-current="page">1</a></li>
							<li><a class="pagination-link" aria-label="Goto page 2">2</a></li>
							<li><a class="pagination-link" aria-label="Goto page 3">3</a></li>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
		<div id="select_div">
			<form action="${conPath }/list.do">
				<input type="hidden" name="method" value="list"> <select
					name="schItem">
					<option value=""
						<c:if test="${param.schItem=='' }">selected="selected"</c:if>>검색조건</option>
					<option value="all"
						<c:if test="${param.schItem=='all' }">selected="selected"</c:if>>글제목+작성자</option>
					<option value="title"
						<c:if test="${param.schItem=='btitle' }">selected="selected"</c:if>>글제목</option>
					<option value="writer"
						<c:if test="${param.schItem=='bwriter' }">selected="selected"</c:if>>작성자</option>
				</select> <input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" class="button is-small">
			</form>
		</div>

	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />

</body>
</html>