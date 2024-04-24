<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	if(f.name.value == ""){
		alert("이름을 입력해주세요.");
		f.name.focus();
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
	if(f.resiNum.value == ""){
		alert("주민등록번호를 입력해주세요.");
		f.resiNum.focus();
		return false;
	}
	if(f.resiNum2.value == ""){
		alert("주민등록번호를 입력해주세요.");
		f.resiNum2.focus();
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
<%
	int no = Integer.parseInt(request.getParameter("no"));
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.updateSelMember(no);
%>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">


<%@include file="adminTop.jsp"%>
<form action="updateMemberPro.jsp" method="post" name="f">
<table border="1" align="center" class="table">
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
	<td><input type="text" name="name" placeholder="이름" value="<%=mb.getName()%>">
</tr>
<tr>
	<td>이메일 : 
	<td><input type="text" name="email1" placeholder="이메일" size="12" value="<%=mb.getEmail1()%>"> @ 
	<input type="text" name="email2" size="12"value="<%=mb.getEmail2()%>">
</tr>
<tr>
	<td>주민등록번호 : 
	<td><input type="text" name="resiNum" placeholder="주민등록번호" maxlength="6" value="<%=mb.getResiNum()%>"> - 
	<input type="text" name="resiNum2" maxlength="7" value="<%=mb.getResiNum2()%>">
</tr>
<tr>
	<td>성별 : 
	<td>
	성별 : <select name="gender">
	<%String[] gender = {"남","여"};
		for(int i=0;i<gender.length;i++){ %>
	<option value="<%=gender[i]%>" <%if(mb.getGender().equals(gender[i])){%>selected<%}%>><%=gender[i]%></option>
<%}%>
</select>
</tr>
<tr>
	<td>연락처 : 
	<td><select name="hp1">
	<%String[] hp = {"010","011","012"}; %>
<%for(int i=0;i<hp.length;i++){ %>
	<option value="<%=hp[i]%>" <%if(mb.getHp1().equals(hp[i])){%>selected<%}%>><%=hp[i]%>
<%}%>
	</select> - 
	<input type="text" name="hp2" size="8" placeholder="휴대폰 번호" maxlength="4" value="<%=mb.getHp2()%>"> - 
	<input type="text" name="hp3" size="8" maxlength="4" value="<%=mb.getHp3()%>">
</tr>

</table>
<br>
<div align="center">
<input type="submit" value="수정하기" onclick="return check()" class="btn btn-default">&nbsp;
<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default"> 
</div>
</form>
<%@include file="adminBottom.jsp"%>