<%@page import="Products.ProductsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Mall/member/wep_top.jsp"%>
    <script type="text/javascript">
    function check(){
    <%
    if(id==null){
    %>
    alert("로그인 후 이용해주세요");
    return false;
    <%}%>
    	if(f.pcount.value > f.pqty.value || f.pcount.value == "" || f.pcount.value < 1){
    		alert("수량을 확인해주세요");
    		return false;
    	}
    }
    function addItemPro(){
    <%
    if(id==null){
    %>
    alert("로그인 후 이용해주세요");
    return false;
    <%}%>
    	if(f.pcount.value > f.pqty.value || f.pcount.value == "" || f.pcount.value < 1){
    		alert("수량을 확인해주세요");
    		return false;
    	}
    	pnum = f.pnum.value;
    	pcount = f.pcount.value;
    	location.href="<%=request.getContextPath()%>/Mall/order/addItemPro.jsp?pnum="+pnum+"&pcount="+pcount;
    	}
    </script>
<style type="text/css">
#sideImg img {
	width: 50px;
	height: 50px;
	overflow: hidden;
}

#sideImg:hover img {
	transition: all 0.15s linear;
	transform: scale(1.2);
}
#detailInfo{
	border-bottom: 1px solid silver;
	width: 100%;
}
#endDiv{
	border: 1px solid silver;
	overflow: scroll;
	height: 200px;
}
#detailImg img{
	width: 300px;
	text-align: center;
	}
</style>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductsDao pdao = ProductsDao.getInstance();
	ArrayList<ProductsBean> list = pdao.detailProduct(pnum);
	ArrayList<ProductsBean> list2 = pdao.allProducts();
%>
<form method="post" name="f" action="<%=request.getContextPath()%>/Mall/order/order.jsp">
<table class="table" id="detailInfo">
<input type="hidden" name="id" value="<%=id%>">
<tr>
	<%for(ProductsBean pb : list){
	String image = request.getContextPath()+"/Mall/product/images/"+ pb.getPimage();
	%>
	<td id="detailImg" align="center"><img src="<%=image%>" height="400">
	<td style="padding-top: 70px;" align="center">
	<%=pb.getPname2()%><br><br>
	<%=pb.getPcontents()%><br><br>
	가격 : <b><%=pb.getPrice()%></b> 원<br><br>
	<font color="#747474">남은수량 : <%=pb.getPqty()%> 개</font><br><br>
	<input type="hidden" name="pqty" value="<%=pb.getPqty()%>">
	<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
	
	상품갯수 : <input type="text" name="pcount" value="1" size="1" maxlength="2"> 개<br><br>
	<%=pb.getPoint()%> Point 적립<br><br>
	<input type="button" value="장바구니 담기" onclick="return addItemPro()" class="btn btn-default">
	<input type="submit" class="btn btn-default" value="구매" onclick="return check()">
	<%}%>
</tr>
</table>
</form>
<br><br>

<div style="width: 100%; height: 190px; overflow: scroll;">
<table class="table" id="endDiv">
<caption><font color="#747474">다른 상품</font></caption>
		<tr>
		<%
		int count = 0;
		for(ProductsBean pb : list2){
		String image2 = request.getContextPath()+"/Mall/product/images/"+ pb.getPimage();
			count++;%>
		<td id="sideImg">
		<a href="<%=request.getContextPath() %>/productInfo.jsp?pnum=<%=pb.getPnum()%>">
		<img src="<%=image2 %>" width="50" height="50"></a><br>
		<td>
		<a href="<%=request.getContextPath() %>/productInfo.jsp?pnum=<%=pb.getPnum()%>">
		<font size="2px"><%=pb.getPname2()%></font></a><br>
		<td><font size="2px"><%=pb.getPcontents()%></font><br>
		<%if(count % 2 == 0){
			out.print("</tr><tr>");
			}
		}%>
		</tr>
</table>
</div>
<%@include file="Mall/member/wep_bottom.jsp"%>