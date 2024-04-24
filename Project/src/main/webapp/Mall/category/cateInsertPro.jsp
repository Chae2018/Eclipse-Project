<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cb" class="catePkg.CateBean"/>
<jsp:setProperty property="*" name="cb"/>
<%
	CateDao cdao = CateDao.getInstance();
	int cnt = cdao.categoryInsert(cb);
	
	String msg;
	if(cnt != -1){
		msg = "추가 성공";
	session.setAttribute("cnum", cb.getCnum());
	}else{
		msg = "추가 실패";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="cateInsert.jsp";
</script>
