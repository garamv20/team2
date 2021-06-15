<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="myUtil.HanConv"%>
<%@page import="java.time.LocalDateTime"%>
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
<title>Insert title here</title>
</head>
<body>

<%
	boolean add_success = false;

	//���� ���������� �� ������ �޾ƿ´�.
	String item_type = HanConv.toKor((String)request.getParameter("item_type"));
	String item_name = HanConv.toKor((String)request.getParameter("item_name"));
	int item_price = Integer.parseInt((String)request.getParameter("item_price"));
	double item_discount_rate = Double.parseDouble((String)request.getParameter("item_discount_rate"));
	String item_memo = HanConv.toKor((String)request.getParameter("item_memo"));
	
	try{
		//MySQL ����, team2/1234r
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//������ ��ȣ ã��
		int max_item_number = 0;	//������ 0
		int insert_item_number;
		pstmt = con.prepareStatement("select max(item_number) from items");
		rs = pstmt.executeQuery();
		if(rs.next()){
			max_item_number = rs.getInt(1);
		}
		//�Է��� ��ȣ�� �ְ� ��ȣ���� 1 ũ��
		insert_item_number = max_item_number + 1;

		pstmt = con.prepareStatement("insert into items values(?,?,?,?,?,?,?)");
		pstmt.setInt(1, insert_item_number);
		pstmt.setString(2, item_type);
		pstmt.setString(3, item_name);
		pstmt.setInt(4, item_price);
		pstmt.setDouble(5, item_discount_rate);
		pstmt.setDate(6, Date.valueOf(LocalDate.now()));
		pstmt.setString(7, item_memo);
		
		pstmt.executeUpdate();

		add_success = true;
		System.out.println("��ǰ �߰� ����");
	}catch(Exception e){
		add_success = false;
		e.printStackTrace();
		System.out.println("��ǰ �߰� ����");
	}
%>


<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
	if(<%=add_success%>==true){
		alert("��ǰ�� �߰��Ͽ����ϴ�.");
		location.href="show_items.jsp";
	}
	if(<%=add_success%>==false){
		alert("��ǰ�� �߰��� �����߽��ϴ�.");
		location.href="show_items.jsp";
	}
</script>
</body>
</html>