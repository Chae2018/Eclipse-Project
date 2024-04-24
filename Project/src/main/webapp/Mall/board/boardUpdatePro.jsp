<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bb" class="board.BoardBean" />
<jsp:setProperty property="*" name="bb" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	  int check = bdao.BoardUpdate(bb);
	    
	    if(check != -1){
	    	response.sendRedirect("list.jsp?pageNum=" + pageNum);
	    } else {
	    	%>
	<script type="text/javascript">
			alert("실패하였습니다");
			history.go(-1);
	</script>
<%}%>