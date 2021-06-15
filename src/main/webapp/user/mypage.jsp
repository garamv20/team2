<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%	String name = (String)session.getAttribute("name");
	if (session.getAttribute("name") == null) {
		
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%-- 이 코드 살리면 로그인 안했을땐 main.jsp로 못들어옴  --%>
<%
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%=name %>님 안녕하세요!
	<%
	session.invalidate();
	%>
	
</body>
</html>