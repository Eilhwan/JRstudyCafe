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
<style>
*{
	margin: 0;
	padding: 0;
}
ul{
	list-style: none;
}
a{
	text-decoration: none;
	color: black;
}
.login_wrap{
	max-width: 400px;
    margin: 0 auto;
}
.users_title{
	margin-bottom: 20px;
    color: #000;
    font-size: 25px;
    font-weight: 500;
    text-align: center;
	
}
.tab_cnt{
	width:100%;
	padding-top: 18px;
    border-top: 4px solid #000;
}
.inpbx{
	width: 100%;
    height: 48px;
    border: 1px solid lightgray;
    margin-top: 10px;
    margin-bottom: 10px;
}
.inpbx input{
	box-sizing:border-box;
	display: block;
    width: 100%;
    height: 100%;
    font-size: 14px;
    border: none;
    outline: none;
    padding: 0 14px;
    font-size: 1.1em;
}
.insub{
	width: 100%;
    height: 60px;
    margin: 30px 0;
    background: #000;
    color: #fff;
    font-size: 16px;
    line-height: 60px;
    font-weight: 500;
    border: none;
}
.tab_cnt ul{
    display: flex;
    justify-content: center;
}
.tab_cnt ul li{
	position: relative;
    display: inline-block;
    padding: 0 20px;
}
.li1{
	border-right: 1px solid lightgray;
}

</style>
</head>
<body>
	<c:if test="${not empty result }">
		<script>
			alert('${result}');
		</script>
	</c:if>
	<c:if test="${not empty resultupwfind }">
		<script>
			alert('${resultupwfind}');
		</script>
	</c:if>
	
	<div class="login_wrap">
    <h2 class="users_title">로그인</h2>

    <div class="tab_cnt">
        <form action="${conPath }/login.do" method="post">
            <div class="inpbx">
    			<input type="text" name="u_id" required="required" value="${u_id }" placeholder="아이디를 입력">
                
    		</div>
    		<div class="inpbx">
    			<input type="password" name="u_pw" required="required" placeholder="비밀번호">
               
    		</div>
            <input class="insub" type="submit" value="로그인하기">          
        </form>
        <ul>
            <li class="li1"><a href="${conPath}/joinView.do">회원가입 </a></li>
            <li class="li1"><a href="${conPath }/idfindView.do">아이디 찾기</a></li>
            <li > <a href="${conPath }/pwfindView.do">비밀번호 찾기</a></li>
        </ul>
    
		</div>
	</div>
</body>
</html>