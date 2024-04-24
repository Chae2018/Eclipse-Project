<%@page import="memberPkg.MemberBean"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");

	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.findPw(id,name);
	
	String pw, url;
	if(mb != null){
		pw = mb.getPassword();
		url = request.getContextPath()+"/login.jsp";
	}else{
		pw = "회원정보가 없습니다.";
		url = request.getContextPath()+"/findPw.jsp";
	}
%>
<script type="text/javascript">
	alert("PW : <%=pw%>");
	location.href="<%=url%>";
</script>