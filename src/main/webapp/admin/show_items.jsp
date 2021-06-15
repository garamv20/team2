<%@page import="myUtil.HanConv"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 admin이 verified여야 페이지가 보임
	String verified = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>판매 상품 목록</title>
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
<td>상품번호</td>
<td>상품종류</td>
<td>종류1</td>
<td>종류2</td>
<td>옵션</td>
<td>가격</td>
<td>할인률</td>
<td>판매량</td>
<td>재고량</td>
<td>등록일</td>
<td>메모</td>
</tr>

<%
	boolean show_items_success;
	try{
		//오라클 DB 접속, scott/tiger
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
			//있는대로 하나씩 하나씩 출력하자.
			out.write("<td>"+rs.getInt(1)+"</td>"
					+ "<td>"+rs.getString(2)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getString(4)+"</td>"
					+ "<td>"+rs.getString(5)+"</td>"
					+ "<td>"+rs.getInt(6)+"</td>"
					+ "<td>"+rs.getInt(7)+"</td>"
					);
		}

		show_items_success = true;
		System.out.println("상품 조회 성공");
	}catch(Exception e){
		show_items_success = false;
		System.out.println("상품 조회 실패");
	}
%>

</table>
<a href="add_item.jsp">상품 등록</a>

<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
	if(<%=show_items_success%>==true){
		alert("상품 조회 성공");
	}
	if(<%=show_items_success%>==false){
		alert("상품 조회에 실패했습니다.");
		history.back();
	}
</script>
</body>
</html>