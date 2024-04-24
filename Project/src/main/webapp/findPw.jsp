<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <script type="text/javascript">
    function findCheck(){
    	if(f.name.value == ""){
			alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
    	if(f.id.value == ""){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}
    }
    </script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">

<%@ include file="mainTop.jsp"%>
<form method="post" action="findPwPro.jsp" name="f">
<table align="center" class="table" height="300">
	<h3><font color="#5F00FF">비밀번호 찾기</font></h3><br>
	<tr>
		<td>이름 : 
		<td><input type="text" name="name" placeholder="이름">
	</tr>
	<tr>
		<td>아이디 : 
		<td><input type="text" name="id" placeholder="아이디">
	</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="비밀번호 찾기" onclick="return findCheck()" class="btn btn-default">
	<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default">
</tr>
</table>
</form>
<%@ include file="mainBottom.jsp"%>