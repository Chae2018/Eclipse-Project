<%@page import="Products.ProductsBean"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@include file="wep_top.jsp"%>
<%
	String selProduct = request.getParameter("selProduct");
	System.out.print(selProduct);
	ProductsDao pdao = ProductsDao.getInstance();
	ArrayList<ProductsBean> list = pdao.searchItem(selProduct);
	%>
<table class="table" id="t2">
	<tr>
	<%
	int count = 0;
	for(ProductsBean pb : list){
	count++;
	String image = request.getContextPath()+"/Mall/product/images/"+pb.getPimage(); %>
		<div>
		<td align="center" id="mainImg" width="100" style="border: 1px solid #EAEAEA"><a href="<%=request.getContextPath() %>/productInfo.jsp?pnum=<%=pb.getPnum()%>"><img src="<%=image%>" width="50" height="50"></a><br><br>
		</div>
		<%=pb.getPname2()%><br>
		<%=pb.getPcontents()%><br>
		<b><%=pb.getPrice()%></b>원<br>
	<%if(count % 3 == 0){
		out.println("</tr><tr>");
	}
		}%>
	</tr>
</table>
<%@include file="wep_bottom.jsp"%>