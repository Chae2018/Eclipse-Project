<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Products.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    int maxSize = 1024*1024*10;
    String encoding = "UTF-8";
    
    String configFolder = config.getServletContext().getRealPath("/Mall/product/images");
    
    MultipartRequest mr = new MultipartRequest(request,
    											configFolder,
    											maxSize,
    											encoding,
    											new DefaultFileRenamePolicy());

    String uploadImg = mr.getOriginalFileName("pimage");
    String imageFolder = request.getContextPath()+"/Mall/product/images/"+uploadImg;
    
    ProductsDao pdao = ProductsDao.getInstance();
    
    int cnt = pdao.insertProducts(mr);
    String msg,url;
    if(cnt != -1){
    	msg = "추가 성공";
    	url = "proList.jsp";
    }else{
    	msg = "추가 실패";
    	url = "proInsert.jsp";
    }
	%>
    
<script type="text/javascript">
    alert("<%=msg%>");
    location.href="<%=url%>";    
</script>