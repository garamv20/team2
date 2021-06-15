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
<script>
if("<%=verified%>" != "verified"){
	alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
	location.href="login.jsp";
}
</script>
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
<td>상품명</td>
<td>가격</td>
<td>할인률</td>
<td>등록일</td>
<td>메모</td>
</tr>

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

		pstmt = con.prepareStatement("select * from items order by item_number desc");
		rs = pstmt.executeQuery();
		while(rs.next()){
			//있는대로 하나씩 하나씩 출력하자.
			out.write("<tr><td>"+rs.getInt(1)+"</td>"
					+ "<td>"+rs.getString(2)+"</td>"
					+ "<td>"+rs.getString(3)+"</td>"
					+ "<td>"+rs.getInt(4)+"</td>"
					+ "<td>"+rs.getInt(5)+"</td>"
					+ "<td>"+rs.getDate(6)+"</td>"
					+ "<td>"+rs.getString(7)+"</td>");
			
			//옵션이 있는 지 조회하고 있으면 하나씩 추가하자
				try{
					pstmt = con.prepareStatement("select * from option where item_number=?");
					
					pstmt.setInt(1,rs.getInt(1));
					ResultSet rs_o = null;
					while(rs_o.next()){
						out.write("<td>"+rs_o.getString("option1")+rs_o.getString("option2")+rs_o.getInt("sell")+rs_o.getInt("reamains")+"</td>");
					}
					System.out.println("옵션조회 성공");
				}catch(Exception e){
					System.out.println("옵션조회 실패");
					e.printStackTrace();
				}
			
			out.write("<td><a href='add_option.jsp?item_number="+rs.getInt(1)+"'>옵션 추가</a></td>"
					+ "<td><a href='edit_item.jsp?item_number="+rs.getInt(1)+"'>수정</a></td>"
					+ "<td><a href='delete_item_ok.jsp?item_number="+rs.getInt(1)+"'>삭제</a></td></tr>");
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
	if(<%=show_items_success%>==true){
		alert("상품 조회 성공");
	}
	if(<%=show_items_success%>==false){
		alert("DB 오류, 상품 조회 실패");
		history.back();
	}
</script>
</body>
</html>