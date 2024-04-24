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
			alert("주문 수량이 초과되었습니다.");
			location.href="addItem.jsp";
		</script>
		<%
		return;
		}
		item.addItem(pnum,pcount);
%>
<meta http-equiv="refresh" content="0; url=addItem.jsp">
		