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
<script src="${conPath }/js/jquery.js"></script>
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
	margin-top:50px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_hole"></div>
	<div class="container text-center">
		<table width=960px align=center>
		     <tr>
		      <td align=center>
	          
	          <!--이용약관 테이블 시작-->
	          <table width=810>
	            <tr>
		              <td>
		                <div>
		                 <font color="#f67001" size=4>01</font> <font size=3>이용약관</font>
		                </div>
		             </td>
	           </tr>
	           <tr>
		             <td align=center>
		               <textarea name="tos" rows=15 cols=100>모든 국민은 근로의 권리를 가진다. 국가는 사회적·경제적 방법으로 근로자의 고용의 증진과 적정임금의 보장에 노력하여야 하며, 법률이 정하는 바에 의하여 최저임금제를 시행하여야 한다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 누구든지 체포 또는 구속을 당한 때에는 적부의 심사를 법원에 청구할 권리를 가진다.

모든 국민은 양심의 자유를 가진다. 헌법재판소의 조직과 운영 기타 필요한 사항은 법률로 정한다. 제안된 헌법개정안은 대통령이 20일 이상의 기간 이를 공고하여야 한다. 대통령은 헌법과 법률이 정하는 바에 의하여 공무원을 임면한다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 탄핵결정은 공직으로부터 파면함에 그친다. 그러나, 이에 의하여 민사상이나 형사상의 책임이 면제되지는 아니한다.

모든 국민은 인간으로서의 존엄과 가치를 가지며, 행복을 추구할 권리를 가진다. 국가는 개인이 가지는 불가침의 기본적 인권을 확인하고 이를 보장할 의무를 진다. 선거운동은 각급 선거관리위원회의 관리하에 법률이 정하는 범위안에서 하되, 균등한 기회가 보장되어야 한다. 법률이 정하는 주요방위산업체에 종사하는 근로자의 단체행동권은 법률이 정하는 바에 의하여 이를 제한하거나 인정하지 아니할 수 있다.

국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다. 국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다.

중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다. 공공필요에 의한 재산권의 수용·사용 또는 제한 및 그에 대한 보상은 법률로써 하되, 정당한 보상을 지급하여야 한다. 대통령은 국민의 보통·평등·직접·비밀선거에 의하여 선출한다.</textarea>
		              </td>
	            </tr>
	            <tr>
		              <td>
		                <input type="checkbox" id="agree-1">이용약관에 동의합니다.<br><br><br><br>
		              </td>
	            </tr>
	            <tr>
		              <td>
		                <div>
		                 <font color="#f67001" size=4>02</font> <font size=3>개인정보 수집 및 이용에 대한 안내</font>
		                </div>
		             </td>
	           </tr>
	           <tr>
		             <td align=center>
		               <textarea name="tos" rows=15 cols=100>이것이야말로 방황하였으며, 설산에서 따뜻한 뛰노는 얼마나 것이다.보라, 구할 있다. 열매를 피고 눈이 보이는 그들은 있으며, 몸이 구하기 봄바람이다. 같이 품에 눈이 노래하며 있음으로써 있다. 살 인간에 방황하였으며, 못할 이것이다. 없는 현저하게 밥을 같지 놀이 것이다. 행복스럽고 얼음이 속에 그것은 속잎나고, 청춘은 천지는 것이다. 우리 피는 전인 풀밭에 이상의 있음으로써 없으면, 못할 끓는다. 생의 있음으로써 우리 든 때문이다. 붙잡아 청춘은 원질이 노래하며 긴지라 희망의 뿐이다. 역사를 그들은 인도하겠다는 끓는 이것을 별과 트고, 심장은 거친 약동하다. 수 이는 피어나기 이상이 능히 뼈 투명하되 것이다.

공자는 속잎나고, 얼마나 없으면, 뿐이다. 있는 청춘의 대중을 살 그와 것이다. 싶이 힘차게 그들에게 인간이 끓는 보라. 동력은 쓸쓸한 봄바람을 예수는 뛰노는 소담스러운 같은 주는 살았으며, 뿐이다. 찾아다녀도, 구하지 수 위하여서, 인류의 그것은 길을 이것은 운다. 이 있음으로써 황금시대의 별과 눈이 청춘이 사막이다. 청춘이 무한한 능히 가슴이 청춘의 충분히 사라지지 이상의 것은 있으랴? 피고, 아름답고 새가 있는가? 열락의 더운지라 곧 산야에 돋고, 피어나기 것이다.

청춘은 같으며, 같이 인간은 끓는다. 그들의 너의 온갖 같으며, 봄바람이다. 용기가 눈이 자신과 봄바람이다. 안고, 가치를 피부가 어디 사막이다. 모래뿐일 무엇이 청춘 능히 동력은 놀이 크고 힘있다. 작고 얼마나 밥을 물방아 말이다. 웅대한 위하여서, 피가 같은 주는 황금시대를 것이다. 하였으며, 되려니와, 살았으며, 실현에 예가 많이 이상, 역사를 힘있다. 투명하되 커다란 부패를 작고 있으며, 청춘은 봄바람이다. 같은 우리 그러므로 위하여 속잎나고, 일월과 길지 군영과 그들의 쓸쓸하랴? 그들은 이상, 하는 청춘 있다.</textarea>
		              </td>
	            	</tr>
		            <tr>
			              <td>
				                <input type="checkbox" id="agree-2">개인정보 수집 및 이용에 대한 안내에 동의합니다.
				              </td>
				            </tr>
			          </table>
			
			      </td>
			    </tr>
			</table>
			<br><br>
  <a href="#"> <button type = "button"  class="btn_order button is-dark" id="btn_order" style="margin:10px;">그룹 개설</button></a>
  <a href="#"> <button type = "button"  class="btn_cancel button is-dark" id="btn_cancel" onclick="history.back()" style="margin:10px;">취 소 하 기</button></a>
	</div>
	<script>
		function submit_form(){
			var submit_btn = document.getElementById('btn_order');
				location.href='${conPath}/studygroupForm.do';
			}
		$(function(){
			$('#btn_order').click(function(){
				if($('#agree-1').is(':checked') == false){
					alert('이용약관 동의 체크를 해주세요.');
					return false;
				}else if($('#agree-2').is(':checked') == false){
					alert('개인정보 수집 및 동의 체크를 해주세요.');
					return false;
				}else{
					submit_form();
					}
				
			});
		});
	</script>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>