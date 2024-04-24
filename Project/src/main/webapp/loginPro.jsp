<%@page import="memberPkg.MemberBean"%>
<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.loginCheck(id, password);
	
	String msg,url;
	if(mb != null){
		if(id.equals("admin")){
			%>
			<script type="text/javascript">
				location.href="<%=request.getContextPath()%>/Mall/admin/user.jsp";
			</script>
			<%
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("no", mb.getNo());
		}else{
			%>
			<script type="text/javascript">
				location.href="main.jsp";
			</script>
			<%
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("no", mb.getNo());
		}
	}else{
		%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
			location.href="login.jsp";
		</script>
		<%}%>