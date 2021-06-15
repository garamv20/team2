<%@page import="myUtil.HanConv"%>
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
<script>
if("<%=verified%>" != "verified"){
	alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
	location.href="login.jsp";
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ǹ� ��ǰ ���</title>
<style>
table{
	border: 1px solid black;
	border-collapse: collapse;
}
td{
	border: 1px solid black;
	padding: 10px;
	min-width: 80px;
	text-align: right;
}
</style>
</head>
<body>
<table id="items">
<tr>
<td>��ǰ��ȣ</td>
<td>��ǰ����</td>
<td>��ǰ��</td>
<td>����</td>
<td>���η�</td>
<td>�����</td>
<td>�޸�</td>
</tr>

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

		pstmt = con.prepareStatement("select * from items order by item_number desc");
		rs = pstmt.executeQuery();
		while(rs.next()){
			//�ִ´�� �ϳ��� �ϳ��� �������.
			out.write("<tr><td>"+rs.getInt(1)+"</td>"
					+ "<td>"+rs.getString(2)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getInt(4)+"</td>"
					+ "<td>"+rs.getInt(5)+"</td>"
					+ "<td>"+rs.getDate(6)+"</td>"
					+ "<td>"+rs.getString(7)+"</td>");
			
			//�ɼ��� �ִ� �� ��ȸ�ϰ� ������ �ϳ��� �߰�����
				try{
					pstmt = con.prepareStatement("select * from option where item_number=?");
					
					pstmt.setInt(1,rs.getInt(1));
					ResultSet rs_o = null;
					while(rs_o.next()){
						out.write("<td>"+rs_o.getString("option1")+rs_o.getString("option2")+rs_o.getInt("sell")+rs_o.getInt("reamains")+"</td>");
					}
					System.out.println("�ɼ���ȸ ����");
				}catch(Exception e){
					System.out.println("�ɼ���ȸ ����");
					e.printStackTrace();
				}
			
			out.write("<td><a href='add_option.jsp?item_number="+rs.getInt(1)+"'>�ɼ� �߰�</a></td>"
					+ "<td><a href='edit_item.jsp?item_number="+rs.getInt(1)+"'>����</a></td>"
					+ "<td><a href='delete_item_ok.jsp?item_number="+rs.getInt(1)+"'>����</a></td></tr>");
		}

		show_items_success = true;
		System.out.println("��ǰ ��ȸ ����");
	}catch(Exception e){
		show_items_success = false;
		System.out.println("��ǰ ��ȸ ����");
	}
%>

</table>
<a href="add_item.jsp">��ǰ ���</a>

<script>
	if(<%=show_items_success%>==true){
		alert("��ǰ ��ȸ ����");
	}
	if(<%=show_items_success%>==false){
		alert("DB ����, ��ǰ ��ȸ ����");
		history.back();
	}
</script>
</body>
</html>