<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mb" class="memberPkg.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.insertMember(mb);
	
	if(cnt != -1){
		%>
		<script type="text/javascript">
		alert("추가 성공");
		location.href="<%=request.getContextPath()%>/main.jsp";
		</script>
		
	<%}else{%>
	
		<script type="text/javascript">
		alert("추가 실패");
		location.href="history.go(-1)";
		</script>
	<%}%>