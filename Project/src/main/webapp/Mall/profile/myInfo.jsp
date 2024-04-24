<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function check(){
	if(f.password.value == ""){
		alert("비밀번호를 입력해주세요.");
		f.password.focus();
		return false;
	}
	if(f.passwordCheck.value == ""){
		alert("비밀번호를 입력해주세요.");
		f.passwordCheck.focus();
		return false;
	}
	if(f.passwordCheck.value != f.password.value){
		alert("비밀번호가 틀립니다.");
		f.password.focus();
		return false;
	}
	if(f.email1.value == ""){
		alert("이메일을 입력해주세요.");
		f.email1.focus();
		return false;
	}
	if(f.email2.value == ""){
		alert("이메일을 입력해주세요.");
		f.email2.focus();
		return false;
	}
}
</script>
<%@include file="profileTop.jsp"%>
<%
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.updateSelMember(no);
%>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">


<form action="<%=request.getContextPath() %>/Mall/admin/updateMemberPro.jsp" method="post" name="f">
<table align="center" class="table" style="border: 1px solid silver;">
<input type="hidden" name="no" value="<%=no%>">
<tr>
	<td>아이디 : 
	<td><%=mb.getId() %>
	<input type="hidden" name="id" value="<%=mb.getId() %>">
</tr>
<tr>
	<td>비밀번호 : 
	<td><input type="text" name="password" placeholder="비밀번호" value="<%=mb.getPassword()%>"><br>
</tr>
<tr>
	<td>비밀번호확인 : 
	<td><input type="text" name="passwordCheck" placeholder="비밀번호 확인" value="<%=mb.getPassword()%>"><br>
	<span id="message2"></span>
</tr>
<tr>
	<td>이름 : 
	<td><%=mb.getName()%>
	<input type="hidden" name="name" value="<%=mb.getName()%>">
</tr>
<tr>
	<td>이메일 : 
	<td><input type="text" name="email1" placeholder="이메일" size="12" value="<%=mb.getEmail1()%>"> @ 
	<input type="text" name="email2" size="12"value="<%=mb.getEmail2()%>">
</tr>
<tr>
	<td>주민등록번호 : 
	<td><%=mb.getResiNum()%> - <%=mb.getResiNum2()%>
	<input type="hidden" name="resiNum" value="<%=mb.getResiNum()%>">
	<input type="hidden" name="resiNum2" value="<%=mb.getResiNum2()%>">
</tr>
<tr>
	<td>성별 : 
	<td><%=mb.getGender() %>
	<input type="hidden" name="gender" value="<%=mb.getGender()%>">
</tr>
<tr>
	<td>연락처 : 
	<td><%=mb.getHp1()%> - <%=mb.getHp2()%> - <%=mb.getHp3()%>
	<input type="hidden" name="hp1" value="<%=mb.getHp1()%>">
	<input type="hidden" name="hp2" value="<%=mb.getHp2()%>">
	<input type="hidden" name="hp3" value="<%=mb.getHp3()%>">
</tr>

</table>
<br>
<div align="center">
<input type="submit" value="수정하기" onclick="return check()" class="btn btn-default">&nbsp;
<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default"> 
</div>
</form>
<%@include file="profileBottom.jsp"%>