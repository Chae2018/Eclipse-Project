<%@page import="Products.ProductsBean"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int pcount = Integer.parseInt(request.getParameter("pcount"));
	
	ProductsDao pdao = ProductsDao.getInstance();
	ProductsBean pb = pdao.updateSelProduct(pnum);
	if(pb.getPqty() < pcount){
		
%>
	<script type="text/javascript">
		alert("주문 수량을 초과하였습니다.");
		history.go(-1);
	</script>
	<%
	return;
	
	}
	item.updateItem(pnum,pcount);
	%>
	<script type="text/javascript">
		alert("주문 수량 수정완료");
		location.href="addItem.jsp";
		</script>