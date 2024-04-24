<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	
	ProductsDao mdao = ProductsDao.getInstance();
	int cnt = mdao.deleteProduct(pnum);
	
	String msg;
	if(cnt != -1){
		msg = "삭제 성공";
	}else{
		msg = "삭제 실패";
	}
%>

	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="proList.jsp";
	</script>