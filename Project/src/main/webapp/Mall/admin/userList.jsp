<%@page import="orderPkg.OrderDao"%>
<%@page import="orderPkg.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>
<%@include file="adminTop.jsp"%>
<%

	String id2 = request.getParameter("id");
	OrderDao odao = OrderDao.getInstance();
	Vector<OrderBean> lists = null;
	int sumPrice = 0;
	if(id!=null){ 
		lists = odao.adminorderList(id2);
	}
%>
<table border="1" class="table">
	<tr>
		<td colspan="6">
		<form method="post" action="userList.jsp">
		사용자 아이디 : <input type="text" name="id" placeholder="admin">
		<input type="submit" value="조회" class="btn btn-default"> 
		</form>
	</tr>
	<tr>
		<td>고객명</td>
		<td>아이디</td>
		<td>이름</td>
		<td>상품</td>
		<td>수량</td>
		<td>금액</td>
	</tr>
	<%
				if(lists != null){
					for(OrderBean odao2 : lists){
					sumPrice += odao2.getPrice();
			%>
	<tr>
		<td align="center"><%=odao2.getMname()%></td>
		<td align="center"><%=odao2.getMid()%></td>
		<td align="center"><%=odao2.getPname()%></td>
		<td align="center"><img
			src="<%=request.getContextPath()+"/Mall/product/images/"+odao2.getPimage()%>"
			width="50" height="50"></td>
		<td align="center"><%=odao2.getPqty()%></td>
		<td align="center"><%=odao2.getPrice()%></td>
	</tr>
	<%
				}
			}
		%>
	<tr>
		<td colspan="6">총합:<%=sumPrice %>
		</td>
	</tr>
</table>
</td>
</table>
<%@include file="adminBottom.jsp"%>



