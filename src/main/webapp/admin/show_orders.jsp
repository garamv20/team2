<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� admin�� verified���� �������� ����
	String verified = (String)session.getAttribute("admin");
%>
<script>
if("<%=verified%>" != "verified"){
	alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
	location.href="login.jsp";
}
</script><!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����(�ֹ�) ���� ������</title>
</head>
<body>
<table>
<tr>
<td>�ֹ���ȣ</td>
<td>�ֹ�����</td>
<td>���̵�</td>
<td>����ó</td>
<td>�ּ�</td>
<td>����</td>
<td>����</td>
<td>�������</td>
<td>����</td>
<td>�ǰ�</td>
<td>�޸�</td>
<td>�ֹ�����</td>
</tr>

</table>
<%
boolean show_items_success;
try{
	//MySQL ����, team2/1234
	String url = "jdbc:mysql://localhost:3306/team2_db";
	String user = "team2";
	String password = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, user, password);

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	pstmt = con.prepareStatement("select * from orders order by order_number desc");
	rs = pstmt.executeQuery();
	while(rs.next()){
		//�ִ´�� �ϳ��� �ϳ��� �������.
		out.write("<tr><td>"+rs.getInt(1)+"</td>"
				+ "<td>"+rs.getString(2)+"</td>"
				+ "<td>"+rs.getString(3)+"</td>"
				+ "<td>"+rs.getString(4)+"</td>"
				+ "<td>"+rs.getInt(5)+"</td>"
				+ "<td>"+rs.getInt(6)+"</td>"
				+ "<td>"+rs.getString(7)+"</td>"
				+ "<td>"+rs.getInt(8)+"</td>"
				+ "<td>"+rs.getString(9)+"</td>"
				+ "<td>"+rs.getString(10)+"</td>"
				+ "<td>"+rs.getDate(11)+"</td></tr>"
				);
	}

	show_items_success = true;
	System.out.println("�ֹ� ��ȸ ����");
}catch(Exception e){
	show_items_success = false;
	System.out.println("�ֹ� ��ȸ ����");
	e.printStackTrace();
}	

%>
</body>
</html>