<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">

<script type="text/javascript">
	function check(){
		if(f.id.value == ""){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}
		if(f.password.value == ""){
			alert("비밀번호를 입력해주세요.");
			f.password.focus();
			return false;
		}
	}
</script>

<%@ include file="mainTop.jsp"%>
<form method="post" action="loginPro.jsp" name="f">
<table align="center" class="table" height="300">
	<h3><font color="#5F00FF">로그인</font></h3><br>
	<tr>
		<td>아이디 : 
		<td><input type="text" name="id">
	</tr>
	<tr>
		<td>비밀번호 : 
		<td><input type="password" name="password">
	</tr>
	<tr>
	<td colspan="2" align="center">
	<input type="submit" value="로그인" class="btn btn-default" onclick="return check()">
	<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default"><br><br>
	<a href="findId.jsp"><font color=#747474>아이디 찾기</font></a> | 
	<a href="findPw.jsp"><font color=#747474>비밀번호 찾기</font></a> | 
	<a href="<%=request.getContextPath() %>/Mall/member/newMember.jsp"><font color=#747474>회원가입</font></a>
	</tr>
</table>
</form>

<%@ include file="mainBottom.jsp"%>