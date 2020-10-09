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
#side_banner {
	position: fixed;
    top: 720px;
    right: 60px;
    z-index: 99999;
    width:75px;
}
#side_banner a {
	text-decoration: none;
    color: black;
    width:75px;
}
</style>
</head>
<body>
	<div id="side_banner">
            <div>
                <a href="">
                    <div><img src="images/카카오버튼.png" alt="로그인아이콘" width="70"/></div>
                </a>
            </div>
            <div><a href="">&nbsp;▲ TOP</a></div>
        </div>
</body>
</html>