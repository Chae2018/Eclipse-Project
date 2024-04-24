<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../profile/profileTop.jsp"%>
<%
MemberDao mdao = MemberDao.getInstance();
MemberBean mb = mdao.updateSelMember(no);
System.out.println(mb.getPassword());
%>
<script type="text/javascript">
	function check(){
		var pw = '<%=mb.getPassword()%>';
		
		if(f.title.value == ""){
			alert("제목을 입력해주세요.");
			f.title.focus();
			return false;
		}
		if(f.content.value == ""){
			alert("내용을 작성해주세요.");
			f.content.focus();
			return false;
		}
		if(f.passwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			f.passwd.focus();
			return false;
		}
		if(f.passwd.value != pw){
			alert("비밀번호가 틀립니다..");
			f.passwd.focus();
			return false;
		}
}
</script>
<%
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = bdao.updateSelNum(num);
	%>
<form method="post" action="boardUpdatePro.jsp" name="f">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="num" value="<%=num%>">
	<table class="table">
		<tr>	
			<td>작성자 : 
			<td><%=mb.getName() %>님
			<input type="hidden" name="writer" value="<%=mb.getName()%>">
		</tr>
		<tr>	
			<td>제목 : 
			<td><input type="text" name="title" maxlength="20" value="<%=bb.getTitle()%>">
		</tr>
		<tr>	
			<td>내용 : 
			<td><textarea cols="40" rows="7" type="text" name="content" style="resize: none;"><%=bb.getContent()%></textarea>
		</tr>
		<tr>	
			<td>비밀번호 : 
			<td><input type="password" name="passwd" maxlength="12">
			
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기" onclick="return check()" class="btn btn-default">
				<input type="reset" value="초기화" class="btn btn-default">
				<input type="button" value="목록보기" onClick="history.go(-1)" class="btn btn-default">
			</td>
				
			</tr>
	</table>
</form>
<%@include file="../profile/profileBottom.jsp"%>