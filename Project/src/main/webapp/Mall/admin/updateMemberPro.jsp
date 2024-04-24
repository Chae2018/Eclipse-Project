<%@page import="memberPkg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mb" class="memberPkg.MemberBean" />
<jsp:setProperty property="*" name="mb" />
<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.updateMember(mb);

	String msg,url;
	if(cnt != -1){
		if(mb.getId().equals("admin")){
		msg = "수정 성공";
		url = "user.jsp";
		}else{
		msg = "수정 성공";
		url = request.getContextPath()+"/Mall/profile/myProfile.jsp";
		}
		}else{
		msg = "수정 실패";	
		url = "updateMember.jsp";
	}
	%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>