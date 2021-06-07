<%@page import="company.portfolio.shoppingmall.HanConv"%>
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
<td>��ǰ��</td>
<td>����1</td>
<td>����2</td>
<td>�ɼ�</td>
<td>����</td>
<td>���η�</td>
<td>�Ǹŷ�</td>
<td>���</td>
<td>�����</td>
<td>�޸�</td>
</tr>

<%
	boolean show_items_success;
	try{
		//����Ŭ DB ����, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("select * from items order by item_number desc");
		rs = pstmt.executeQuery();
		while(rs.next()){
			//�ִ´�� �ϳ��� �ϳ��� �������.
			//��ǰ ��ȣ���� ��ũ�� �༭ ������ �� �ְ�, ���������� ������ư �־ �����ϵ���
			out.write("<td><a href='edit_item.jsp?item_number="+rs.getInt(1)+"'>"+rs.getInt(1)+"</a></td>"
					+ "<td>"+rs.getString(2)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getString(4)+"</td>"
					+ "<td>"+rs.getString(5)+"</td>"
					+ "<td>"+rs.getInt(6)+"</td>"
					+ "<td>"+rs.getInt(7)+"</td>"
					+ "<td>"+rs.getInt(8)+"</td>"
					+ "<td>"+rs.getInt(9)+"</td>"
					+ "<td>"+rs.getString(10)+"</td>"
					+ "<td>"+rs.getString(11)+"</td>"
					+ "<td><a href='delete_item_ok.jsp?item_number="+rs.getInt(1)+"'>��ǰ ����</a></td></tr>"
					);
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
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
	if(<%=show_items_success%>==true){
		alert("��ǰ ��ȸ ����");
	}
	if(<%=show_items_success%>==false){
		alert("��ǰ ��ȸ�� �����߽��ϴ�.");
		history.back();
	}
</script>
</body>
</html>