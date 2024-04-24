<%@page import="catePkg.CateBean"%>
<%@page import="catePkg.CateDao"%>
<%@page import="memberPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cate").click(function(){
			$("#cate2").fadeToggle("fast");
		});
	});
	
</script>
<style type="text/css">
	#cate2{
	display: none;
	}
	#cateList{
	width: 100px;
	}
	#title{
	text-align: center;
	width: 100px;
	}
</style>

<%
	CateDao cdao = CateDao.getInstance();
	ArrayList<CateBean> lists = cdao.cateList();
	
	String id = (String)session.getAttribute("id");
%>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">

	<table align="center" width="80%">
	<h2 align="center">
	<a href="<%=request.getContextPath() %>/main.jsp"><font color="#D1B2FF"><font color="#D1B2FF">P쇼핑몰</font></font></h2></a><br>
		<tr>
		<td id="title"><a href="<%=request.getContextPath() %>/main.jsp">
		<font color="#5F00FF">Project</font></a></td>
		
			<td align="center">
				</form>
				<%if(id == null){
				}else{
					%>
				<td align="center" width="200"><a href="<%=request.getContextPath()%>/Mall/order/addItem.jsp"><font color="black">장바구니</font></a> 
				<%if(id != null && id.equals("admin")){ %>
				| <a href="<%=request.getContextPath() %>/Mall/admin/admin_main.jsp"><font color="black">관리자 메인</font></a>
				<%}
				}%>
				</td>
				</tr>
				<%
					if(id==null){
				 %>
				<tr>
				<td colspan="3" align="right" valign="top">
				<a href="<%=request.getContextPath() %>/login.jsp"><font color="silver">로그인</font></a>&nbsp;&nbsp;
				<a href="<%=request.getContextPath() %>/Mall/member/newMember.jsp"><font color="silver">회원가입</font></a>
		</td>
		</tr>
				<%}else{
					%>
					<tr>
				<td colspan="3" align="right" valign="top">
					<span><a href="<%=request.getContextPath() %>/Mall/profile/list.jsp"><font color="#5F00FF"><%=id%>님</font></a></span>
					<a href="<%=request.getContextPath()%>/logout.jsp"><font color="silver">로그아웃</font></a>
					</td>
		</tr>
<%}%>
		<tr>
		<td valign="top"></td>
			<td valign="top" align="center" id="cate3">
