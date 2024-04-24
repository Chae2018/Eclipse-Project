<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#adList").click(function(){
			$("#adList2").fadeToggle("fast");
		});
	});
	
</script>
<style type="text/css">
	#adList2{
	display: none;
	}
	#adminList{
		width: 100px;
	}
</style>
<%
	String id = (String)session.getAttribute("id");
%>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">
	<table align="center" width="80%">
		<a href="<%=request.getContextPath() %>/main.jsp">
			<h2 align="center">
				<font color="#D1B2FF">P쇼핑몰</font>
			</h2>
		</a>
	<br>
		<tr>
		<td align="center" style=" width: 100px;">
		<a href="<%=request.getContextPath() %>/main.jsp">
		<font color="#5F00FF">Project</font></a></td>
			<td align="center">
			<form method="post" action="<%=request.getContextPath() %>/Mall/member/searchInfo.jsp">
			<input type="text" name="selProduct" size="40">&nbsp;
				<button type="submit" class="btn btn-default">✓</button>
				</form>
				<td align="center" ><a href="<%=request.getContextPath()%>/Mall/admin/userList.jsp"><font color="black">결제내역조회</font></a>
				</td>
				</tr>
					<%
					if(id==null){
				 %>
				<tr>
				<td colspan="3" valign="top" align="right">
				<a href="<%=request.getContextPath() %>/login.jsp">로그인</a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath() %>/Mall/member/newMember.jsp">회원가입</a>
		</td>
		</tr>
				<%}else{
					%>
					<tr id="login">
				<td colspan="3" align="right" valign="top">
					<span><a href="<%=request.getContextPath() %>/Mall/profile/list.jsp"><font color="#8041D9"><%=id %>님</font></a></span>
					<a href="<%=request.getContextPath() %>/logout.jsp"><font color="silver">로그아웃</font></a>
					<a href="<%=request.getContextPath() %>/Mall/member/newMember.jsp"><font color="silver">회원가입</font></a>
					</td>
		</tr>
<%}%>
		<td valign="top">
		<table align="center">
		<div id="adminList">
		<tr>
		<td align="center" valign="top" height="500">
		 <ul class="nav nav-tabs">
      		<li><a id="adList"><font color="blue">Menu</font></a></li>
    	</ul>
      		<div id="adList2"><br>
      		<a href="<%=request.getContextPath() %>/Mall/admin/user.jsp"><font color="blue">사용자리스트</font></a></li><br><br>
			<a href="<%=request.getContextPath() %>/Mall/category/cateInsert.jsp"><font color="blue">카테고리등록</font></a><br><br>
			<a href="<%=request.getContextPath() %>/Mall/category/cateList.jsp"><font color="blue">카테고리목록</a><br><br>
			<a href="<%=request.getContextPath() %>/Mall/product/proInsert.jsp"><font color="blue">상품 등록</font></a><br><br>
			<a href="<%=request.getContextPath() %>/Mall/product/proList.jsp"><font color="blue">상품 목록</font></a><br><br>
			<a href="<%=request.getContextPath() %>/main.jsp"><font color="blue">메인 페이지</font></a><br><br>
			
			</div>
			</tr>
			</div>
		</table>
			<td valign="top" align="center" id="adList3" width="80%">