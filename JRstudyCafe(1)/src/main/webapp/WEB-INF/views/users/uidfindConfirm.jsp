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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="login_wrap">
    <h2 class="users_title">아이디 찾기</h2>
    <br>
    <h3>고객님의 정보와 일치하는 아이디 입니다.</h3>
    <div class="tab_cnt">
        <form action="${conPath}/pwfind.do" method="get">
            <div class="inpbx">
    			<input type="text" class="u_id" name="u_id" placeholder="아이디 입력" value="${u_id }">
    		</div>
    		<div style="color: red;">${resultId}</div>
    		<div class="inpbx">
    			<input type="text" class="u_email" name="u_email" placeholder="이메일 입력" value="${u_email }">
    		</div>
    		<div style="color: red;">${resultEmail}</div>
            <input class="insub" type="submit" value="비밀번호 찾기">          
        </form>
    	<ul>
            <li class="li1"><a href="${conPath}/joinView.do">회원가입 </a></li>
            <li class="li1"> <a href="${conPath }/loginView.do">로그인</a></li>
            <li> <a href="${conPath }/idfindView.do">아이디 찾기</a></li>
        </ul>
		</div>
	</div>
</body>
</html>