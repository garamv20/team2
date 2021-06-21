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
</script><!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>매출(주문) 관리 페이지</title>
</head>
<body>
<table>
<tr>
<td>주문번호</td>
<td>주문상태</td>
<td>아이디</td>
<td>연락처</td>
<td>주소</td>
<td>수량</td>
<td>가격</td>
<td>결제방법</td>
<td>점수</td>
<td>의견</td>
<td>메모</td>
<td>주문일자</td>
</tr>

</table>
<%
boolean show_items_success;
try{
	//MySQL 접속, team2/1234
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
		//있는대로 하나씩 하나씩 출력하자.
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
	System.out.println("주문 조회 성공");
}catch(Exception e){
	show_items_success = false;
	System.out.println("주문 조회 실패");
	e.printStackTrace();
}	

%>
</body>
</html>