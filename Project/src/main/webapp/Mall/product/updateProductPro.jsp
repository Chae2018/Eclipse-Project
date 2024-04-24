<%@page import="java.io.File"%>
<%@page import="Products.ProductsDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int maxSize = 1024*1024*10;
	String encoding = "UTF-8";
	
	String configFolder = config.getServletContext().getRealPath("/Mall/product/images/");
	
	MultipartRequest mr = new MultipartRequest(request,
												configFolder,
												maxSize,
												encoding,
												new DefaultFileRenamePolicy());

	String oldimg = mr.getParameter("pimage");
	String pimage = mr.getOriginalFileName("newImage");
	String img = null;
	if(oldimg == null){
		if(pimage != null){
			img = pimage;
		}
	}else if(oldimg != null){
		if(pimage == null){
			img = oldimg;
		}else if(pimage != null){
			img = pimage;
		
		File delFile = new File(configFolder,oldimg);
		delFile.delete();
		}
	}
	ProductsDao pdao = ProductsDao.getInstance();
	int cnt = pdao.updateProducts(mr,img);
	System.out.print(img);
String msg,url;
	if(cnt != -1){
		msg = "수정 성공";
		url = "proList.jsp";
	}else{
		msg = "수정 실패";
		url = "updateProduct.jsp";
	}
%>

<script type="text/javascript">
    alert("<%=msg%>");
    location.href="<%=url%>";    
</script>