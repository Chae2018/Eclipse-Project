<%@page import="orderPkg.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page import="orderPkg.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="profileTop.jsp"%>
<%
	OrderDao odao = OrderDao.getInstance();
	Vector<OrderBean> lists = null;
	int sumPrice = 0;
	if(id!=null){ 
		lists = odao.orderList(id);
	}
%>
<table style="border: 1px solid silver;" align="center" class="table">
	<h3><font color="#5F00FF">구매 내역</font></h3><br>
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
		<td align="center"><%=odao2.getMname()%>님</td>
		<td align="center"><%=odao2.getMid()%></td>
		<td align="center"><%=odao2.getPname()%></td>
		<td align="center">
		<img src="<%=request.getContextPath()+"/Mall/product/images/"+odao2.getPimage()%>" width="50" height="50"></td>
		<td align="center"><%=odao2.getPqty()%>개</td>
		<td align="center"><%=odao2.getPrice()%>원</td>
	</tr>
	<%
				}
			}
		%>
	<tr>
		<td colspan="6">총합:<%=sumPrice %>원
		</td>
	</tr>
</table>
</td>
<%@include file="profileBottom.jsp"%>