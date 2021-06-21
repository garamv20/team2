<%@page import="myUtil.HanConv"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 admin이 verified여야 페이지가 보임
	String verified = (String)session.getAttribute("admin");
%>
<script>
if("<%=verified%>" != "verified"){
	alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
	location.href="login.jsp";
}
</script>
<%
	//리퀘스트 값들을 받아옴
	int item_number = Integer.parseInt((String)request.getParameter("item_number"));
	
	//받아왔으면 DB에 추가해야지?
	boolean add_success = false;

	try{
		//MySQL 접속, team2/1234
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = con.prepareStatement("delete from options where item_number=?");
		pstmt.setInt(1, item_number);
		
		pstmt.executeUpdate();

		add_success = true;
		System.out.println("옵션 삭제 성공");
	}catch(Exception e){
		add_success = false;
		e.printStackTrace();
		System.out.println("옵션 삭제 실패");
	}			
	
	out.println(item_number);
			
%>
<script>
if(<%=add_success%>==true){
	alert("옵션 삭제 성공");
	location.href="show_items.jsp";
}
if(<%=add_success%>==false){
	alert("옵션 삭제 실패");
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