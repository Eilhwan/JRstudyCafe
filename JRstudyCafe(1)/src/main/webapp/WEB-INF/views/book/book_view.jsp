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
<style >
*{
	margin: 0 ;
	padding: 0;
}
#content_wrap {
	width: 1200px;
	margin: 0 auto;
}
.book_table{
	margin: 0 auto;
	width: 1200px;
	padding-top: 50px;
}
.book_table table {
	border-top: 3px solid black;
	border-left:1px solid #dadada;
	border-right:1px solid #dadada;
	border-collapse:collapse;
	width: 100%;
}
.book_table table b{
	font-size: 14px;
	font-weight: bold;
}
.book_table h2{
	font-size: 23px;
	font-weight: bold;
	padding: 0 0 10px 0;
}
.book_table tr{	
	border-bottom:1px solid #dadada;
	height: 50px;
}
.book_table .td1{
	width: 283px;
	border-right:1px solid #dadada;
	background-color: #f7f7f7;
	padding: 20px;
	line-height: 2;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
}
.book_table td{
	margin: 10px;
	padding: 20px;
	text-align: left;
}

#datepicker{
	padding: 0;
	margin: 0;
}
table button{
	background-color: white;
	border: none;
}
select {
	padding: 5px 20px;
    font-size: 14px;
}
.book_table #datepicker{
	padding: 5px 20px;
    font-size: 14px;
}
.btn_list{
	padding: 30px;
	text-align: center;
}
.sub_btn{
	background-color:black;
	color:#ffb400;
	font-size: 14px;
	border: none;
	padding: 10px 50px;
}
#content_hole {
	height: 120px;
	background-image: url('images/mainslide_02.jpg');
}
.book_step{
	width: 1200px;
	padding: 50px 0 40px 0;
}
.book_step ul {
    padding: 30px 0 0 0;
    list-style: none;
    overflow: hidden;
}
.book_step li {
	float: left;
	text-align: center;
    width: 5%;
    padding: 10px 0;
}
.book_step li b{
	font-weight: bold;
	font-size: 20px;
}
.book_step li span{
	font-size: 0.8em;
}
.book_step .step_off {
    background: #e2e2e2;
    color: #333;
    width: 30%;
}
.book_step .step_arrow {
    font-size: 20px;
    font-weight: bold;
    padding: 20px 0 0 0;
}
.book_step .step_ov {
    background: #ffb400;
    color: #333;
    width: 30%;
    border-style: dashed;
}
.book_noti01 {
    padding: 20px 0 0 0;
    clear: both;
}
.book_noti01 ul {
    padding: 0 0 20px 0;
}
element.style {
    background: #f7f7f7;
    padding: 15px;
}
ul {
    padding: 10px 0 0 0;
}

