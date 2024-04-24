<%@page import="memberPkg.MemberBean"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	System.out.println(hp1);
	System.out.println(hp2);
	System.out.println(hp3);
	System.out.println(name);
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.findId(name,hp1,hp2,hp3);
	
	String id, url;
	if(mb != null){
		id = mb.getId();
		url = request.getContextPath()+"/login.jsp";
	}else{
		id = "회원정보가 없습니다.";
		url = request.getContextPath()+"/findId.jsp";
	}
%>
<script type="text/javascript">
	alert("ID: <%=id%>");
	location.href="<%=url%>";
</script>