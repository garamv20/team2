<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate(); // ���� �ʱ�ȭ

// �α��� ���� ��Ű ����
Cookie[] c = request.getCookies();
if (c != null) {
	for (Cookie cf : c) {
		if (cf.getName().equals("id")) {
			cf.setMaxAge(0);
			cf.setPath("/");
			response.addCookie(cf);
			request.getSession().invalidate();
			
		}
	}
}
/* session.invalidate(); */
%>
<script>
alert("�α׾ƿ� �Ǿ����ϴ�.");
location.href='Main.jsp';
</script>



</body>
</html>