</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$( function() {
	   $( "#datepicker" ).datepicker({
		   dateFormat : 'yy-mm-dd',
		   monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   showMonthAferYear : true,
	   	   yearSuffix : "년", //2020년 3월
	   	   showOtherMonths : true,
	   	   dayNamesMin : ['일','월','화','수','목','금','토'],
	   	   minDate : 0, //오늘이전은 선택불가
	   	   onSelect : function(){
	   		   //$('option').attr('style','display:""').css('color','black'); //모든 버튼 초기화
	   		   $('#bk_stime').children().attr('disabled',false).css('color','black'); //모든 버튼 초기화
	   		   $('#bk_etime').children().attr('disabled',false).css('color','black');
	   		   var today = new Date(); //지금 시점 (날짜 + 시간)
	   		   var y = today.getFullYear();// y=2020
	   		   var m = today.getMonth()+1; // m=3
	   		   if((''+m).length == 1){     // m이 1~9사이일 경우
	   			   m = '0'+m;  // m='03'
	   		   }
	   		   var d = today.getDate();    // d=4
	   		   if(d<=9){
	   			   d = '0'+d;  // d='04'
	   		   }
	   		   var todayStr = y+'-'+m+'-'+d;  //todayStr = 2020/03/04
	   		   var bk_date= $('input[name=bk_date]').val();
	   		   if(todayStr == bk_date){ //오늘을 선택 > 현재시간 이전은 선택불가
	   		   	   var h = today.getHours(); //현재시간
	   		   	   var i = 0;
	   		   	   for(var i=9; i<=h; i++){
	   		   		   //$('#st_no'+i).attr('style','display:none;').css('color','#dadada');
	   		   	    	$('#st_no'+i).attr('disabled','disabled').css('color','#dddddd');
	   		   	   }//for
	   		   	   for(var j=9; j<=i; j++){
	   		   		    $('#et_no'+j).attr('disabled','disabled').css('color','#dddddd');
		   		   }
	   		   }else{
				   var k = $('#bk_stime').val();
				   var q = $('#bk_etime').val();
				   $('#bk_stime').change(function(){
					   var k = $('#bk_stime').val();
					   $('#bk_etime').children().attr('disabled',false).css('color','black');
					   for(var j=9; j<=k; j++){
						    $('#et_no'+j).attr('disabled','disabled').css('color','#dddddd');
				   	   }
				   });
				   //
				   $('#bk_etime').change(function(){
					   var k = $('#bk_etime').val();
					   $('#bk_stime').children().attr('disabled',false).css('color','black');
					   for(var j=k; j<=23; j++){
						    $('#st_no'+j).attr('disabled','disabled').css('color','#dddddd');
				   	   }
				   });
		   	   }
	   		var roomname = $("#r_no").find("option:selected").text();
			var bk_date =$("#datepicker").val();
				if(roomname == '방선택'){
					roomname = '';
				}   
	   			$.ajax({
				   	url : '${conPath }/bookingViewList.do',
					dataType : "html",
					data : 'roomname='+roomname+'&bk_date='+bk_date,
					success : function(data){
						$('#showBookList').html(data);
				}
			});
		   	   
	   	   }// 콜백함수
	   });//datepicker함수
	   
	   $("#datepicker").click(function(){
		   $("#datepicker").val('');
		   $("#bk_stime option[value='']").prop("selected", true);
		   $("#bk_etime option[value='']").prop("selected", true);
		   $("input[name=bk_date]").css({
				"border" : "1px solid #a9a9a9",
				"background-color":"white"
				});
	   });
	   
	   $("#bk_stime").change(function(){
		   var k = parseInt($('#bk_stime').val())+1;
		   $("#bk_etime option[value="+k+"]").prop("selected", true);
		   $("#bk_stime").css({
				"border" : "1px solid #a9a9a9",
				"background-color":"white"
			});
		   $("#bk_etime").css({
				"border" : "1px solid #a9a9a9",
				"background-color":"white"
			});
	   })
	   // 예약 리스트 뿌리기
	   
	   // 방번호 
	   $("#r_no").change(function(){
		   $("#r_no").css({
				"border" : "1px solid #a9a9a9",
				"background-color":"white"
			});
			// ajax
			var roomname = $("#r_no").find("option:selected").text();
			var bk_date =$("#datepicker").val();
			if(roomname == '방선택'){
				roomname = '';
			} 
			if(bk_date!=''){
				$.ajax({
				   	url : '${conPath }/bookingViewList.do',
					dataType : "html",
					data : 'roomname='+roomname+'&bk_date='+bk_date,
					success : function(data){
						$('#showBookList').html(data);
					}
				});
			}else if(bk_date==''){
				$.ajax({
				   	url : '${conPath }/bookingViewList.do',
					dataType : "html",
					data : 'roomname='+roomname,
					success : function(data){
						$('#showBookList').html(data);
					}
				});
			}
	   })
	   $("#bk_etime").change(function(){
		   $("#bk_etime").css({
				"border" : "1px solid #a9a9a9",
				"background-color":"white"
			});
	   })
	   if($("#datepicker").val('')){
		   $("#bk_stime").children().attr('disabled','disabled').css('color','#dddddd');
		   $("#bk_etime").children().attr('disabled','disabled').css('color','#dddddd');
	   }else{
		   $('#bk_stime').children().attr('disabled',false).css('color','black'); //모든 버튼 초기화
   		   $('#bk_etime').children().attr('disabled',false).css('color','black');
	   }

	   // button 클릭시 이벤트  
	   $('#booking').click(function(){
		    var stime = $("#bk_stime").val();
			var etime = $("#bk_etime").val();
			var bk_date = $('#datepicker').val();
			var bk_stime = bk_date+' '+stime+":00:00";
			var bk_etime = bk_date+' '+etime+":00:00";
			var r_no = $('#r_no').val();
			if($("#r_no").val()==''){
				alert('방을 선택하세요');
				$("#r_no").css({
						"border" : "1px dashed #ffb400",
						"background-color":"lemonchiffon"
					});
				return false;
			}
		   if($("input[name=bk_date]").val()==''){
				alert('예약 날짜 입력바람');
				$("input[name=bk_date]").css({
						"border" : "1px dashed #ffb400",
						"background-color":"lemonchiffon"
					});
				return false;
			}
			if($("#bk_stime").val()=='' || $("#bk_etime").val()=='' || $("#bk_stime").val()==null || $("#bk_etime").val()==null){
				alert('예약 시간 입력바람');
				$("#bk_stime").css({
					"border" : "1px dashed #ffb400",
					"background-color":"lemonchiffon"
				});
				$("#bk_etime").css({
					"border" : "1px dashed #ffb400",
					"background-color":"lemonchiffon"
				});
				return false;
			}
			alert("시작시간"+bk_stime+"/종료시간"+bk_etime);
			location.href='${conPath}/booking.do?bk_date='+bk_date+'&bk_stime='+bk_stime+'&bk_etime='+bk_etime+'&r_no='+r_no+'&bk_no='+bk_no;
	    });
		$('#r_no').change(function(){

			});	   
	} );//ready함수
	  </script>
