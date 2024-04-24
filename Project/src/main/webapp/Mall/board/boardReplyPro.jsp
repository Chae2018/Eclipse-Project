<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	String pageNum = request.getParameter("pageNum");
	bb.setIp(request.getRemoteAddr());
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));

	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.BoardReply(bb);
	
	if(cnt != -1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
		
		} else {
	%>
		
<script type="text/javascript">
	alert("실패");
	history.go(-1);
</script>
<%}%>