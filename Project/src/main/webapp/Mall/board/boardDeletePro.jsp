<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));
String id = request.getParameter("writer");
String passwd = request.getParameter("passwd");
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

BoardDao bdao = BoardDao.getInstance();
int cnt = bdao.BoardDelete(num, id, passwd);

if (cnt != -1) {
int pageSize = 5;
	int count = bdao.BoardCount();
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	if (pageCount < pageNum) {
		response.sendRedirect("list.jsp?pageNum=" + (pageNum - 1));
	} else {
		response.sendRedirect("list.jsp?pageNum=" + (pageNum));
	}
} else {
%>
<script type="text/javascript">
	alert("아이디 또는 비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
}
%>