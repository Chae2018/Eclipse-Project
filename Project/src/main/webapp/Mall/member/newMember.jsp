<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var isBlank = false;
	var use;
	var isCheck = false;
	
	$("#checkId").click(function(){
		isCheck = true;
		
		if($("input[name=id]").val() == ""){
			alert("아이디를 입력해주세요.");
			$("input[name=id]").focus();
			isBlank = true;
			return;
		}
		isBlank = false;
		
		$.ajax({
			url : "id_check.jsp",
			data : ({
					userid  : $('input[name="id"]').val()
			}),
			success : function(data){
				if($.trim(data) == "YES"){
					$("#message").html("<font color=blue>사용 가능합니다.</font>");
					$("#message").show();
					use = "possible";
				}else{
					$("#message").html("<font color=red>이미 사용중인 아이디입니다.</font>");
					$("#message").show();
					use = "impossible";
					
				}
			}
		});
	});

	$("input[name='id']").keydown(function(){

		isCheck = false;
		use="";
		$('#message').css('display','none');
		
	});
	$("#sub").click(function(){

		if(use == "impossible"){
			alert("이미 사용중인 아이디입니다.");
			return false
		} else if (isCheck==false){
			alert("중복 체크를 하세요");
			return false;
		}
		if(isBlank == true){
			alert("아이디를 입력하세요");
			return false;
		}
	});
});
	function check(){
		if(f.id.value == ""){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}
		if(f.password.value == ""){
			alert("비밀번호를 입력해주세요.");
			f.password.focus();
			return false;
		}
		if(f.passwordCheck.value == ""){
			alert("비밀번호를 입력해주세요.");
			f.passwordCheck.focus();
			return false;
		}
		if(f.passwordCheck.value != f.password.value){
			alert("비밀번호가 틀립니다.");
			f.password.focus();
			return false;
		}
		if(f.name.value == ""){
			alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
		if(f.email1.value == ""){
			alert("이메일을 입력해주세요.");
			f.email1.focus();
			return false;
		}
		if(f.email2.value == ""){
			alert("이메일을 입력해주세요.");
			f.email2.focus();
			return false;
		}
		if(f.resiNum.value == ""){
			alert("주민등록번호를 입력해주세요.");
			f.resiNum.focus();
			return false;
		}
		if(f.resiNum2.value == ""){
			alert("주민등록번호를 입력해주세요.");
			f.resiNum2.focus();
			return false;
		}
		if(f.hp2.value == ""){
			alert("휴대폰 번호를 입력해주세요.");
			f.hp2.focus();
			return false;
		}
		if(f.hp3.value == ""){
			alert("휴대폰 번호를 입력해주세요.");
			f.hp3.focus();
			return false;
		}
	}
</script>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/custom2.css" rel="stylesheet">


<%@ include file="../../mainTop.jsp"%>
<form action="newMemberPro.jsp" method="post" name="f">
<table class="table" align="center">
<h3 align="center"><font color="#5F00FF">회원가입</font></h3><br>
<tr>
	<td><input type="text" name="id" placeholder="아이디">
	<input type="button" id="checkId" value="중복체크" class="btn btn-default">
	<span id="message"></span>
</tr>
<tr>
	<td><input type="password" name="password" placeholder="비밀번호"><br>
</tr>
<tr>
	<td><input type="password" name="passwordCheck" placeholder="비밀번호 확인"><br>
	<span id="message2"></span>
</tr>
<tr>
	<td><input type="text" name="name" placeholder="이름" maxlength="8">
</tr>
<tr>
	<td><input type="text" name="email1" placeholder="이메일" size="15" maxlength="15"> @ 
	<input type="text" name="email2" size="15" maxlength="15">
</tr>
<tr>
	<td><input type="text" name="resiNum" placeholder="주민등록번호" maxlength="6"> - 
	<input type="text" name="resiNum2" maxlength="7">
</tr>
<tr>
	<td>
	성별 : <select name="gender">
	<option value="남">남
	<option value="여">여
</select>
</tr>
<tr>
	<td><select name="hp1">
	<option value="010">010
	<option value="011">011
	<option value="012">012
	</select> - 
	<input type="text" name="hp2" size="8" placeholder="휴대폰 번호" maxlength="4"> - 
	<input type="text" name="hp3" size="8" maxlength="4">
</tr>

</table>
<br>
<div align="center">
<input type="submit" value="회원가입" style="width: 150" id="sub" onclick="return check()" class="btn btn-default">&nbsp;
<input type="button" value="이전" style="width: 80" onclick="history.go(-1)" class="btn btn-default"> 
</div>
</form>
<%@ include file="../../mainBottom.jsp"%>