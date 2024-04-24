<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../profile/profileTop.jsp"%>
<%
	BoardDao bdao = BoardDao.getInstance();

	int pageSize = 5;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	int count = bdao.BoardCount();
	
	ArrayList<BoardBean> boardList = bdao.BoardList(startRow,endRow);
%>
<h3>전체 글: <%=count%></h3>
	<%
		if(count == 0){	
	%>
	<table border="1" class="table">
		<tr>
			<td align="center">게시된 글이 없습니다.
		</tr>
	</table>
	<%
		}else{
	%>
	<table class="table">
		<tr align="center">
			<td width="250">제목
			<td width="100">작성자
			<td width="150">작성일
			<td width="50">조회
			<%if(id.equals("admin")){%>
			<td width="100">IP
			<%}%>
		</tr>
		<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bb = boardList.get(i);
		%>
		<tr>
		<td>
		<%
		int wid =0;
		if(bb.getRe_level()>0){
			wid = bb.getRe_level() * 20;
			%> 
			<img src="<%=request.getContextPath()%>/img/공백.png" width="<%=wid%>"> 
			<img src="<%=request.getContextPath()%>/img/답글2.png"> <%
		}else{
			
		}
	%> 
	<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
	
	<%=bb.getTitle() %>
	</a>
	
	<td><%=bb.getWriter() %>
	<td><%=sdf.format(bb.getReg_date()) %>
	<td><%=bb.getReadcount() %>
	<%if(id.equals("admin")){ %>
	<td><%=bb.getIp() %>
	<%}%>
</tr>
<%}%>
</table>
<%} %>

	<%
		if(count>0){
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);

			int pageBlock = 5;
			int startPage = ((currentPage-1)/pageBlock * pageBlock)+1; 
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount){
				endPage = pageCount; 
			}
			
			if(startPage>3){
		%>
				<a href="list.jsp?pageNum=<%=startPage-5%>">이전</a>
		<%
			}
			for(int i=startPage;i<=endPage;i++){
		%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%	
			}
			if(endPage < pageCount){
		%>
				<a href="list.jsp?pageNum=<%=startPage+5%>">다음</a>
		<%	
			}
		}
	%>
		<div align="right">
			<a href="boardWrite.jsp"  class="btn btn-default">글쓰기</a>
		</div>
<%@include file="../profile/profileBottom.jsp"%>