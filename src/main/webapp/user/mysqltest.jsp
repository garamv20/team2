<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
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
Connection conn=null;
	try{
		String url= "jdbc:mysql://localhost:3306/portfolio";
		String user= "root";
		String password= "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn= DriverManager.getConnection(url, user, password);
		out.print("데이터베이스 연결에 성공");
	}catch(SQLException ex){
		out.print("데이터베이스 연결에 실패<br>");
		out.print("SQLException"+ex.getMessage());
		
	}finally{
		if(conn!=null){
			conn.close();
		}
	}
%>
</body>
</html>