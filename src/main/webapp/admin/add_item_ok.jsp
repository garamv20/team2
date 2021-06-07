<%@page import="company.portfolio.shoppingmall.HanConv"%>
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
	String item_name = HanConv.toKor((String)request.getParameter("item_name"));
	String item_type1 = HanConv.toKor((String)request.getParameter("item_type1"));
	String item_type2 = HanConv.toKor((String)request.getParameter("item_type2"));
	String item_option = HanConv.toKor((String)request.getParameter("item_option"));
	int item_price = Integer.parseInt((String)request.getParameter("item_price"));
	int item_discount_rate = 0;
	try{
		item_discount_rate = Integer.parseInt((String)request.getParameter("item_discount_rate"));
	}catch(Exception e){}
	int item_remains = Integer.parseInt((String)request.getParameter("item_remains"));
	String item_memo = HanConv.toKor((String)request.getParameter("item_memo"));
	
	try{
		//����Ŭ DB ����, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
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

		pstmt = con.prepareStatement("insert into items(item_number, item_name, item_type1, item_type2, item_option, item_price, item_discount_rate, item_sells, item_remains, item_register_date, item_memo)"
		+"values(?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, insert_item_number);
		pstmt.setString(2, item_name);
		pstmt.setString(3, item_type1);
		pstmt.setString(4, item_type2);
		pstmt.setString(5, item_option);
		pstmt.setInt(6, item_price);
		pstmt.setInt(7, item_discount_rate);
		pstmt.setInt(8, 0);				//item_sells
		pstmt.setInt(9, item_remains);
		pstmt.setString(10, LocalDateTime.now().toString());//item_regist_date
		pstmt.setString(11, item_memo);
		
		rs = pstmt.executeQuery();

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