<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../profile/profileTop.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.BoardContent(num);
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.updateSelMember(no);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm");
%>
<script type="text/javascript">
<%if(id.equals("admin") == false){%>
function check(){
	var pageNum = <%=pageNum%>;
	var num = <%=num%>;
	<%if(bb.getWriter().equals(mb.getName()) == false){%>
	alert("권한이 없습니다.");
	return false;
	<%}else{%>
	location.href="boardUpdate.jsp?num="+num+"&pageNum="+pageNum;
	<%}%>
}
function delete2(){
	var pageNum = <%=pageNum%>;
	var num = <%=num%>;
	<%if(bb.getWriter().equals(mb.getName()) == false){%>
	alert("권한이 없습니다.");
	return false;
	<%}else{%>
	location.href="boardDelete.jsp?num="+num+"&pageNum="+pageNum;
	<%}%>
}
<%}else{%>
	function check(){
		var pageNum = <%=pageNum%>;
		var num = <%=num%>;
		location.href="boardUpdate.jsp?num="+num+"&pageNum="+pageNum;
	}
	function delete2(){
		var pageNum = <%=pageNum%>;
		var num = <%=num%>;
		location.href="boardDelete.jsp?num="+num+"&pageNum="+pageNum;
	}
<%}%>
</script>
<table class="table">
	<tr>
		<td width="100">글번호
		<td align="center" width="125"><%=bb.getNum() %>
		<td width="100">조회수
		<td align="center" width="125"><%=bb.getReadcount() %>
	</tr>
	<tr>
		<td>작성자
		<td align="center" width="125"><%=bb.getWriter() %>
		<td>작성일
		<td align="center" width="125"><%=sdf.format(bb.getReg_date()) %>
	</tr>
	<tr>
		<td>글제목
		<td align="center"><%=bb.getTitle() %>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>글내용
		<td align="left" colspan="3" width="300" height="100"><%=bb.getContent() %>
	</tr>
	<tr>
		<td align="right" colspan="4">
		<input type="button" value="글수정" onclick="return check()" class="btn btn-default">
		<input type="button" value="글삭제" onclick="return delete2()" class="btn btn-default">
		<input type="button" value="답글쓰기" onclick="location.href='boardReply.jsp?ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'" class="btn btn-default">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'" class="btn btn-default">
	</tr>
</table>
<%@include file="../profile/profileBottom.jsp"%>