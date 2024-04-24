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
<%@include file="../admin/adminTop.jsp"%>
<%
	ProductsDao pdao = ProductsDao.getInstance();
	ArrayList<ProductsBean> lists = pdao.allProducts();
	String image = request.getContextPath()+"/Mall/product/images/";
%>
<table class="table">
	<h3><font color="#5F00FF">상품 목록</font></h3><br>
	<tr>
		<td>번호
		<td>상품 카테고리
		<td>상품 이름
		<td>상품 이미지
		<td>상품 수량
		<td>상품 스펙
		<td>상품 가격
		<td>수정
		<td>삭제
	</tr>
	<%for(ProductsBean pb : lists){
	
	%>
	<tr>
		<td><%=pb.getPnum() %>
		<td><%=pb.getPname() %>
		<td><%=pb.getPname2() %>
		<td><img src="<%=image+pb.getPimage()%>" width="40" height="40">
		<td><%=pb.getPqty() %>
		<td><%=pb.getPspec() %>
		<td><%=pb.getPrice() %>
		<td><a href="updateProduct.jsp?pnum=<%=pb.getPnum() %>" class="btn btn-default">수정</a>
		<td><a href="deleteProduct.jsp?pnum=<%=pb.getPnum() %>" class="btn btn-default">삭제</a>
	</tr>
	<%}%>
</table>
<%@include file="../admin/adminBottom.jsp"%>