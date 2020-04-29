<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
  li{
    
  }
</style>
<script src="../js/jquery-1.10.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('form').submit(function(){ 
   		if($('.u_email').val()==''){
		       alert("e-mail 를 입력하세요");
		       $('.u_email').focus();
		       return false;
		   }
   		if($('.u_name').val()==''){
		       alert("이름 를 입력하세요");
		       $('.u_name').focus();
		       return false;
		   }
	  });
 
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="left">
	  <form action="${conPath }/idfind.do" method="post">
	    <fieldset>
	      <legend class="hidden"> ID찾기</legend>
	      <ul id="u_findId">
	       <li>ID찾기</li>
	       <li><label>입력한 이메일</label><input type="text" id="u_email" name="u_email"/><li>
	       <li><label>이름</label><input type="text" id="u_name" name="u_name"/><li>
	       <li><input type="submit" name="btnFindUid" id="btnFindUid" value="아이디 찾기"/></li>
	      </ul>
	    </fieldset>
	  </form>
	</div>
</body>
</html>