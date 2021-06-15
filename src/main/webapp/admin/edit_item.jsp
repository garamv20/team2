<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
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
	String item_type = null;
	String item_name = null;
	int item_price = 0;
	double item_discount_rate = 0;
	Date item_register_date = null;
	String item_memo = null;
	
	try{
		//MySQL 접속, team2/1234
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
		//값들을 하나하나 넣어주기
		while(rs.next()){
			item_type = rs.getString(2);
			item_name = rs.getString(3);
			item_price = rs.getInt(4);
			item_discount_rate = rs.getDouble(5);
			item_register_date = rs.getDate(6);
			item_memo = rs.getString(7);
		}

		System.out.println("DB 접속 성공");
	}catch(Exception e){
		System.out.println("DB 접속 실패");
	}
%>

<form name="form" method="post" action="add_item_ok.jsp">
<table>
<tr><td>상품번호</td><td><%=item_number %></td></tr>
<tr><td>상품종류</td>
<td><select name="item_type">
<option value="아우터">아우터</option>
<option value="상의">상의</option>
<option value="하의">하의</option>
<option value="언더웨어">언더웨어</option>
<option value="슈즈">슈즈</option>
<option value="악세사리">악세사리</option>
</select></td></tr>
<tr><td>상품명*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>가격*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>할인률</td>
<td><input type="number" name="item_discount_rate" value="0"></td></tr>
<tr><td>등록일자</td><td><%=item_register_date %></td></tr>
<tr><td>메모</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td>상품 이미지*</td><td><input type="file" name="item_image"></td></tr>
<tr><td>상품설명 이미지*</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="register" value="등록하기" onClick="click_register()"></td></tr>
</table>
</form>
<script>
	//불러온 값들을 토대로 빈칸을 채워주기
	form.item_type.value = "<%=item_type%>";
	form.item_name.value = "<%=item_name%>";
	form.item_price.value = <%=item_price%>;
	form.item_discount_rate = <%=item_discount_rate%>;
	form.item_memo = "<%=item_memo%>";
</script>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
</script>
</body>
</html>