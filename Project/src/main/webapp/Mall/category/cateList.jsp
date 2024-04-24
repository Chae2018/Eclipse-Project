<%@page import="catePkg.CateBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	table{
		text-align: center;
	}
</style>
<%@include file="../admin/adminTop.jsp"%>
<%
	CateDao cdao = CateDao.getInstance();
	ArrayList<CateBean> lists = cdao.cateList();
	%>

	<table class="table">
	<h3><font color="#5F00FF">카테고리 목록</font></h3><br>
		<tr>
			<td>번호
			<td>카테고리 이름
			<td>카테고리 코드
			<td>수정
			<td>삭제
		</tr>
		<%for(CateBean cb : lists){ %>
		<tr>
			<td><%=cb.getCnum() %>
			<td><%=cb.getCname() %>
			<td><%=cb.getCcode() %>
			<td><a href="updateCate.jsp?cnum=<%=cb.getCnum()%>" class="btn btn-default">수정</a>
			<td><a href="deleteCate.jsp?cnum=<%=cb.getCnum()%>" class="btn btn-default">삭제</a>
			
		</tr>
		<%}%>
	</table>
<%@include file="../admin/adminBottom.jsp"%>