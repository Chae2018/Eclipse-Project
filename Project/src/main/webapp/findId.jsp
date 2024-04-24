<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    function findCheck(){
    	if(f.name.value == ""){
			alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
    	if(f.hp2.value == ""){
			alert("휴대폰 번호를 입력해주세요.");
			f.hp2.focus();
			return false;
		}
		if(f.hp3.value == ""){
			alert("휴대폰 번호를 입력해주세요.");
			f.hp3.focus();
			return false;
		}
    }
    </script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">

<%@ include file="mainTop.jsp"%>
<form method="post" action="findIdPro.jsp" name="f">
<table align="center" class="table" height="300">
	<h3><font color="#5F00FF">아이디 찾기</font></h3><br>
	<tr>
		<td>이름 :
		<td><input type="text" name="name" placeholder="이름">
	</tr>
	<tr>
		<td>연락처 :
	<td><select name="hp1">
	<option value="010">010
	<option value="011">011
	<option value="012">012
	</select> - 
	<input type="text" name="hp2" size="8" placeholder="휴대폰 번호" maxlength="4"> - 
	<input type="text" name="hp3" size="8" maxlength="4">
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="아이디 찾기" onclick="return findCheck()" class="btn btn-default">
	<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default">
</tr>
</table>
</form>
<%@ include file="mainBottom.jsp"%>