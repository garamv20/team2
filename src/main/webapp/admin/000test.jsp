<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//���� ����
try{
	//����Ŭ DB ����, scott/tiger
	String url = "jdbc:mysql://localhost:3306/team2_db";
	String user = "root";
	String password = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, user, password);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	System.out.println("admin DB ���� ����");
}catch(Exception e){
//	e.printStackTrace();
	System.out.println("admin DB ���� ����");
}
%>