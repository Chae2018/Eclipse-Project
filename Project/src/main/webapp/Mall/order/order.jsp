<%@page import="Products.ProductsBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function order(){
	location.href="orderPro.jsp";
}
</script>

<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>

<%@include file="../member/wep_top.jsp"%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int pcount = Integer.parseInt(request.getParameter("pcount"));
	if(pnum != 0 && pcount != 0){
		item.addItem(pnum, pcount);
	}
	Vector<ProductsBean> plist = item.allitemList();
%>
<table border="1" align="center" class="table">
	<tr>
		<td>이름
		<td>상품
		<td>수량
		<td>금액
		<td>삭제
	</tr>
	
	<%
	int sumPrice = 0;
		for(int i=0;i<plist.size();i++){
			ProductsBean pb = plist.get(i);
			int price = pb.getPqty()*pb.getPrice();
			String image = request.getContextPath()+"/Mall/product/images/"+pb.getPimage();
			%>
			<tr>
				<td><%=pb.getPname2() %>
				<td><img src="<%=image %>" width="50" height="50">
				<td><%=pb.getPqty() %>개
				<td><%=price %>원
				<td><a href="deleteItem.jsp?pnum=<%=pb.getPnum()%>" class="btn btn-default">삭제</a>
			</tr>
			<%
		sumPrice += price;	
		}%>
		<tr>
			<td colspan="5"> 총합: <%=sumPrice %>원
		</tr>
</table>
<button onclick="return order()" class="btn btn-default">결제하기</button>
<button onclick="history.go(-1)" class="btn btn-default">이전</button>
<%@include file="../member/wep_bottom.jsp"%>