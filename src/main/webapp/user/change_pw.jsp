<%@page import="user.UserBean"%>
<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("u_id");
	System.out.println(id);
	UserDBBean db = UserDBBean.getInstance();
	UserBean user = db.getUser(id);
	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	 
</body>
</html>