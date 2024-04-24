<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#profileList").click(function(){
			$("#profileList2").fadeToggle("fast");
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
	Integer no = (Integer)session.getAttribute("no");
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
		<td align="center" style="padding-top: 20px; width: 100px;">
		<a href="<%=request.getContextPath() %>/main.jsp">
		<font color="#5F00FF">Project</font></a></td>
			<td align="center">
			<form method="post" action="<%=request.getContextPath() %>/Mall/member/searchInfo.jsp">
			<input type="text" name="selProduct" size="40">&nbsp;
				<button type="submit" class="btn btn-default">✓</button>
				</form>
				<td width="80px;">
				</tr>
				<tr id="login">
					<td colspan="3" align="right" valign="top">
					<span><font color="#5F00FF"><%=id%>님</font></span>
					<a href="<%=request.getContextPath() %>/logout.jsp"><font color="silver">로그아웃</font></a>
					<a href="<%=request.getContextPath() %>/Mall/member/newMember.jsp"><font color="silver">회원가입</font></a>
					</td>
				</tr>

		<td>
		<table align="center">
		<div id="profileList">
		<tr>
		<td align="center" valign="top" height="500">
		 <ul class="nav nav-tabs">
      		<li><a id="adList"><font color="blue">Menu</font></a></li>
    	</ul>
      		<div id="profileList2"><br>
      		<a href="<%=request.getContextPath() %>/Mall/profile/list.jsp"><font color="blue">구매내역</font></a></li><br><br>
			<a href="<%=request.getContextPath() %>/Mall/profile/myInfo.jsp?no=<%=no %>"><font color="blue">개인정보확인</font></a><br><br>
			<a href="<%=request.getContextPath() %>/Mall/board/list.jsp"><font color="blue">문의하기</font></a><br><br>
			<a href="<%=request.getContextPath() %>/Mall/profile/addItem.jsp"><font color="blue">장바구니</font></a><br><br>
			
			</div>
			</tr>
			</div>
		</table>
			<td valign="top" align="center" id="adList3" width="80%">