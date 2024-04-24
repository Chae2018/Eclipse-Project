<%@page import="Products.ProductsBean"%>
<%@page import="Products.ProductsDao"%>
<%@page import="catePkg.CateBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="catePkg.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
	function check(){
		if(f.pname2.value == ""){
			alert("상품 이름을 입력하세요");
			f.pname2.focus();
			return false;
		}
		if(f.pcompany.value == ""){
			alert("상품 회사를 입력하세요");
			f.pcompany.focus();
			return false;
		}
		if(f.pqty.value == ""){
			alert("상품 수량을 입력하세요");
			f.pqty.focus();
			return false;
		}
		if(f.pcontents.value == ""){
			alert("상품 소개를 입력하세요");
			f.pcontents.focus();
			return false;
		}
		if(f.price.value == ""){
			alert("상품 가격을 입력하세요");
			f.price.focus();
			return false;
		}
		if(f.point.value == ""){
			alert("상품 포인트를 입력하세요");
			f.point.focus();
			return false;
		}
		
	}
	</script>

<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">
<style type="text/css">
	table{
		margin-top: 0px;
	}
</style>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductsDao pdao = ProductsDao.getInstance();
	CateDao cdao = CateDao.getInstance();
	ArrayList<CateBean> lists = cdao.cateList();
	ProductsBean pb = pdao.updateSelProduct(pnum);
%>
<%@include file="../admin/adminTop.jsp"%>
<form method="post" action="updateProductPro.jsp" enctype="multipart/form-data" name="f">
<input type="hidden" name="pnum" value="<%=pnum%>">
	<table border="1" class="table">
	<h2><font class="text-primary">상품 수정</font></h2>
		<tr>
			<td colspan="2">
			<select name="pname">
			<%
				String[] category = {"여성의류","남성의류","신발","가방","유아동"};
			for(int i=0;i<category.length;i++){
				%>
				<option value="<%=category[i]%>"<%if(pb.getPname().equals(category[i])){%>selected<%}%>><%=category[i] %></option>
				<%}%>
			</select>
		</tr>
		<tr>
			<td colspan="2">
			<input type="text" name="pname2" placeholder="상품 이름" value="<%=pb.getPname2()%>">
		</tr>
		<tr>
			<td colspan="2">
			<input type="text" name="pcompany" placeholder="상품 회사" value="<%=pb.getPcompany()%>">
		</tr>
		<tr>
		<%String image = request.getContextPath()+"/Mall/product/images/"+pb.getPimage(); %>
		<td>상품 이미지
			<td><img src="<%=image%>" width="50" height="50">
			<input type="file" name="newImage">
			<input type="hidden" name="pimage" value="<%=pb.getPimage()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="pqty" placeholder="상품 수량" value="<%=pb.getPqty()%>" maxlength="4">
		</tr>
		<tr>
		<td>상품 스펙
			<td>
			<select name="pspec">
			<%
				String[] spec = {"NOLMAL","BEST","HIT","POPULAR"};
			for(int i=0;i<spec.length;i++){
				%>
				<option value="<%=spec[i]%>"<%if(pb.getPspec().equals(spec[i])){%>selected<%}%>><%=spec[i] %></option>
				<%}%>
			</select>
		</tr>
		<tr>
		<td>상품 소개 
		<td>
			<textarea rows="10" cols="50" name="pcontents" placeholder="상품 설명" style="resize: none;"><%=pb.getPcontents()%></textarea>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="price" placeholder="상품 가격" value="<%=pb.getPrice()%>" maxlength="12">
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="point" placeholder="상품 포인트" value="<%=pb.getPoint()%>">
		</tr>
	</table>
	<br>
			<input type="submit" class="btn btn-default" value="상품 수정" onclick="return check()">
			<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default">
</form>
<%@include file="../admin/adminBottom.jsp"%>