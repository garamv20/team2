<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
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
<title>��ǰ ����</title>
</head>
<body>
<%
	String item_number = request.getParameter("item_number");
	String item_type = null;
	String item_name = null;
	int item_price = 0;
	double item_discount_rate = 0;
	Date item_register_date = null;
	String item_memo = null;
	
	try{
		//MySQL ����, team2/1234
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("select * from items where item_number=?");
		pstmt.setString(1, item_number);
		rs = pstmt.executeQuery();
		//������ �ϳ��ϳ� �־��ֱ�
		while(rs.next()){
			item_type = rs.getString(2);
			item_name = rs.getString(3);
			item_price = rs.getInt(4);
			item_discount_rate = rs.getDouble(5);
			item_register_date = rs.getDate(6);
			item_memo = rs.getString(7);
		}

		System.out.println("DB ���� ����");
	}catch(Exception e){
		System.out.println("DB ���� ����");
	}
%>

<form name="form" method="post" action="add_item_ok.jsp">
<table>
<tr><td>��ǰ��ȣ</td><td><%=item_number %></td></tr>
<tr><td>��ǰ����</td>
<td><select name="item_type">
<option value="�ƿ���">�ƿ���</option>
<option value="����">����</option>
<option value="����">����</option>
<option value="�������">�������</option>
<option value="����">����</option>
<option value="�Ǽ��縮">�Ǽ��縮</option>
</select></td></tr>
<tr><td>��ǰ��*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>����*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>���η�</td>
<td><input type="number" name="item_discount_rate" value="0"></td></tr>
<tr><td>�������</td><td><%=item_register_date %></td></tr>
<tr><td>�޸�</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td>��ǰ �̹���*</td><td><input type="file" name="item_image"></td></tr>
<tr><td>��ǰ���� �̹���*</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="register" value="����ϱ�" onClick="click_register()"></td></tr>
</table>
</form>
<script>
	//�ҷ��� ������ ���� ��ĭ�� ä���ֱ�
	form.item_type.value = "<%=item_type%>";
	form.item_name.value = "<%=item_name%>";
	form.item_price.value = <%=item_price%>;
	form.item_discount_rate = <%=item_discount_rate%>;
	form.item_memo = "<%=item_memo%>";
</script>
<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
</script>
</body>
</html>