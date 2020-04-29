<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
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
.pagination-list b{
	background-color: #998675;
	border-color: #c7b299;
}
</style>
</head>
<script>
	$(document).ready(function() {
		var rv_no = ${review_detail.rv_no };
			// 게시글 삭제
			$('#review_deleteBtn').click(function() {
				var confirmChk = confirm("정말 삭제 하시겠습니까?");
				if(confirmChk == true){
					location.href='${conPath }/reviewDelete.do?rv_no=${review_detail.rv_no }';
				}
			});
			// 후기 게시글 좋아요 처리
			$('#likeBtn').click(function(){
				if(${not empty users}){
					$.ajax({
						url : '${conPath }/reviewlikes.do',
						dataType : "html",
						data : 'rv_no='+rv_no,
						success : function(data){
							var msg = $(data).text().trim();
							alert(msg);
							location.href='${conPath }/reviewDetailView.do?rv_no=${review_detail.rv_no}';
						}
					});
				}else{
					alert('로그인 후만 할수있음');
				}
				
			});
			// 댓글 더보기 기능
			var pageNum;
				var pageCnt = Number('${paging.pageCnt}');
				var total = Number('${paging.total}');
				if(total <= '${paging.pageSize}'){ // total갯수가 pageSize이하면 더보기 버튼 안 나옴 
					$('#appendButton').css('display','none');
				}
				$('#appendButton').click(function(){
					pageNum = Number($('.pageNum').last().val());
					if(isNaN(pageNum)){
						pageNum = 1; // 처음 더보기를 누를 경우 pageNum을 1로
					}
					$.ajax({
						url : '${conPath}/rvcomentAppend.do',
						type : 'get',
						dataType : 'html',
						data : 'pageNum='+(pageNum+1)+'&rv_no='+rv_no,
						success : function(data){
							$('#appendSpace').append(data);
							pageNum = Number($('.pageNum').last().val());
							if(pageCnt <= pageNum){
								$('#appendButton').css('display','none');//마지막 페이지까지 더보기로 뿌려서 더보기 버튼 안 나옴
								$('#theEnd').css('display','block');
							}
						}
					}); // $.ajax()함수
				});// 더보기 button 이벤트 처리
				
				// 댓글 삭제
				$('.reviewcoment_delete').click(function(){
					var c_no = $(this).attr("data-rno");
					var confirmChk = confirm(c_no+'번 글삭제  하시겠습니까?');
					if(confirmChk == true){
						alert(c_no+'번 글삭제');
						location.href='${conPath }/reviewComentDelete.do?c_no='+c_no+'&rv_no='+rv_no;
					}
				});
				
				// 댓글 쓰기
				$('#reviewcoment_wirte').click(function(){
					var c_content = $('#c_content').val();
					var rv_no = ${review_detail.rv_no };
					if(c_content!='' && c_content!= null){
						$.ajax({
							url : '${conPath }/reviewComentWrite.do',
							dataType : "html",
							data : 'c_content='+c_content+'&rv_no='+rv_no,
							success : function(data){
								$('#c_content').val('');
								$('#insertMemo').html(data+$('#insertMemo').html());
								
							}
						}); // $.ajax()함수
					}else{
						alert('댓글을 입력하세요');
					}
				});
				
	});
			
</script>
<body>
	<c:if test="${not empty reviewDeleteResult }">
		<script>
		alert("${reviewDeleteResult }");
		</script>
	</c:if>
	<c:if test="${not empty likeResult }">
		<script>
		alert("${likeResult }");
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
		<div id="content_hole"></div>
		<div id="content_wrap">
			<table class="table is-striped is-narrow is-hoverable">
				<caption>Review</caption>
				<tbody>
				<tr>
					<th>
						제목
					</th>
					<td>
						${review_detail.rv_name }
					</td>
				</tr>
				<tr>
					<th>
						좋아요
					</th>
					<td>
						${review_detail.likecnt }
					</td>
				</tr>
				<tr>
					<th>
						조회수
					</th>
					<td>
						${review_detail.rv_hit }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						${review_detail.rv_content }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="${conPath }/reviewlike.do?rv_no=${review_detail.rv_no }&pageNum=${pageNum}"></a>
						<p id="likeBtn" class="button is-link is-focused">좋아요</p>
					</td>
				</tr>
				</tbody>
			</table>
			<table id="table_bottom">
			<tr>
				<td>
					<button onclick="location.href='${conPath }/reviewModifyView.do?rv_no=${review_detail.rv_no }'" class="button is-link is-focused">글수정</button>
					<button class="button is-link is-focused" id="review_deleteBtn">글삭제</button>
					<button onclick="location.href='${conPath }/reviewListView.do'" class="button is-link is-focused">목록</button>
				</td>
			</tr>
			</table>
		</div>
		<div id="rv_coment">
			<div class="container">
			    <br><br>
			        <div>
			            <div>
			                <span><strong>Comments(${rvcoment_cnt})</strong></span> <span id="cCnt"></span>
			            </div>
			            <div>
			                <table class="table">
			                	<c:if test="${not empty users }">
			                	<tr>
			                		<td>
			                			${users.u_nickname }님
			     					</td>
			                	</tr>                    
			                    <tr>
			                        <td>
			                            <textarea style="width: 1100px" rows="3" cols="30" id="c_content" name="c_content" placeholder="댓글을 입력하세요"></textarea>
			                            <br>
			                            <div>
			                            	<button id="reviewcoment_wirte">
			                            		등록
			                            	</button>
			                            </div>
			                        </td>
			                    </tr>
			                    </c:if>
			                 </table>
			                 <div id="insertMemo"></div>
			                 		<div>
			                    	<c:forEach items="${rvcoment_list}" var="coment_list">
			                    		<div id="${coment_list.c_no }">
			                    			<!--  <img alt="" src="${conPath }/usersImgFileUp/${coment_list.u_image}">--> 
							    			${coment_list.u_nickname }님
							    			<br>
							    			${coment_list.c_content }
							    			<br>
							    			작성일${coment_list.c_rdate}
							    			<br>
							    			<c:if test="${users.u_id eq coment_list.u_id }">				    											    				
							    			<button class="reviewcoment_delete" type="button" data-rno="${coment_list.c_no}">삭제</button>	
							    			</c:if>
							    		</div>
						    		</c:forEach>
			                 		</div>
			                 		<div id="appendSpace"></div>
			                 <div class="paging">
								<button id="appendButton">더보기</button>
							</div>
			            </div>
			        </div>  
			</div>
		</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>