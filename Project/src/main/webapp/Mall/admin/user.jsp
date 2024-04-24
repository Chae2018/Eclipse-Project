<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	table{
		text-align: center;
	}
</style>
<%@include file="adminTop.jsp"%>
<%
	MemberDao mdao = MemberDao.getInstance();
	ArrayList<MemberBean> lists = mdao.allUser();
%>
<table class="table">
<h3 align="center"><font color="#5F00FF">사용자</font></h3><br>
<tr>
	<td>번호
	<td>이름
	<td>연락처
	<td>성별
	<td>이메일
	<td>수정
	<td>삭제
</tr>
	<%
	if(lists.size() == 0){
		%>
		<tr>
			<td colspan="7" align="center">
				사용자가 없습니다.
		</tr>
		<%
	}else{
   for(MemberBean mb : lists){
   %>
	<tr>
		<td><%=mb.getNo() %></td>
		<td><%=mb.getName() %></td>
		<td><%=mb.getHp1() %> - <%=mb.getHp2() %> - <%=mb.getHp3() %></td>
		<td><%=mb.getGender() %></td>
		<td><%=mb.getEmail1() %> @ <%=mb.getEmail2() %></td>
		<td><a href="updateMember.jsp?no=<%=mb.getNo()%>" class="btn btn-default">수정</a></td>
		<td><a href="deleteMember.jsp?no=<%=mb.getNo()%>" class="btn btn-default">삭제</a></td>
	</tr>
<%}
}%>
</table>
</td>
<%@include file="adminBottom.jsp"%>
