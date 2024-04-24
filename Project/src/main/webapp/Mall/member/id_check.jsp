<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDao mdao = MemberDao.getInstance();

	String userid = request.getParameter("userid");
	System.out.print(userid);
	boolean check = mdao.searchId(userid);
	
	String msg;
	if(check){
		msg = "NO";
		out.print(msg);
	}else{
		msg = "YES";
		out.print(msg);
	}
%>