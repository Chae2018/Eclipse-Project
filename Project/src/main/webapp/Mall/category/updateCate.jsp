<%@page import="catePkg.CateBean"%>
<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    function check(){
	if(f.cname.value == ""){
		alert("코드이름을 입력해주세요");
		f.cname.focus();
		return false;
	}
	if(f.ccode.value == ""){
		alert("코드를 입력해주세요");
		f.ccode.focus();
		return false;
	}
}
</script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">

<style type="text/css">
	table{
			
	}
</style>
<%@include file="../admin/adminTop.jsp"%>
<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	CateDao cdao = CateDao.getInstance();
	CateBean cb = cdao.updateSelCate(cnum);
%>
<form method="post" action="updateCatePro.jsp" name="f">
<input type="hidden" name="cnum" value="<%=cnum%>">
	<table border="1" class="table" align="center">
		<tr>
			<td>이름
			<td><input type="text" name="cname" value="<%=cb.getCname()%>">
		</tr>
		<tr>
			<td>코드
			<td><input type="text" name="ccode" value="<%=cb.getCcode()%>">
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="카테고리 수정" class="btn btn-default" onclick="return check()">
		</tr>
	</table>
</form>
<%@include file="../admin/adminBottom.jsp"%>