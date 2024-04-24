<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cb" class="catePkg.CateBean" />
<jsp:setProperty property="*" name="cb" />
<%
	CateDao mdao = CateDao.getInstance();
	int cnt = mdao.updateCate(cb);
	
	String msg,url;
	if(cnt != -1){
		msg = "수정 성공";
		url = "cateList.jsp";
		}else{
		msg = "수정 실패";	
		url = "updateCate.jsp";
	}
	%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>