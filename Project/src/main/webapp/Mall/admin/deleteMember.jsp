<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.memberDelete(no);
	
	String msg;
	if(cnt != -1){
		msg = "삭제 성공";
	}else{
		msg = "삭제 실패";
	}
%>

	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="user.jsp";
	</script>