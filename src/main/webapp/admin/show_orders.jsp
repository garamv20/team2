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
<title>�ֹ� ���</title>
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
<table>
<tr>
<td>�ֹ���ȣ</td>
<td>�ֹ�����</td>
<td>������ ���̵�</td>
<td>������ ����</td>
<td>������ ����ó</td>
<td>������ �ּ�</td>
<td>��ǰ ��ȣ</td>
<td>��ǰ��</td>
<td>��ǰ����1</td>
<td>��ǰ����2</td>
<td>��ǰ�ɼ�</td>
<td>�Ǹŷ�</td>
<td>�ǸŰ���</td>
<td>�������</td>
<td>�ֹ��Ͻ�</td>
<td>����</td>
<td>���ǰ�</td>
<td>�޸�</td>
</tr>

<%
	boolean show_orders_success;

	String order_number = request.getParameter("order_number");
	String order_status = request.getParameter("order_status");
	String buyer_id = request.getParameter("buyer_id");
	String buyer_name = request.getParameter("buyer_name");
	String buyer_tel = request.getParameter("buyer_tel");
	String buyer_address = request.getParameter("buyder_address");
	String item_number = request.getParameter("item_number");
	String item_name = request.getParameter("item_name");
	String item_type1 = request.getParameter("item_type1");
	String item_type2 = request.getParameter("item_type2");
	String item_option = request.getParameter("item_option");
	String sell_quantity = request.getParameter("sell_quantity");
	String sell_price = request.getParameter("sell_price");
	String payment_option = request.getParameter("payment_option");
	String order_date = request.getParameter("order_date");
	String assessment_rating = request.getParameter("assessment_rating");
	String assessment_comment = request.getParameter("assessment_comment");
	String memo = request.getParameter("memo");

	try{
		//����Ŭ DB ����, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("select * from orders");
		rs = pstmt.executeQuery();
		while(rs.next()){
			//�ִ´�� �ϳ��� �ϳ��� �������.
			//��ǰ ��ȣ���� ��ũ�� �༭ ������ �� �ְ�, ���������� ������ư �־ �����ϵ���
			out.write("<td>"+rs.getInt(1)+"</td>"
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
					+ "<td>"+rs.getString(12)+"</td>"
					+ "<td>"+rs.getString(13)+"</td>"
					+ "<td>"+rs.getString(14)+"</td>"
					+ "<td>"+rs.getString(15)+"</td>"
					+ "<td>"+rs.getString(16)+"</td>"
					+ "<td>"+rs.getString(17)+"</td>"
					+ "<td>"+rs.getString(18)+"</td></tr>"
					);
		}

		show_orders_success = true;
		System.out.println("�ֹ� ��ȸ ����");
	}catch(Exception e){
		show_orders_success = false;
		System.out.println("�ֹ� ��ȸ ����");
	}
%>

</table>

<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
	if(<%=show_orders_success%>==true){
		alert("�ֹ� ��ȸ ����");
	}
	if(<%=show_orders_success%>==false){
		alert("�ֹ� ��ȸ�� �����߽��ϴ�.");
		history.back();
	}
</script>
</body>
</html>