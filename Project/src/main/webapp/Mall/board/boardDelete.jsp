<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../profile/profileTop.jsp"%>
<%
MemberDao mdao = MemberDao.getInstance();
MemberBean mb = mdao.updateSelMember(no);
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<script type="text/javascript">
function check(){
	var pw = '<%=mb.getPassword()%>';

	if(f.writer.value == ""){
		alert("아이디를 입력해주세요.");
		f.writer.focus();
		return false;
	}
	if(f.passwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		f.passwd.focus();
		return false;
	}
	if(f.passwd.value != pw){
		alert("비밀번호가 틀립니다..");
		f.passwd.focus();
		return false;
	}
}

</script>

<form name="f" method="post" action="boardDeletePro.jsp?pageNum=<%=pageNum %>">
<input type="hidden" name="num" value="<%=num %>">
<table class="table">
	<tr>
		<td align="center" colspan="2">글 삭제</td>
	</tr>
	<tr>
		<td>작성자 : </td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="passwd"></td>
	</tr>
</table>
	<input type="submit" value="삭제" onclick="return check()" class="btn btn-default">
	<input type="button" value="목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'" class="btn btn-default">
</form>
<%@include file="../profile/profileBottom.jsp"%>