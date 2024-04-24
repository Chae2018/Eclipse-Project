<%@page import="orderPkg.OrderDao"%>
<%@page import="Products.ProductsBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>

<%
	Vector<ProductsBean> plist = item.allitemList();
	int no = (Integer)session.getAttribute("no");
	
	OrderDao odao = OrderDao.getInstance();
	int cnt = odao.insertOrder(no,plist);
	
	
	String msg;
	if(cnt != 0){
		msg = "주문 완료했습니다.";
		item.removeAll();
%>
<script type="text/javascript">
	alert("<%=msg%>");
	check = confirm("계속하시겠습니까?");
	if(check){
		location.href="<%=request.getContextPath()%>/main.jsp";
	}else{
		location.href="<%=request.getContextPath()%>/logout.jsp";
	}
</script>


<%}else{
	msg = "주문 실패했습니다.";
%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=request.getContextPath()%>/logout.jsp";
	</script>
<%}%>