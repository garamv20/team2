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
</head>
<body>
<table id="items">
<tr><td><a href="add_item.jsp">��ǰ ���</a></td></tr>
<tr>
<td>��ǰ��ȣ</td>
<td>��ǰ��</td>
<td>����1</td>
<td>����2</td>
<td>�ɼ�</td>
<td>����</td>
<td>�ΰ���</td>
<td>���η�</td>
<td>�Ǹŷ�</td>
<td>���</td>
<td>�����</td>
<td>�޸�</td>
</tr>

<%
	//����Ŭ DB ����, scott/tiger
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url, user, password);

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	pstmt = con.prepareStatement("select * from items");
	rs = pstmt.executeQuery();
	if(rs.next()){
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
				+ "<td><a href='delete_item_ok.jsp?item_number"+rs.getInt(1)+"'>��ǰ ����</a></td></tr>"
				);
	}
%>

</table>
<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
</script>
</body>
</html>