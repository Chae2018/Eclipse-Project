<%@page import="java.util.ArrayList"%>
<%@page import="catePkg.CateDao"%>
<%@page import="catePkg.CateBean"%>
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
		if(f.pimage.value == ""){
			alert("상품 이미지를 추가하세요");
			f.pimage.focus();
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

<%
	CateDao cdao = CateDao.getInstance();
	ArrayList<CateBean> lists = cdao.cateList();
%>
<%@include file="../admin/adminTop.jsp"%>
<form name="f" method="post" action="proInsertPro.jsp" enctype="multipart/form-data">
	<table class="table">
	<h3><font color="#5F00FF">상품 등록</font></h3><br>
		<tr>
			
			<td colspan="2">
			<select name="pname">
			<%for(int i=0;i<lists.size();i++){
				CateBean cb = lists.get(i);
			%>
			<option value="<%=cb.getCname()%>"><%=cb.getCname()%></option>
			<%}%>
			</select>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="pname2" placeholder="상품 이름">
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="pcompany" placeholder="상품 회사">
		</tr>
		<tr>
		<td width="100px">상품 이미지
			<td><input type="file" name="pimage">
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="pqty" placeholder="상품 수량" maxlength="4">
		</tr>
		<tr>
		<td>상품 스펙
			<td>
			<select name="pspec">
			<option value="NORMAL">일반상품 [NORMAL]</option>
			<option value="BEST">베스트상품 [BEST]</option>
			<option value="HIT">히트상품 [HIT]</option>
			<option value="POPULAR">인기상품 [Popular]</option>
			</select>
		</tr>
		<tr>
		<td>상품 소개 
		<td>
			<textarea rows="10" cols="50" name="pcontents" placeholder="상품 설명" style="resize: none;"></textarea>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="price" placeholder="상품 가격" maxlength="12">
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="point" placeholder="상품 포인트">
		</tr>
	</table>
	<br>
		<div>
			<input type="submit" class="btn btn-default" value="상품등록" onclick="return check()">
			<input type="button" value="이전" onclick="history.go(-1)" class="btn btn-default">
		</div>
</form>
<%@include file="../admin/adminBottom.jsp"%>