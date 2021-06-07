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
<title>상품 수정</title>
</head>
<body>
<%
	String item_number = request.getParameter("item_number");
	String item_name = null;
	String item_type1 = null;
	String item_type2 = null;
	String item_option = null;
	String item_price = null;
	String item_discount_rate = null;
	String item_sells = null;
	String item_remains = null;
	String item_register_date = null;
	String item_memo = null;
	
	try{
		//오라클 DB 접속, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("select * from items where item_number=?");
		pstmt.setString(1, item_number);
		rs = pstmt.executeQuery();
		//값들을 하나하나 넣어주기
		while(rs.next()){
			item_name = rs.getString(2);
			item_type1 = rs.getString(3);
			item_type2 = rs.getString(4);
			item_option = rs.getString(5);
			item_price = rs.getString(6);
			item_discount_rate = rs.getString(7);
			item_sells = rs.getString(8);
			item_remains = rs.getString(9);
			item_register_date = rs.getString(10);
			item_memo = rs.getString(11);
		}

		System.out.println("DB 접속 성공");
	}catch(Exception e){
		System.out.println("DB 접속 실패");
	}
%>
<form name="form" method="post" action="edit_item_ok.jsp">
<table>
<tr><td>상품 번호</td>
<td><input type="text" name="item_number" value="<%=item_number%>" readonly></td></tr>
<tr><td>상품명</td>
<td><input type="text" name="item_name" value="<%=item_name%>"></td></tr>
<tr><td>종류1</td>
<td><input type="text" name="item_type1" value="<%=item_type1%>"></td></tr>
<tr><td>종류2</td>
<td><input type="text" name="item_type2" value="<%=item_type2%>"></td></tr>
<tr><td>옵션</td>
<td><input type="text" name="item_option" value="<%=item_option%>"></td></tr>
<tr><td>할인률</td>
<td><input type="text" name="item_discount_rate" value="<%=item_discount_rate%>"></td></tr>
<tr><td>판매량</td>
<td><input type="text" name="item_sells" value="<%=item_sells%>"></td></tr>
<tr><td>재고량</td>
<td><input type="text" name="item_remains" value="<%=item_remains%>"></td></tr>
<tr><td>등록일</td>
<td><input type="text" name="item_register_date" value="<%=item_register_date%>"></td></tr>
<tr><td>메모</td>
<td><input type="text" name="item_memo" value="<%=item_memo%>"></td></tr>
<tr><td>상품 이미지</td><td><input type="file" name="item_image"></td></tr>
<tr><td>상품설명 이미지</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="edit" value="수정하기" onClick="click_edit()"></td></tr>
</table>
</form>
<script>
	function click_edit(){
		//예외처리
		form.submit();
	}
</script>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
</script>
</body>
</html>