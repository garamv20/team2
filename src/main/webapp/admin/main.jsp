<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� admin�� verified���� �������� ����
	String verified = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���� ������</title>
</head>
<body>
<div id="link" hidden>
<a href="show_items.jsp">��ǰ ���� ������</a><br>
<a href="show_items.jsp">���� ���� ������</a><br>
<a href="show_items.jsp">��ǰ ���� ������</a><br>
</div>
<script>
	if("<%=verified%>" == "verified"){
		document.getElementById("link").hidden = false;
	} else{
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
</script>
</body>
</html>