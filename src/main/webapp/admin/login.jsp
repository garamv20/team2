<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �α���</title>
</head>
<body>
<form name="form" method="post" action="login_ok.jsp">
���̵�<input type="text" name="id" id="id">
��й�ȣ<input type="password" name="password" id="password">
<input type="button" name="login" onClick="click_login()" value="�α���">
<script>
function click_login(){
	if(form.id.value == ""){
		form.id.focus();
		alert("���̵� �Է��ϼ���.");
		return;
	}
	if(form.password.value == ""){
		form.password.focus();
		alert("��й�ȣ�� �Է��ϼ���.");
		return;
	}
	form.submit();
}
</script>
</form>
</body>
</html>