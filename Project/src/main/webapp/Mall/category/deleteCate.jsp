<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	CateDao cdao = CateDao.getInstance();
	int cnt = cdao.deleteCate(cnum);
	
	String msg,url;
	if(cnt != -1){
		msg = "삭제 성공";
		url = "cateList.jsp";
		}else{
		msg = "삭제 실패";	
		url = "deleteCate.jsp";
	}
	%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>
