<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� admin�� verified���� �������� ����
	String verified = (String)session.getAttribute("admin");
%>
<%
	int item_number = Integer.parseInt(request.getParameter("item_number"));

	boolean delete_success;
	try{
		//MySQL ����, team2/1234
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("delete from items where item_number=?");
		pstmt.setInt(1, item_number);
		pstmt.executeUpdate();

		delete_success = true;
		System.out.println("���� ����");
	}catch(Exception e){
		delete_success = false;
		e.printStackTrace();
		System.out.println("���� ����");
	}	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
	if(<%=delete_success%>==true){
		alert("��ǰ�� �����Ͽ����ϴ�.");
		location.href="show_items.jsp";
	}
	if(<%=delete_success%>==false){
		alert("��ǰ ������ �����߽��ϴ�.");
		location.href="show_items.jsp";
	}
</script>
</body>
</html>