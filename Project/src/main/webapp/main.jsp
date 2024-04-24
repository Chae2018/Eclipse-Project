<%@page import="Products.ProductsBean"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Mall/member/wep_top.jsp"%>
<style type="text/css">
#mainImg img {
	width: 50px;
	height: 50px;
	overflow: hidden;
}

#mainImg:hover img {
	transition: all 0.15s linear;
	transform: scale(1.2);
}
</style>
<%
	ProductsDao pdao = ProductsDao.getInstance();
	ArrayList<ProductsBean> list = pdao.allProducts();
	%>

<table class="table" id="t2">
	<tr>
	<%
	int count = 0;
	for(ProductsBean pb : list){
	count++;
	String image = request.getContextPath()+"/Mall/product/images/"+pb.getPimage(); %>
		<div>
		<td align="center" id="mainImg" width="33%">
		<a href="<%=request.getContextPath() %>/productInfo.jsp?pnum=<%=pb.getPnum()%>"><img src="<%=image%>"></a><br><br>
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

<%@include file="Mall/member/wep_bottom.jsp"%>