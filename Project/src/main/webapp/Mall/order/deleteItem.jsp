<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>

<%

	int pnum = Integer.parseInt(request.getParameter("pnum"));

	item.deleteItem(pnum);
%>
<script type="text/javascript">
	alert("상품이 삭제되었습니다.");
	location.href="addItem.jsp";
</script>