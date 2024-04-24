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

<%@include file="../admin/adminTop.jsp"%>
<form method="post" action="cateInsertPro.jsp" name="f">
	<table border="1" class="table" align="center">
	<h3><font color="#5F00FF">카테고리 등록</font></h3><br>
		<tr>
			<td>이름
			<td><input type="text" name="cname">
		</tr>
		<tr>
			<td>코드
			<td><input type="text" name="ccode">
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="카테고리 추가" class="btn btn-default" onclick="return check()">
		</tr>
	</table>
</form>
<%@include file="../admin/adminBottom.jsp"%>