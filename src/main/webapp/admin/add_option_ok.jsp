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
    
<%
	//������Ʈ ������ �޾ƿ�
	int item_number = Integer.parseInt((String)request.getParameter("item_number"));
	String option1 = HanConv.toKor((String)request.getParameter("option1"));
	String option2 = HanConv.toKor((String)request.getParameter("option2"));
	int sell = Integer.parseInt((String)request.getParameter("sell"));
	int remains = Integer.parseInt((String)request.getParameter("remains"));
	
	//�޾ƿ����� DB�� �߰��ؾ���?
	boolean add_success = false;

	try{
		//MySQL ����, team2/1234
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = con.prepareStatement("insert into options values(?,?,?,?,?)");
		pstmt.setInt(1, item_number);
		pstmt.setString(2, option1);
		pstmt.setString(3, option2);
		pstmt.setInt(4, sell);
		pstmt.setInt(5, remains);
		
		pstmt.executeUpdate();

		add_success = true;
		System.out.println("�ɼ� �߰� ����");
	}catch(Exception e){
		add_success = false;
		e.printStackTrace();
		System.out.println("�ɼ� �߰� ����");
	}			
	
	out.println(item_number);
	out.println(option1);
	out.println(option2);
	out.println(sell);
	out.println(remains);
			
%>
<script>
if(<%=add_success%>==true){
	alert("�ɼ� �߰� ����");
	location.href="show_items.jsp";
}
if(<%=add_success%>==false){
	alert("�ɼ� �߰� ����");
	location.href="show_items.jsp";
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>