</head>
<body>
	<c:if test="${not empty bookConfirm}">
		<script>
			alert("${bookConfirm}");
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div id="content_wrap">
	<div class="book_step">
				<ul>
					<li class="step_ov"><b>STEP1</b> <br><span>이용인원 및 날짜선택</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_off"><b>STEP2</b> <br><span>이용정보입력 및 비용결제</span></li>
					<li class="step_arrow"> &gt; </li>
					<li class="step_off"><b>예약완료</b> <br><span>예약안내메일 수신</span></li>
				</ul>
	</div>
	<div class="book_noti01">
				<ul>
					<h5>실시간예약 이용방법</h5>
					<li>- 기본예약 시간은 1시간이며, 1시간 단위로 신청하실 수 있습니다.</li>
					<li>- 이용시간 전부터 실시간 예약하실 수 있습니다. (인터넷예약 이용문의 : 02-1111-2222)</li>
					<li>- 신청일 기준 매월 1일 마다 익익월 1일~말일까지 1개월분 예약이 오픈되며, 최대 약 3개월 전부터 예약이 가능합니다. <br> (단, 2인의 경우 : 매주 월요일 그 다음주 월~일요일까지 7일분에 대한 예약이 추가로 오픈 되므로 최대 약 14일 전부터 예약이 가능합니다)
					</li>					
				</ul>
				<ul style="background:#f7f7f7;padding:15px">
					<h5>인원별 예약일정의 예</h5>
					<li>* 3인 이상 예약의 경우 : [신청일] 2018년 1월 1일 00시부터, [이용예정일] 3월 1일(익익월 1일) ~ 3월 말일(익익월 말일)에 대한 1개월분 예약이 추가로 열려 1월 1일~3월 말일 예약이 가능</li>
					<li>* 2인의 경우 : [신청일] 2018년 1월 1일 월요일 00시부터, [이용예정일] 그 다음주인 1월 8일 월요일 ~1월14일 일요일까지 7일분에 대한 예약이 추가로 열려 1월 1일 월요일 ~ 1월 14일 일요일 예약이 가능</li>					
				</ul>
			</div>
	<div class="book_table">
	<h2 style="border:none">STEP1.이용일시 및 인원선택</h2>
	<form action="bookView.do">
	
	<table>
		<tbody>
			<tr>
				<td class="td1">
					스터디룸
				</td>
				<td>
					<select name="r_no" id="r_no">
						<option value="">방선택</option>
						<c:forEach items="${room_booklist}" var="room">
							<option value="${room.r_no }">${room.r_name}</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
			<tr>
				<td class="td1">
					이용날짜
				</td>
				<td>
					<input type="text" id="datepicker" name="bk_date" placeholder="YYYY-MM-DD" readonly="readonly">
				</td>
			</tr>
			<tr id="book_table_list">
				<td class="td1">
					예약 현황
				</td>
				<td id="showBookList">
					
				</td>
			</tr>
			<tr class="time_table">
				<td class="td1">
					이용시간
				</td>
				<td>
					 <select name="bk_stime" id="bk_stime" >
					 		<option value="">선택</option>
							<option value="9" id="st_no9" >09:00</option>
							<option value="10" id="st_no10">10:00</option>
							<option value="11" id="st_no11">11:00</option>
							<option value="12" id="st_no12">12:00</option>
							<option value="13" id="st_no13">13:00</option>
							<option value="14" id="st_no14">14:00</option>
							<option value="15" id="st_no15">15:00</option>
							<option value="16" id="st_no16">16:00</option>
							<option value="17" id="st_no17">17:00</option>
							<option value="18" id="st_no18">18:00</option>
							<option value="19" id="st_no19">19:00</option>
							<option value="20" id="st_no20">20:00</option>
							<option value="21" id="st_no21">21:00</option>
							<option value="22" id="st_no22">22:00</option>
							<option value="23" id="st_no23">23:00</option>
                      </select> 시 
                  	  ~
                  	  <select name="bk_etime" id="bk_etime">
                  	  		<option value="">선택</option>
							<option value="10" id="et_no10" >10:00</option>
							<option value="11" id="et_no11">11:00</option>
							<option value="12" id="et_no12">12:00</option>
							<option value="13" id="et_no13">13:00</option>
							<option value="14" id="et_no14">14:00</option>
							<option value="15" id="et_no15">15:00</option>
							<option value="16" id="et_no16">16:00</option>
							<option value="17" id="et_no17">17:00</option>
							<option value="18" id="et_no18">18:00</option>
							<option value="19" id="et_no19">19:00</option>
							<option value="20" id="et_no20">20:00</option>
							<option value="21" id="et_no21">21:00</option>
							<option value="22" id="et_no22">22:00</option>
							<option value="23" id="et_no23">23:00</option>
						 </select> 시 
				</td>
			</tr>
		</tbody>
	</table>
	<ul>
					<li><b><font color="red">이용 시작시간 선택 시 24시 표시제이므로 오전오후에 유의 해 주세요</font></b>
					</li><li><b>준비시간</b> : 이용하실 시간에 준비시간이 포함됩니다. 준비시간이 필요하신 경우 앞 시간 1시간을 여유 있게 선택 해 주세요</li>
					<li><b>사용장비</b> : 사용 장비은 룸에 포함되 있으므로 원하시는 장비가 포함된 룸을 확인 후 선택해 주세요</li>
					<li><b>※인원에 맞는 룸을 선택해 주세요. </b><br>
					</li>
					</ul>
		<div class="btn_list">
			<input type="button" value="예약하기" class="sub_btn" id="booking">
			<input type="reset" value="다시선택" class="sub_btn">
		</div> 
	</form>
	</div>
	</div>
	<jsp:include page="../main/side.jsp" />
	<jsp:include page="../main/footer.jsp" />
		           
	
</body>
</html>