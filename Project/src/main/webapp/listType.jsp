<%@page import="Products.ProductsBean"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Mall/member/wep_top.jsp"%>
<style type="text/css">
#typeImg{
	border-bottom: 1px solid #EAEAEA;
	border-right: 1px solid #EAEAEA;
}
#typeImg img {
	width: 50px;
	height: 50px;
	overflow: hidden;
}

#typeImg:hover img {
	transition: all 0.15s linear;
	transform: scale(1.2);
}
</style>
<%
	String cname = request.getParameter("cname");
	ProductsDao pdao = ProductsDao.getInstance();
	ArrayList<ProductsBean> list = pdao.listType(cname);
%>
<table class="table">
<tr>
	<%
	int count = 0;
	for(ProductsBean pb : list){
	String image = request.getContextPath()+"/Mall/product/images/"+ pb.getPimage();
		count++;
		%>
<td id="typeImg" align="center" width="33%">
<a href="<%=request.getContextPath() %>/productInfo.jsp?pnum=<%=pb.getPnum()%>">
<img src="<%=image%>" width="50" height="50"></a><br><br>
<%=pb.getPname2()%><br>
<%=pb.getPcontents()%><br>
<b><%=pb.getPrice()%></b> 원<br>
	<%
	if(count % 3 == 0){
		out.print("</tr><tr>");
	}
	}%>
</tr>
</table>

<%@include file="Mall/member/wep_bottom.jsp"%>