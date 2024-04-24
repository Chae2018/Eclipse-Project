<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	BoardDao bdao = BoardDao.getInstance();

	bb.setIp(request.getRemoteAddr());
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	int cnt = bdao.BoardInsert(bb);
%>
<meta http-equiv="refresh" content="0; url=list.jsp">