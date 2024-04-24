<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

<br><br><h1 align="center"><font color="#D1B2FF">고객센터</font></h1><br>

<div align="center">
<b>Tel : 1234-5678</b><br>
<b>Fax : 01-234-5678</b><br>
<b>Mail : Project@project.co.kr</b><br>
</div>
<br><br>

<div align="center">
<button onclick="history.go(-1)" class="btn btn-default">이전</button>
<button onclick="location.href='<%=request.getContextPath()%>/main.jsp'" class="btn btn-default">홈으로</button>
</div>