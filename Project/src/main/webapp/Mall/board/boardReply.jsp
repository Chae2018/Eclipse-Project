<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../profile/profileTop.jsp"%>
<%
MemberDao mdao = MemberDao.getInstance();
MemberBean mb = mdao.updateSelMember(no);
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
	String ref = request.getParameter("ref");
	String re_step = request.getParameter("re_step");
	String re_level = request.getParameter("re_level");
	String pageNum = request.getParameter("pageNum");
%>

	<form name="f" method="post" action="boardReplyPro.jsp">
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="re_step" value="<%=re_step%>">
		<input type="hidden" name="re_level" value="<%=re_level%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table class="table"><br>
		<h4 align="center"><font color="silver">답글작성</font></h4><br>
			<tr>
				<td>이름</td>
				<td><%=mb.getName()%>
				<input type="hidden" name="writer" value="<%=mb.getName()%>"></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="content" cols="30" rows="5" style="resize: none;"></textarea></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			
			<tr>
				<td colspan="2"  align="center">
					<input type="submit" value="답글쓰기" onclick="return check()" class="btn btn-default">
					<input type="reset" value="초기화" class="btn btn-default">
					<input type="button" value="목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'" class="btn btn-default">
				</td>
				
			</tr>
			
		</table>
	</form>
<%@include file="../profile/profileBottom.jsp"%>