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
</style>

<%
	CateDao cdao = CateDao.getInstance();
	ArrayList<CateBean> lists = cdao.cateList();
	
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
		<td align="center" width="100px;"><a href="<%=request.getContextPath() %>/main.jsp">
		<font color="#5F00FF">Project</font></a></td>
		
			<td align="center">
			
		<form method="post" action="<%=request.getContextPath() %>/Mall/member/searchInfo.jsp">
			<input type="text" name="selProduct" size="40" style="margin-left: 120px;">&nbsp;
				<button type="submit" class="btn btn-default">✓</button>
				</form>
				<%if(id == null){
				}else{
					%>
				<td align="center" width="200">
				<a href="<%=request.getContextPath()%>/Mall/order/addItem.jsp">
				<font color="black">장바구니</font></a> 
				<%if(id != null && id.equals("admin")){ %>
				| <a href="<%=request.getContextPath() %>/Mall/admin/user.jsp"><font color="black">관리자 메인</font></a>
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
					<a href="<%=request.getContextPath()%>/logout.jsp"><font color="silver">로그아웃</a>
					</td>
		</tr>
<%}%>
		<tr>
		<td valign="top">
		<table width="100" id="cateList">
		<div>
		<tr style="border: 1px solid #EAEAEA;">
		<td align="center" valign="top">
		 <ul class="nav nav-tabs">
      		<li><a id="cate"><font color="blue">카테고리</font></a></li>
      		<div id="cate2">&nbsp;
      		<%for(CateBean cb : lists){ %>
			<li><a href="<%=request.getContextPath()%>/listType.jsp?cname=<%=cb.getCname()%>"><font color="blue"><%=cb.getCname()%></font><br><br></a>
			<%}%>
			</div>
    	</ul>
			</tr>
			</div>
		</table>
			<td valign="top" align="center" id="cate3" height="500">
