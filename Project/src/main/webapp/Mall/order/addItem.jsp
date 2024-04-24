<%@page import="java.util.Vector"%>
<%@page import="Products.ProductsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	table{
		text-align: center;
	}
</style>
<%@include file="../member/wep_top.jsp"%>
<jsp:useBean id="item" class="myItemPkg.myItem" scope="session"/>
<%
	Vector<ProductsBean> plist = item.allitemList();
%>
<script type="text/javascript">
function check(){
	<%if(plist.size()==0){%>
		alert("상품을 추가해주세요");
		return false;
	<%}else{%>
		location.href="<%=request.getContextPath()%>/Mall/order/order.jsp?pnum=00&pcount=00"
	<%}%>
}
</script>
<table style=" border: 1px solid silver;" class="table">
	<tr>
		<td>상품 번호
		<td>상품 카테고리
		<td>상품 이름
		<td>상품
		<td>구매 수량
		<td>소개
		<td>가격
		<td>삭제
	</tr>
<%
if(plist.size() == 0){
	%>
	<tr>
		<td colspan=8 align=center height="200">
			선택한 상품이 없습니다.
		</td>
	</tr>
</table>
<%			
	}else{
	int sumPrice = 0;
	int sumPoint = 0;
	
	for(ProductsBean pb : plist){
	String image = request.getContextPath()+"/Mall/product/images/"+pb.getPimage();
	sumPrice += pb.getPrice()*pb.getPqty();
	sumPoint += pb.getPoint()*pb.getPqty();
	%>
	<tr>
		<td><%=pb.getPnum()%>
		<td><%=pb.getPname()%>
		<td><%=pb.getPname2()%>
		<td><img src="<%=image%>" width="40" height="40">
		<td>
		<form name="f" method="post" action="updateItem.jsp">
			<input type="hidden" name="pnum" value="<%=pb.getPnum() %>">
			<input type="text" name="pcount" size="2" value="<%=pb.getPqty()%>">개
			<input type="submit" value="수정" class="btn btn-default">
		</form>
		<td><%=pb.getPcontents()%>
		<td><%=pb.getPrice()*pb.getPqty()%>원
		<td><a href="deleteItem.jsp?pnum=<%=pb.getPnum()%>" class="btn btn-default">삭제</a>
	</tr>
	<%}%>
	<tr>
	<td colspan="8">
	합계: <%=sumPrice %>원
	총 포인트: <%=sumPoint %> Point
	</td>
</table>
	<%} %>
	<input type="button" value="주문하기" onclick="return check()" class="btn btn-default">
	<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default">
<%@include file="../member/wep_bottom.jsp"%>